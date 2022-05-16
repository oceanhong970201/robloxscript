local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Impossible Glass Bridge Obby", "BloodTheme")
local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Others")
local Section = Tab1:NewSection("Main")
local Section2 = Tab2:NewSection("Other")

Section:NewButton("Remove Kill Parts", "Remove Kill Parts", function()
    while true and task.wait() do
        for i,v in pairs(game:GetService("Workspace")["Glass Bridge"].GlassPane:GetDescendants()) do
           if v.Name == 'TouchInterest' then
               v.Parent.Transparency = 1
               end
           end
        end
end)

Section:NewButton("Insta Win", "Insta win", function()
    local MoneyPart = game:GetService("Workspace")["Glass Bridge"].Finish:FindFirstChild("TouchInterest", true).Parent
    local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
    
    firetouchinterest(Root, MoneyPart, 0)
    firetouchinterest(Root, MoneyPart, 1)
end)
--\\ Other Stuff//--
Section2:NewSlider("Walkspeed Changer", "Walkspeed Changer", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section2:NewSlider("Jumppower Changer", "Jumppower Changer", 500, 0, function(a) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower  = a
end)

Section2:NewKeybind("F to toggle on/off", "F", Enum.KeyCode.F, function()
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
