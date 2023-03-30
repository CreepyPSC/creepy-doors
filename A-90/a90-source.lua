local HttpService = game:GetService("HttpService")
local request = (syn and syn.request) or (http and http.request) or http_request
local onlineVersion, discordCode = loadstring(game:HttpGet("https://raw.githubusercontent.com/CreepyPSC/creepy-doors/main/A-90/a90-datascript.lua"))()
local scriptVersion = 2
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local v3 = game:GetService("TweenService")
local v6 = game.Players.LocalPlayer.PlayerGui.MainUI
local v9 = game.Players.LocalPlayer
local script1 = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90

function promptdiscord(forceinvite)
	local invitecode
	if discordCode then
		invitecode = discordCode
	end
	if forceinvite then
		invitecode = forceinvite;
	end
	if invitecode == nil then
		warn("Can't get invite code.")
		return
	end
	if request then
		request({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = HttpService:JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = HttpService:GenerateGUID(false),
				args = {code = invitecode}
			})
		})
	end
end
function alert(title, text, timee)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 5;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(184, 0, 0),Time = timee or 5, Type = "image"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
	)
end
function DamagePlayer(player, damage)
	if _G.DeveloperPrints then
		warn(tostring(damage).." damage was just dealt to player.")
	end
	player.Character.Humanoid.Health = player.Character.Humanoid.Health - damage
	game.ReplicatedStorage.GameStats["Player_"..game.Players.LocalPlayer.Name].Total.DeathCause = "A-90"
	game.ReplicatedStorage.GameStats["Player_"..game.Players.LocalPlayer.Name].Total.DeathReason = "A-90"
end
--[[if scriptData == nil then
	alert("DOORS A-90 Script", "Failed to script data, Please join our discord for support. discord.gg/"..tostring("BHQD5vvNxs"), 10)
	promptdiscord("BHQD5vvNxs")
	return
end]]
if onlineVersion == nil then
	alert("DOORS A-90 Script", "Failed to fetch script version, Please join our discord for support. discord.gg/"..tostring("BHQD5vvNxs"), 10)
	promptdiscord("BHQD5vvNxs")
	return
end
if game.PlaceId ~= 6839171747 and game.PlaceId ~= 6516141723 then
	alert("DOORS A-90 Script", "This script only works in doors, Please retry.", 10)
	wait(1)
	alert("DOORS A-90 Script", "If you are in a doors then please report this issue to our discord. discord.gg/"..tostring(discordCode), 15)
	promptdiscord()
	return
elseif game.PlaceId == 6516141723 then
	alert("DOORS A-90 Script", "Please start a match before executing the script.", 15)
	return
end
if scriptVersion ~= onlineVersion then
	alert("DOORS A-90 Script", "Your script is out of date, Please get a new script from our discord. discord.gg/"..tostring(discordCode))
	promptdiscord()
	return
end
if _G.A90SCRIPTACTIVATED == true then
	alert("DOORS A-90 Script", "You have already executed the script, If it hasn't loaded then join our discord. discord.gg/"..tostring(discordCode))
	promptdiscord()
	return
end
_G.A90SCRIPTACTIVATED = true;
warn("DOORS A-90 Script - Made by @WCreepyOfficial")
warn("These developer logs are to stop people from stealing the script and taking all my credit.")
alert("DOORS A-90 Script", "The script is loading, Please wait.", 10)

