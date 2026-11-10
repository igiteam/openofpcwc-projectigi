# openofpcwc-projectigi
## Operation Flashpoint: Cold War Crisis — Project I.G.I. Remake
A total conversion project that fuses the open-world military sandbox of *Operation Flashpoint: Cold War Crisis* (2001) with the stealth-infiltration tension and close-quarters gunplay of *Project I.G.I.* (2000), built on the open-sourced Poseidon engine source.

## Operation Flashpoint: Cold War Crisis
This repository holds the engine and game source code (codename *Poseidon*) - the game first released in 2001 as *Operation Flashpoint: Cold War Crisis*. The code has been modernized to C++20, built with CMake and Clang, with cross-platform support for Windows x64 and Linux x64.

## Github Treeview
[https://treegit.macosxjs.com/?url=igiteam/openofpcwr](https://treegit.macosxjs.com/?url=igiteam/openofpcwr)

## Github Tree Api Direct JSON
[https://api.github.com/repos/igiteam/openofpcwr/git/trees/main?recursive=1](https://api.github.com/repos/igiteam/openofpcwr/git/trees/main?recursive=1)

## Poseidon WASM (browser build)
[https://motionmark.itch.io/poseidonwasm](https://motionmark.itch.io/poseidonwasm)

## Operation Flashpoint: Cold War Crisis
[![Operation Flashpoint: Cold War Crisis](https://raw.githubusercontent.com/igiteam/openofpcwc/refs/heads/main/operation-flashpoint-find-the-car-mission.png)](https://www.youtube.com/watch?v=CH3JswOpzIQ)

## WS11WineCX20.0.4 (MacOSX Big Sur 32bit)
[WS11WineCX20.0.4.tar.7z](https://github.com/vitor251093/porting-kit-engines/releases/download/wineskin/WS11WineCX20.0.4.tar.7z)

[![wine windows games on macosx](https://raw.githubusercontent.com/igiteam/igi1-macbook-3d-workstation/refs/heads/main/wine-engine-config.png)](https://github.com/igiteam/wine_engines)

## openofpcwc-projectigi
[https://github.com/igiteam/openofpcwc-projectigi](https://github.com/igiteam/openofpcwr)

[![openofpcwc-projectigi](https://raw.githubusercontent.com/igiteam/openofpcwr/refs/heads/main/Operation-Flashpoint-Cold-War-Crisis-Free.jpg)](https://github.com/igiteam/openofpcwr)

## Operation Flashpoint - Cold War Crisis 2001
[![Operation Flashpoint - Cold War Crisis 2001](https://raw.githubusercontent.com/igiteam/openofpcwr/refs/heads/main/operation-flashpoint-cold-war-crisis-cd-cover.jpg)](https://archive.org/details/Nova_OperationFlashpointCWCUSA)

## Bohemia Interactive Editing Tools Bundle 1.6gb
[![Bohemia Interactive Editing Tools Bundle 1.6gb](https://raw.githubusercontent.com/igiteam/openofpcwc/refs/heads/main/wrpedit-0-93-beta.png)](https://archive.org/details/bohemia-interactive-editing-tools) 

## Digimask SDK
[![Digimask SDK](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/refs/heads/main/digimask-wireframe.png)](https://archive.org/details/digimask-launchpad2-2002)

[DigimaskPS2.txt](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/refs/heads/main/digimaskps2.txt)

[This is Football 2005 PS2 Digimask](https://archive.org/download/PS2_COLLECTION_PART25/This%20Is%20Football%202005%20%28Europe%29%20%28En%2CEs%2CPt%2CAr%29.zip)

## opflash_-_uber_editor_tutorial
[![opflash_-_uber_editor_tutorial](https://raw.githubusercontent.com/igiteam/opflash_-_uber_editor_tutorial_FlipBook/refs/heads/main/opflash_-_uber_editor_tutorial_page_1.png)](https://igiteam.github.io/opflash_-_uber_editor_tutorial_FlipBook/)

## Operation Flashpoint: Cold War Crisis Tutorials
[https://archive.org/details/tutorials-ofp](https://archive.org/details/tutorials-ofp)

[https://archive.org/details/rinza_ofp_tutorials_eng](https://archive.org/details/rinza_ofp_tutorials_eng)

[![Operation Flashpoint Tutorials](https://img.youtube.com/vi/Rce72rPMGu0/maxresdefault.jpg)](https://www.youtube.com/playlist?list=PLb8oNKiUbnjFTciA4gaSJ2w1PmcAfNo4Q)

[https://archive.org/details/Eidos_Project_IGI_Im_Going_In_Windows_2001_ENG](https://archive.org/details/Eidos_Project_IGI_Im_Going_In_Windows_2001_ENG)

[![Project IGI - I'm Going In](https://archive.org/download/Eidos_Project_IGI_Im_Going_In_Windows_2001_ENG/Eidos%20Project%20IGI%20Im%20Going%20In%20-%20CD.jpg)](https://archive.org/details/Eidos_Project_IGI_Im_Going_In_Windows_2001_ENG)


## Project I.G.I. (2000) to Operation Flashpoint: Cold War Crisis

Format conversion map for the `opencwc-projectigi` total conversion.

---

## Conversion Map

| IGI 1 Format | IGI Role | OFP CWC Target | OFP Role | Difficulty | Notes |
|---|---|---|---|---|---|
| `.hmp` | Terrain heightmap tiles (16-bit elevation) | `.wrp` (4WVR) Elevations | Terrain height data | Medium | OFP stores elevations as ushort in cm. Convert IGI grid to `Elevations[Ysize][Xsize]`; `RealHeight = value * 0.05` for metres. |
| `.lmp` | Terrain grayscale lightmap (8-bit) | `.wrp` TextureIndex | Per-cell texture reference | High | No direct OFP terrain-lightmap slot in 4WVR. Bake into textures, discard, or approximate. |
| `.ctr` + `.cmd` | Terrain octree + mesh LOD commands | `.wrp` terrain grid (implicit) | Fixed 256x256 cell grid | High | No direct mapping. Flatten the IGI octree into a uniform heightmap before export. LOD structure is discarded. |
| `.bit` | Terrain 1-bit raycast mask | `.wrp` collision (implicit) | Collision from heightmap | Low | Not needed as a separate asset; OFP derives collision from the heightmap. Use only to verify accuracy. |
| `.mef` | 3D model geometry | `.p3d` (ODOL7) | Model geometry | High | MEF type versions (32B/40B) have no direct P3D equivalent. Requires Oxygen 2 or Oxygen Light. Scale conversion needed. |
| `.tex` | Texture bitmaps | `.paa` / `.pac` | OFP textures | Medium | Convert to PAA/PAC. OFP `.wrp` references textures in a 512-entry table of 32-byte ASCIIZ filenames. |
| `.olm` | Object static lightmaps | `.p3d` vertex lighting / `.paa` baked | Object lighting | High | No direct slot; rebake lighting in Oxygen or export as texture overlays. |
| `.mtp` | Model-texture package | `.p3d` + `.paa` | Model material assignment | Medium | Reconstruct material mappings in Oxygen's P3D structure. |
| `.graph` / `.dat` | AI navigation graph | OFP AI (no direct file) | Engine-internal pathfinding | Very High | No external navmesh format. Discard AI paths or approximate via mission-editor waypoints. |
| `.qvm` / `.qsc` | Script bytecode / source | `.sqs` / `.sqf` | OFP scripting | Very High | QVM opcodes unrelated to SQF/SQS. Scripts must be rewritten, not converted. |
| `.spr` | 2D billboarding sprites | `.paa` with alpha | Textured quads | Medium | Export as PAA, place as P3D quads with `ViewDensity` transparency. |
| `.pic` | Static menu pictures | `.paa` | UI textures | Low | Direct image conversion. |
| `.fnt` | Bitmap font atlas | OFP fonts (`.fxy` + `.paa`) | UI text | Medium | OFP uses FXY descriptor + PAA atlas; remap glyphs. |
| `.iff` / `.bef` | Skeletal animation | `.rtm` | Animation | Very High | Must be retargeted / re-authored in Oxygen. |
| `.wav` | Innerloop audio samples | `.wss` (or OGG) | Audio | Medium | Convert to WSS or OGG depending on OFP version support. |
| `.afp` / `.avi` | Video / intro packages | `.ogv` | OFP cutscenes | Low | Re-encode to Theora/OGV. |
| `.res` | Resource archive | `.pbo` | Addon archive | Medium | Repack converted assets into PBO via MakePbo or BinPbo. |

---

## Key Conversion Constraints

1. **Terrain is the hardest bottleneck.** OFP's `.wrp` format is strictly a 256x256 uniform grid with per-cell texture indices. IGI's octree-based LOD terrain (`.ctr`/`.cmd`) must be baked down to a flat heightmap. You lose IGI's LOD optimization — the OFP terrain will be simpler but will load and render in the CWR engine.

2. **Models must go through Oxygen.** There is no direct MEF-to-P3D converter. You need Bohemia's Oxygen 2 (or Oxygen Light) to author `.p3d` files. If the IGI `.mef` can be exported to an intermediate format (OBJ/3DS), it can then be imported into Oxygen. Note that 3DS-to-P3D conversion requires a 10x scale increase.

3. **Binarize for final packaging.** After authoring `.wrp` in 4WVR (via WrpTool/Visitor) and `.p3d` in Oxygen, use Binarize to convert to engine-optimized OPRW/ODOL formats. Use the old Binarize for `.wrp` islands and the new Binarize for `.p3d` models.

4. **Scripts and AI are not convertible.** QVM bytecode has no mapping to SQF. AI navigation (`.graph`) has no file-level counterpart. These must be reimplemented — which is why this is a total conversion, not a port.

5. **The `Project-IGI-Terrain/` folder already handles the terrain path.** That code parses `.hmp`/`.lmp`/`.ctr`/`.cmd`/`.bit` — it is the source side of the terrain conversion. The missing piece is the export step: a 4WVR `.wrp` writer that emits the OFP header, elevation array, texture index array, texture filename table, and model list.
6. 
---

## Quick Start

```sh
cmake --preset win-x64-clang-rwdi
cmake --build build/win-x64-clang-rwdi
```

On GNU/Linux, use the matching `linux-x64-clang-rwdi` preset.

## Layout

- [Apps](apps/README.md) - executable targets
- [Engine](engine/README.md) - engine libraries and Rust Trident tooling
- [Master server tools](mserver/README.md) - Rust service and CLI crates
- [Tests](tests/README.md) - test source trees; CI currently compiles them only
- `cmake/` - presets, toolchains, vcpkg triplets, and overlay ports
- `docker/` - container support for service and runtime environments
- `packages/` - ignored local game data staging area
- `resources/` - application icon resources
- `thirdparty/` - vendored third-party headers and sources

## Dev Environment

**Official White Wii Remote With Nunchuk — Tested And Working — £14.99**
[https://www.ebay.co.uk/itm/800847189353](https://www.ebay.co.uk/itm/800847189353)

**Infrared Sensor Bar USB for Wii Emulator Remote Motion Detection Setup — £6.69**
[https://www.ebay.co.uk/itm/227423830875](https://www.ebay.co.uk/itm/227423830875)

**Apple MacBook Pro Retina 15in (2014) i7 2.8GHz 16GB 1TB SSD GT 750M — £120.30**
[https://www.ebay.co.uk/itm/800844561513](https://www.ebay.co.uk/itm/800844561513)

**WS11WineCX20.0.4 (Wine engine)**
[https://igiteam.github.io/wine_engines/](https://igiteam.github.io/wine_engines/)

**Official Genuine Sony PS3 PlayStation 3 DualShock 3 Wireless Controller Black — £19.99**
[https://www.ebay.co.uk/itm/840031043465](https://www.ebay.co.uk/itm/840031043465)

**Amazon Basics 4K HDMI Cable 3m — 18Gbps High Speed with Ethernet, 4K@60Hz, 2160p — £8.44**
[https://www.ebay.co.uk/itm/327352257557](https://www.ebay.co.uk/itm/327352257557)

**wiimote_nunchuk_macosx**
[https://github.com/igiteam/wiimote-nunchuk](https://github.com/igiteam/wiimote-nunchuk)

**xbox360_input_gui_py**
[https://github.com/igiteam/xbox360_input_gui_py](https://github.com/igiteam/xbox360_input_gui_py)

**logitec_mx_mouse_3_macos**
[https://github.com/igiteam/logitec_mx_mouse_3_macos](https://github.com/igiteam/logitec_mx_mouse_3_macos)

**igi1-macbook-3d-workstation**
[https://github.com/igiteam/igi1-macbook-3d-workstation](https://github.com/igiteam/igi1-macbook-3d-workstation)

---
