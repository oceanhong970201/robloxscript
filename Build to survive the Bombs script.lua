local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Build to survive the Bombs!", "DarkTheme")
local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Others")
local Section = Tab1:NewSection("Farm")
local Section2 = Tab2:NewSection("Others")

Section:NewButton("Tp to safe place", "Tp to safe place", function()
    local BuildPart = Instance.new("Part",game.Workspace) --Directory of The Part
    BuildPart.Size = Vector3.new(100,10,100) 	              --The Size of the Part
    BuildPart.Position = Vector3.new(196, -200, 73)      --The Position of The Part
    BuildPart.Anchored = true                          --Anchores The Part                           --Anchores The Part
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(196, -190, 73)
end)

Section:NewButton("Invisible", "Invisible", function()
    Local = game:GetService('Players').LocalPlayer
    Char  = Local.Character
    touched,tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.25)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0,.5,0))
        end
    end)
    game:GetService('UserInputService').InputBegan:connect(function(key)
        if key.KeyCode == Enum.KeyCode.Equals then
            if script.Disabled ~= true then
                script.Disabled = true
                print'you may re-execute'
            end
        end
    end)
    box = Instance.new('Part',workspace)
    box.Anchored = true
    box.CanCollide = true
    box.Size = Vector3.new(10,1,10)
    box.Position = Vector3.new(0,10000,0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.25)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end end
                if Char then
                    apply()
                end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0,.5,0))
end)

Section:NewToggle("Auto Safe", "Teleports You To Safe place!", function(state)
    if state then
        local BuildPart = Instance.new("Part",game.Workspace) --Directory of The Part
        BuildPart.Size = Vector3.new(100,10,100) 	              --The Size of the Part
        BuildPart.Position = Vector3.new(196, -200, 73)      --The Position of The Part
        BuildPart.Anchored = true                          --Anchores The Part
    getgenv().Farming1 = true
            while Farming1 == true do
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(196, -190, 73)
                wait(1)
    end
else
    getgenv().Farming1 = false
    end
end)

Section:NewLabel("You have to insert the player name and press Q to use")

Section:NewButton("(press)Tp to player by insert their name", "insert player name and press Q to PLAYERS", function()


    local ScreenGui = Instance.new("ScreenGui")
    local TextBox = Instance.new("TextBox")
    
   
    
    ScreenGui.Parent = game.CoreGui
    
    TextBox.Parent = ScreenGui
    TextBox.BackgroundColor3 = Color3.new(0.333333, 0.333333, 0.333333)
    TextBox.Position = UDim2.new(0, 0, 1, -25)
    TextBox.Size = UDim2.new(0, 150, 0, 25)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.Text = "Insert Player Name"
    TextBox.TextColor3 = Color3.new(1, 1, 1)
    TextBox.TextScaled = true
    TextBox.TextSize = 14
    TextBox.TextWrapped = true
    
   
    
    
    
    game:GetService("UserInputService").InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.Q then --Replace E with the key you would like to be pressed
    local ooooooof = TextBox.Text
    local plr1 = game.Players.LocalPlayer.Character
    local plr2 = game.Workspace:FindFirstChild(ooooooof)
    plr1.HumanoidRootPart.CFrame = plr2.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
    end
    end)
end)

Section2:NewButton("Redeem Codes", "Redeem Codes", function()
    local args = {[1] = "BOOM"}
    game:GetService("ReplicatedStorage").Events.RedeemCode:InvokeServer(unpack(args))
end)

Section2:NewKeybind("Press F to open/close", "KeybindInfo", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)

Section2:NewLabel("Made by Hai#5694")
Section2:NewLabel("Anti-AFK is always on")

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