function A90()
	local p1 = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
    local v10 = p1.dead
    if v10 then
        return 
    end
    local v12 = v6.Jumpscare
    v10 = v12.Jumpscare_A90
    v10.BackgroundTransparency = 1
    v10.Face.Visible = true
    v10.FaceAngry.Visible = false
    v10.Static.Visible = true
    v10.Static2.Visible = true
    v10.Static.ImageTransparency = 1
    v10.Static2.ImageTransparency = 1
    game.SoundService.Main.Volume = 0
    v10.Face.ImageColor3 = Color3.new(0, 0, 0)
    local v27 = UDim2.new(math.random(10, 90) / 100, 0, math.random(10, 90) / 100, 0)
    v10.Face.Position = v27
    v10.Visible = true
    local v253 = false
    local v254 = true
    script1.Spawn.SoundGroup = nil
    script1.Hit.SoundGroup = nil
    script1.Spawn:Play()
    task.wait(0.033333333333333)
    v10.Face.ImageColor3 = Color3.new(1, 1, 1)
    task.wait(0.48)
    v10.BackgroundTransparency = 0
    v10.Face.Position = UDim2.new(0.5, 0, 0.49, 0)
    task.wait(0.033333333333333)
    v10.StopIcon.Visible = true
    local v48 = Color3.new(0, 0, 0)
    v10.BackgroundColor3 = v48
    v10.BackgroundTransparency = 1
    v10.Static.ImageTransparency = 0.8
    v10.Static2.ImageTransparency = 0.8
    task.delay(0.4, function()
        local v53 = v10.StopIcon
        v53.Visible = false
            v53 = v27
            if not v53 then
                return
            end
            task.wait(0.033333333333333)
            v10.Static.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0)
            v10.Static.Rotation = math.random(0, 1) * 180
            v10.Static2.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0)
            v10.Static2.Rotation = math.random(0, 1) * 180
            v10.Face.Position = UDim2.new(0.5, 0, 0.49, math.random(-1, 1))
            v10.FaceAngry.Position = UDim2.new(0.5 + math.random(-100, 100) / 50000, 0, 0.49 + math.random(-100, 100) / 30000, math.random(-1, 1))
            local v105 = math.random(0, 1)
            local v111 = Color3.new(1, v105, v105)
            v10.FaceAngry.ImageColor3 = v111
            local v150 = v12
            if v150 then
                v114 = p1.hum.MoveDirection.Magnitude
                local v155 = 0.4
                if v114 > v155 then
					if not _G.DetectCharacterMovement then
						if _G.DeveloperPrints then
							warn("A-90 detected character movement but player was saved because _G.DetectCharacterMovement equals false.")
						end
						return
					end
                   if _G.DeveloperPrints then
						warn("A-90 just detected player moving character.")
					end
                    v253 = true
                end
				 local v153 = 0.4
                if p1.cam.CFrame.p.Magnitude - v267.WorldPosition > v153 then
					if not _G.DetectCameraMovement then
						if _G.DeveloperPrints then
							warn("A-90 detected camera movement but player was saved because _G.DetectCameraMovement equals false.")
						end
						return
					end
					if _G.DeveloperPrints then
						warn("A-90 just detected player moving camera.")
					end
                    v253 = true
                end
            end
    end)
    task.wait(0.5)
    v10.BackgroundColor3 = Color3.new(0, 0, 0)
    v10.BackgroundTransparency = 0
    v10.Static.ImageTransparency = 0
    v10.Static2.ImageTransparency = 0.5
    task.wait(0.033333333333333)
    v10.Face.ImageColor3 = Color3.new(1, 0, 0)
    task.wait(0.033333333333333)
    v10.Visible = false
    task.wait(0.08)
    if v253 then
        v10.Visible = true
        script1.Hit:Play()
        task.wait(0.033333333333333)
        v10.Face.ImageColor3 = Color3.new(1, 1, 1)
        task.wait(0.033333333333333)
        v10.BackgroundTransparency = 0
        v10.Static.ImageTransparency = 0
        v10.Static2.ImageTransparency = 0.5
        task.wait(0.066666666666667)
        v10.FaceAngry.ImageColor3 = Color3.new(1, 0, 0)
        v10.FaceAngry.Visible = true
        task.wait(0.066666666666667)
        v10.FaceAngry.ImageColor3 = Color3.new(1, 1, 1)
        v10.Face.Visible = false
        v10.FaceAngry.Size = UDim2.new(0.8, 0, 0.8, 0)
        task.wait(0.75)
        game.ReplicatedStorage.EntityInfo.A90:FireServer(v253)
		DamagePlayer(game.Players.LocalPlayer, 90)
        task.wait(0.1)
        v10.FaceAngry.Visible = false
        v10.BackgroundColor3 = Color3.new(1, 1, 1)
        v10.Static.ImageTransparency = 1
        v10.Static2.ImageTransparency = 1
        task.wait(0.066666666666667)
        v10.BackgroundColor3 = Color3.new(1, 0, 0)
        task.wait(0.066666666666667)
        v10.BackgroundColor3 = Color3.new(0, 0, 0)
        task.wait(0.066666666666667)
    else
        script1.Spawn:Stop()
        v10.BackgroundTransparency = 1
        game.ReplicatedStorage.EntityInfo.A90:FireServer(false)
    end
    local v316 = false
    game.SoundService.Main.Volume = 1
    v10.Visible = false
end
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
 if key == _G.Keybind and _G.SpawnableA90 then
	if _G.DeveloperPrints then
		warn("You spawned A-90, he will attack in 3 seconds.")
	end
	if _G.CheatNotifications then
		alert("A-90 Alert", "You spawned A-90, he will attack in 3 seconds.", 3)
	end
	wait(3)
	A90()
 end
end)
wait(10)
alert("DOORS A-90 Script", "Loaded Successfully, Please remember that this will not work in the real rooms.", 5)
promptdiscord()
wait(5)
alert("DOORS A-90 Script", "This script was made by @WCreepyOfficial on Roblox.", 10)
wait(10)
while _G.RandomA90 == true do
	local waitTime = math.random(5, 60)
	if _G.DeveloperPrints then
		warn("A-90 will attack in "..tostring(waitTime+3).." seconds.")
	end
	if _G.CheatNotifications then
		alert("A-90 Alert", "A-90 will attack in "..tostring(waitTime+3).." seconds.")
	end
	wait(waitTime)
	if _G.DeveloperPrints then
		warn("A-90 will attack in 3 seconds.")
	end
	if _G.CheatNotifications then
		alert("A-90 Alert", "A-90 will attack in 3 seconds.", 3)
	end
	wait(3)
	A90()
end
