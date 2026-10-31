# openofpcwc-projectigi
## Operation Flashpoint: Cold War Assault — Project I.G.I. Remake
A total conversion project that fuses the open-world military sandbox of *Operation Flashpoint: Cold War Crisis* (2001) with the stealth-infiltration tension and close-quarters gunplay of *Project I.G.I.* (2000), built on the open-sourced Poseidon engine source.

## Operation Flashpoint: Cold War Assault
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
[DigimaskPS2.txt]([https://archive.org/details/digimask-launchpad2-2002](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/refs/heads/main/digimaskps2.txt))

## opflash_-_uber_editor_tutorial
[![opflash_-_uber_editor_tutorial](https://raw.githubusercontent.com/igiteam/opflash_-_uber_editor_tutorial_FlipBook/refs/heads/main/opflash_-_uber_editor_tutorial_page_1.png)](https://igiteam.github.io/opflash_-_uber_editor_tutorial_FlipBook/)

---

## Wiimote+Nunchuk, MX Mouse Keys, Xbox360 Controller
[https://github.com/igiteam/logitec_mx_mouse_3_macos](https://github.com/igiteam/logitec_mx_mouse_3_macos)

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


