repeat task.wait() until game:IsLoaded();
task.wait(5);
repeat task.wait() until game and game.Workspace and game.Players;

local Player = game.Players.LocalPlayer    
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

function Farm()
    spawn(function()
        for i,v in pairs(game:GetService("Workspace").CurrentMap:GetChildren()) do
            if string.find(v.Name,"Checkpoint") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Checkpoint, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Checkpoint, 1)
                wait()
            end
            if string.find(v.Name,"Goal") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Goal, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Goal, 1)
                wait()
            end
        end
    end)
end
Farm()
wait(3)
local _place,_id = game.PlaceId, game.JobId
local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Next; repeat
   local Servers = ListServers(Next)
   for i,v in next, Servers.data do
       if v.playing < v.maxPlayers and v.id ~= _id then
           local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
           if s then break end
       end
   end
   
   Next = Servers.nextPageCursor
until not Next
