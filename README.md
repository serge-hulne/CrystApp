
# CrystApp
Desktop apps Development framework for Crystal-lang

<img width="807" alt="Screenshot 2023-02-03 at 16 57 52" src="https://user-images.githubusercontent.com/303502/216673349-1131c4d5-75d8-4a58-948e-5069a7f0fa38.png">

# Webview apps written in Crystal
- Self-contained.
- Single file, statically compiled.
- Easy to distribute.
- ***100 times smaller than an Electron app***
- Faster and more energy cosuming than an electron app.
- Safer than Electron.js : Statically compiled and statically typed : most bugs are caught at compile time (not at run-time)

# In short:
- "Wails for Crystal".
- "Electron for Crystal.

(The alpha version uses a Makefile as CLI for the moment)

# Prerequisites:
- npm (for Svelte)
- Crystal

# TODO
[TODO.md](https://github.com/serge-hulne/CrystApp/blob/main/TODO.md)

# THANKS
- A big thank to the Rucksack development team (https://github.com/m-o-e), https://github.com/busyloop/rucksack
- A big thanks to the Crystal developers team : straight-shoota
- A big thanks to npn (on https://forum.crystal-lang.org) 

# USES
- Crystal: https://crystal-lang.org
- Svelte (with Vite): https://svelte.dev
- Webview : https://github.com/naqvis/webview
- Rucsack : https://github.com/busyloop/rucksack
- npm (in order to install Svelte).

# Mac OS and Linux
-  Should work as is.

# Windows
- The system will have to be modified slighly to accomodate for the current lack of multi-threading in Crystal under Winwows.

# DEMO (alpha version)
- `git clone https://github.com/serge-hulne/CrystApp`
- `cd CrystApp`
- `make init`
- `make init_svelte`
- `make svelte_build`
- `make app_test`

# To run the app again without re-building it
- `open .` (and click on the app's icon)
or
- `open App.app`
or 
- `make run`
  
