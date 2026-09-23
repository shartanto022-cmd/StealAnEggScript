-- Steal An Egg - External Loader
-- For your own game/project.
-- Upload Main.lua to a public raw URL, then replace MAIN_URL below.

local MAIN_URL = "https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPOSITORY/main/Main.lua"

local ok, source = pcall(function()
    return game:HttpGet(MAIN_URL)
end)

if not ok then
    warn("[StealAnEgg Loader] HttpGet failed:", source)
    return
end

if type(source) ~= "string" or source == "" then
    warn("[StealAnEgg Loader] Empty response.")
    return
end

local chunk, compileError = loadstring(source)

if not chunk then
    warn("[StealAnEgg Loader] Compile error:", compileError)
    return
end

local runOk, runError = pcall(chunk)

if not runOk then
    warn("[StealAnEgg Loader] Runtime error:", runError)
    return
end

print("[StealAnEgg Loader] Loaded successfully.")
