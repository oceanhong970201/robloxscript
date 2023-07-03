if not game:IsLoaded() then
    repeat wait() until game:IsLoaded()
end
if game.PlaceId == 5149673492 then 
if _G.Theme == "" then
    _G.Theme = "BloodTheme"
end

local vu = game:GetService("VirtualUser")
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib(tostring(GameName), _G.Theme)
local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Others")
local Section = Tab1:NewSection("Farm")
local Section2 = Tab2:NewSection("Others")
--\\serverhop -cridit to CharWar
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
Section:NewButton("Tp to safe place", "Tp to safe place", function()
    local BuildPart = Instance.new("Part",game.Workspace) --Directory of The Part
    BuildPart.Size = Vector3.new(100,10,100) 	              --The Size of the Part
    BuildPart.Position = Vector3.new(196, -200, 73)      --The Position of The Part
    BuildPart.Anchored = true                          --Anchores The Part                           --Anchores The Part
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(196, -190, 73)
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


local playerlist = {}
local selectedplayer = nil
for i,v in pairs(game.Players:GetPlayers())do
   if v ~= game.Players.LocalPlayer then
       table.insert(playerlist,v.Name)
   end
end

local dropdown = Section:NewDropdown("Players","Players", playerlist, function(plr)
    selectedplayer = plr
end)

game.Players.PlayerAdded:Connect(function(player)
   local name = player.Name
   table.insert(playerlist,name)
   dropdown:Refresh(playerlist)
end)

game.Players.PlayerRemoving:Connect(function(player)
   local name = player.Name
   for i,v in pairs(playerlist)do
       if v == name then  
           table.remove(playerlist,i)
       end
   end
   dropdown:Refresh(playerlist)
end)

Section:NewButton("Tp", "Tp", function()
    players = game:GetService("Players")
    target = players:FindFirstChild(selectedplayer)
    players.LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position)
end)

--\\section2//--
Section2:NewButton("Redeem Codes", "Redeem Codes", function()
    local CodesTable = {"BOOM","15K","AMOGUS"}
    for i = 1, 2 do
        for i ,v in pairs(CodesTable) do
            game:GetService("ReplicatedStorage").Events.RedeemCode:InvokeServer(v)
        end
    end
end)
Section2:NewButton("Rejoin Server", "Rejoin Server", function()
    pcall(function ()
        spawn(function ()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end)
    end)
end)
Section2:NewButton("ServerHop", "ServerHop", function()
    pcall(function ()
        spawn(function ()
            Teleport()
        end)
    end)
end)
Section2:NewSlider("Walkspeed Changer", "Walkspeed Changer", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section2:NewSlider("Jumppower Changer", "Jumppower Changer", 500, 50, function(a) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower  = a
end)
Section2:NewKeybind("Press F to open/close", "KeybindInfo", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)

Section2:NewLabel("Made by (_　_)。゜zｚＺ#0850")
Section2:NewLabel("Anti-AFK is always on")

game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)
end

print("loaded")
--\\end//--
