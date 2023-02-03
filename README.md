
# CrystApp
Desktop apps Development framework for Crystal-lang

<img width="807" alt="Screenshot 2023-02-03 at 16 57 52" src="https://user-images.githubusercontent.com/303502/216673349-1131c4d5-75d8-4a58-948e-5069a7f0fa38.png">

# Webview apps written in Crystal
- Self-contained.
- Single file, statically compiled.
- Easy to distribute.

# In short:
- "Wails for Crystal".
- "Electron for Crystal.

(The alpha version uses a Makefile as CLI for the moment)

# TODO
- Add support for Svelte (it also provides a dev server for client side).
- in dev phase, switch to Svelte dev server port (bypass Crystal server).
- Check interoperability Crystal <-> JavaScript/TypeScript. Provide examples.
- Make determination of port automatic.
- Disable "Reload" in "release" mode
- Create example apps on separate Git repo's.


# USES
- Crystal: https://crystal-lang.org
- Svelte (with Vite): https://svelte.dev
- Webview : https://github.com/naqvis/webview
- Rucsack : https://github.com/busyloop/rucksack

# Mac OS and Linux
-  Should work as is.

# Windows
- The system will have to be modified slighly to accomodate for the current lack of multi-threading in Crystal under Winwows.
  
