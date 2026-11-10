#!/usr/bin/env bash
#
# github_nested_url.sh
#
# Ask for a GitHub URL, clone it as a nested directory inside the current
# repository, strip the inner .git so it becomes regular tracked files,
# then commit and push.
#
# Usage:
#   ./github_nested_url.sh
#
# Requires: git, and push access to the current repo's remote.

set -euo pipefail

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

info()  { printf '\033[1;34m[info]\033[0m %s\n' "$*"; }
warn()  { printf '\033[1;33m[warn]\033[0m %s\n' "$*"; }
error() { printf '\033[1;31m[error]\033[0m %s\n' "$*" >&2; }
die()   { error "$*"; exit 1; }

ask_yes_no() {
    local prompt="$1" reply
    while true; do
        read -r -p "$prompt (y/n): " reply
        case "$reply" in
            [Yy]) return 0 ;;
            [Nn]) return 1 ;;
            *) echo "Please answer y or n." ;;
        esac
    done
}

# ---------------------------------------------------------------------------
# Sanity checks
# ---------------------------------------------------------------------------

command -v git >/dev/null 2>&1 || die "git is not installed."

git rev-parse --is-inside-work-tree >/dev/null 2>&1 \
    || die "Not inside a git repository. cd into your target repo first."

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"
info "Working in repository: $REPO_ROOT"

# ---------------------------------------------------------------------------
# Ask for the URL
# ---------------------------------------------------------------------------

echo
read -r -p "GitHub URL to clone (e.g. https://github.com/owner/repo or owner/repo): " GH_URL

[ -n "${GH_URL:-}" ] || die "No URL provided."

# Accept "owner/repo" shorthand -> full https URL
if [[ "$GH_URL" =~ ^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$ ]]; then
    GH_URL="https://github.com/${GH_URL}"
fi

# Accept git@github.com:owner/repo.git and normalise to https
if [[ "$GH_URL" =~ ^git@github\.com:(.+)$ ]]; then
    GH_URL="https://github.com/${BASH_REMATCH[1]}"
fi

# Strip trailing .git and trailing slash
GH_URL="${GH_URL%.git}"
GH_URL="${GH_URL%/}"

[[ "$GH_URL" =~ ^https://github\.com/[^/]+/[^/]+$ ]] \
    || die "Unrecognised GitHub URL: $GH_URL"

DIR_NAME="$(basename "$GH_URL")"
info "Target directory: $DIR_NAME"
info "Clone URL:        $GH_URL"

# ---------------------------------------------------------------------------
# Clone (or reuse existing directory)
# ---------------------------------------------------------------------------

if [ -e "$DIR_NAME" ]; then
    warn "Directory '$DIR_NAME' already exists."
    if [ -d "$DIR_NAME/.git" ]; then
        info "Found existing clone — reusing it."
    else
        ask_yes_no "It has no .git (already stripped). Continue and re-add it?" \
            || die "Aborted."
    fi
else
    info "Cloning $GH_URL ..."
    git clone --depth 1 "$GH_URL" "$DIR_NAME"
fi

# ---------------------------------------------------------------------------
# Strip the nested .git so it becomes normal files
# ---------------------------------------------------------------------------

if [ -d "$DIR_NAME/.git" ]; then
    info "Removing nested .git from $DIR_NAME ..."
    rm -rf "$DIR_NAME/.git"
    info "Nested .git removed."
else
    info "No nested .git to remove."
fi

# ---------------------------------------------------------------------------
# Replace any existing gitlink (mode 160000) with tracked files
# ---------------------------------------------------------------------------

if git ls-files -s -- "$DIR_NAME" | grep -q '^160000 '; then
    info "Detected gitlink for '$DIR_NAME' — converting to tracked files."
    git rm --cached -r --quiet -- "$DIR_NAME" || true
else
    info "No gitlink in index for '$DIR_NAME'."
fi

# Also handle the case where .gitmodules references it
if [ -f .gitmodules ] && grep -q "path = $DIR_NAME" .gitmodules; then
    warn ".gitmodules references '$DIR_NAME' — removing that entry."
    git config -f .gitmodules --remove-section "submodule.$DIR_NAME" 2>/dev/null || true
    if [ ! -s .gitmodules ]; then
        rm -f .gitmodules
    fi
    git add .gitmodules 2>/dev/null || true
fi

# Stage the directory as regular files
info "Staging $DIR_NAME as regular files ..."
git add -- "$DIR_NAME"

# Verify
if git ls-files -s -- "$DIR_NAME" | grep -q '^160000 '; then
    die "Still seeing mode 160000 after staging — aborting. Check $DIR_NAME manually."
fi

FILE_COUNT="$(git ls-files -- "$DIR_NAME" | wc -l | tr -d ' ')"
info "Staged $FILE_COUNT files from $DIR_NAME."

if [ "$FILE_COUNT" -eq 0 ]; then
    warn "No files staged. The directory may be empty or ignored by .gitignore."
    git check-ignore -v "$DIR_NAME" 2>/dev/null || true
    ask_yes_no "Continue anyway?" || die "Aborted."
fi

# ---------------------------------------------------------------------------
# Commit
# ---------------------------------------------------------------------------

if git diff --cached --quiet; then
    info "Nothing to commit — index already matches HEAD."
else
    git status --short -- "$DIR_NAME" | head -20
    echo
    ask_yes_no "Commit these changes?" || die "Aborted."

    DEFAULT_MSG="Add $DIR_NAME as tracked files (was nested repo)"
    read -r -p "Commit message [$DEFAULT_MSG]: " COMMIT_MSG
    COMMIT_MSG="${COMMIT_MSG:-$DEFAULT_MSG}"

    git commit -m "$COMMIT_MSG"
    info "Committed."
fi

# ---------------------------------------------------------------------------
# Push (with a rebase retry if rejected)
# ---------------------------------------------------------------------------

ask_yes_no "Push to origin?" || { info "Skipping push."; exit 0; }

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
info "Pushing $BRANCH to origin ..."

if ! git push origin "$BRANCH"; then
    warn "Push rejected — remote has moved. Trying pull --rebase then retry."
    git pull --rebase origin "$BRANCH"
    git push origin "$BRANCH"
fi

info "Done. '$DIR_NAME' is now tracked as regular files and pushed."