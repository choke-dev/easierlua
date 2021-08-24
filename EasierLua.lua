---@diagnostic disable: undefined-global, undefined-field, deprecated

-- Ensure compatibility with other exploits if not executed on Synapse:
if not syn and not getgenv().CompatibilityEnabled then loadstring(game:HttpGet("https://irisapp.ca/api/Scripts/IrisBetterCompat.lua"))() getgenv().CompatibilityEnabled = true end 

local easierLua = {}

-- Important functions that are required for other functions to work must be put here:
    easierLua.GetRootOfPlayer = function(char)
        local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
        return rootPart
    end

-- Load all functions of easierLua:

-- Environment:

-- Environment: ClickDetectors
    easierLua.GetClickDetectorsWithinDistance = function(instance, distance, match)
        local found = {}
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ClickDetector") and (instance.Position - v.Parent.Position).Magnitude <= distance then
                if match == nil then
                    table.insert(found, v)
                elseif match ~= nil and v.Name:match(match) then
                    table.insert(found, v)
                end
            end
        end
            return found
    end
    easierLua.fireClickDetectorsWithinDistance = function(instance, distance, match)
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ClickDetector") and (instance.Position - v.Parent.Position).Magnitude <= distance then
                if match == nil then
                    fireclickdetector(v)
                elseif match ~= nil and v.Name:match(match) then
                    fireclickdetector(v)
                end
            end
        end     
    end
    easierLua.fireChildClickDetectors = function(instance, match)
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("ClickDetector") then
                if match == nil then
                    fireclickdetector(v)
                elseif match ~= nil and v.Name:match(match) then
                    fireclickdetector(v)
                end
            end
        end     
    end

    easierLua.fireDescendantClickDetectors = function(instance, match)
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA("ClickDetector") then
                if match == nil then
                    fireclickdetector(v)
                elseif match ~= nil and v.Name:match(match) then
                    fireclickdetector(v)
                end
            end
        end 
    end

-- Players
    easierLua.GetPositionOfPlayer = function(player)
        return easierLua.GetRootOfPlayer(player).Position
    end
    easierLua.MoveTo = function(Coordinates)
        local c = string.split(Coordinates, ",")
        easierLua.GetRootOfPlayer(game.Players.LocalPlayer.Character).CFrame = CFrame.new(tonumber(c[1]), tonumber(c[2]), tonumber(c[3]))
    end

-- Instances
    easierLua.GetChildrenOfClass = function(instance, class, match)
        local found = {}
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA(tostring(class)) then
                if match == nil then
                    table.insert(found, v)
                elseif match ~= nil and v.Name:match(match) then
                    table.insert(found, v)
                end
            end
        end
            return found
    end
    easierLua.ClearAllChildrenOfClass = function(instance, class, storeInMemory)
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA(tostring(class)) then
                if storeInMemory == true then
                    v.Parent = nil
                else
                    v:Destroy()
                end 
            end
        end 
    end
    easierLua.GetDescendantsOfClass = function(instance, class, match)
        local found = {}
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA(class) then
                    if match == nil then
                        table.insert(found, v)
                    elseif match ~= nil and v.Name:match(match) then
                        table.insert(found, v)
                    end
                end
            end
            return found
        end
    easierLua.ClearAllDescendantsOfClass = function(instance, class, storeInMemory)
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA(class) then
                if storeInMemory == true then
                    v.Parent = nil
                else
                    v:Destroy()
                end
            end
        end 
    end
-- Miscellaneous
    easierLua.promptDiscordInvite = function(inviteLink)
        syn.request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                cmd = "INVITE_BROWSER",
                args = {
                    code = tostring(inviteLink)
                },
                nonce = {}
            }),
         })
    end

-- Return the table with all the functions:
return easierLua 
