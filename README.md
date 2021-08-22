# easierLua - *making games easier to exploit*
- treee#0001
- choke#3588

## How to use easierLua
Add this line of code to load **easierLua**.
```lua
local easierLua = loadstring(game:HttpGet('https://raw.githubusercontent.com/choke-dev/easierlua/main/EasierLua.lua'))()
```
To use functions of easierLua, replace FunctionNameHere with the function you want to use.
```lua
easierLua.FunctionNameHere()
```

## Additional Information
Functions in easierLua do not use coroutines or spawns to [multi-thread](https://devforum.roblox.com/t/help-with-understanding-threads-and-multithreading/700243).

# Functions

## Environment
### > LocalPlayer
  MoveToPosition
```lua
easierLua.MoveToPosition(<string> Position)
```
Teleports the LocalPlayer to <string> Position.

