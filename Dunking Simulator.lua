local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("By Hai#5694", "BloodTheme")
local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Others")
local Section = Tab1:NewSection("Andy is dog")
local Section2 = Tab2:NewSection("Other")

Section:NewTextBox("Enter cash amount", "cash amount", function(txt)
local args = {[1] = game:GetService("Players").LocalPlayer.ownedShoes["12"],[2] = 0,[3] = txt,}
game:GetService("ReplicatedStorage").Remote.Shoes.SellShoes:FireServer(unpack(args))
end)

Section:NewButton("Rebitth", "Rebitth", function()
    game:GetService("ReplicatedStorage").Rebirth:FireServer()
end)

Section:NewToggle("Auto rebirth", "Auto rebirth", function(state)
if state then
getgenv().Farming1 = true
        while Farming1 == true do
                local args = {[1] = game:GetService("Players").LocalPlayer.ownedShoes["12"],[2] = 0,[3] = 99e999,}
                game:GetService("ReplicatedStorage").Remote.Shoes.SellShoes:FireServer(unpack(args))
                game:GetService("ReplicatedStorage").Rebirth:FireServer()
            wait()
            end
else
getgenv().Farming1 = false
end
end)

Section2:NewSlider("Walkspeed Changer", "Walkspeed Changer", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

Section:NewLabel("Made by Hai#5694")
Section2:NewLabel("Anti-AFK is always on")
Section2:NewLabel("Andy is dog wof~wof~")
Section2:NewLabel("Andy is dumb")
Section:NewLabel("GG for the game")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
