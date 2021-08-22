---@diagnostic disable: undefined-global, undefined-field

    local easierLua = {}

    easierLua.GetRootOfPlayer = function(char)
        local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
        return rootPart
    end
    -- Proper arrangement

    easierLua.GetChildClickDetectors = function(instance, returnName)
        local found = {}
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("ClickDetector") then
                if returnName == true then
                table.insert(found, v.Name)
                elseif returnName == false then
                    table.insert(found, "game."..v:GetFullName())
                else
                    return nil
                end
            end 
        end
        return found
    end
    easierLua.GetClickDetectorsWithinDistance = function(instance, distance, returnName)
        local found = {}
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ClickDetector") and (instance.Position - v.Parent.Position).Magnitude <= distance then
                if returnName == true then
                table.insert(found, v.Name)
                elseif returnName == false then
                    table.insert(found, "game."..v:GetFullName())
                else
                    return nil
                end
            end 
        end
        return found
    end
    easierLua.fireClickDetectorsWithinDistance = function(instance, distance)
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ClickDetector") and (instance.Position - v.Parent.Position).Magnitude <= distance then
                fireclickdetector(v)
                end
            end     
        end
    easierLua.fireChildClickDetectors = function(instance)
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
                end
            end     
        end
    easierLua.fireChildClickDetectorsContainingName = function(instance, string)
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA("ClickDetector") and tostring(v.Name):match(tostring(string)) then
                fireclickdetector(v)
                end
            end 
        end
        easierLua.GetDescendantClickDetectors = function(instance, returnName)
            local found = {}
            for i,v in pairs(instance:GetDescendants()) do
                if v:IsA("ClickDetector") then
                    if returnName == true then
                    table.insert(found, v.Name)
                    elseif returnName == false then
                        table.insert(found, "game."..v:GetFullName())
                    else
                        return nil
                    end
                end 
            end
            return found
        end
    easierLua.fireDescendantClickDetectors = function(instance)
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
        end 
    end
    easierLua.fireDescendantClickDetectorsContainingName = function(instance, string)
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA("ClickDetector") and tostring(v.Name):match(tostring(string)) then
                fireclickdetector(v)
            end
        end 
    end
    easierLua.GetPositionOfPlayer = function(player)
        return easierLua.GetRootOfPlayer(player).Position
    end
    easierLua.MoveToPosition = function(Coordinates)
        local c = string.split(Coordinates, ",")
        easierLua.GetRootOfPlayer(game.Players.LocalPlayer.Character).CFrame = CFrame.new(tonumber(c[1]), tonumber(c[2]), tonumber(c[3]))
    end
    easierLua.GetChildrenOfClass = function(instance, class, returnName)
        local found = {}
        for i,v in pairs(instance:GetChildren()) do
            if v:IsA(tostring(class)) then
                if returnName == true then
                table.insert(found, v.Name)
                elseif returnName == false then
                    table.insert(found, "game."..v:GetFullName())
                else
                    return nil
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
    easierLua.GetDescendantsOfClass = function(instance, class, returnName)
        local found = {}
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA(tostring(class)) then
                if returnName == true then
                table.insert(found, v.Name)
                elseif returnName == false then
                    table.insert(found, "game."..v:GetFullName())
                else
                    return nil
                end
            end 
        end
        return found
    end
    easierLua.ClearAllDescendantsOfClass = function(instance, class, storeInMemory)
        for i,v in pairs(instance:GetDescendants()) do
            if v:IsA(tostring(class)) then
                if storeInMemory == true then
                    v.Parent = nil
                else
                    v:Destroy()
                end 
            end
        end 
    end
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

    return easierLua
