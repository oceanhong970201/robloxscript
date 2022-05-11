local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("By Hai#5694", "BloodTheme")
local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Others")
local Section4 = Tab1:NewSection("Andy is dog")
local Section5 = Tab2:NewSection("Other")

Section4:NewToggle("GG ANDY OK", "ANDY", function(state)
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

Section5:NewLabel("Made by Hai#5694")
Section5:NewLabel("Anti-AFK is always on")
Section5:NewLabel("Andy is dog wof~wof~")
Section5:NewLabel("Andy is dumb")
Section5:NewLabel("GG for the game")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)