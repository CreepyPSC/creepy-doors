local HttpService = game:GetService("HttpService")
local request = (syn and syn.request) or (http and http.request) or http_request
local onlineVersion, discordCode = loadstring(game:HttpGet("https://raw.githubusercontent.com/CreepyPSC/creepy-doors/main/A-90/a90-datascript.lua"))()
local scriptVersion = 2
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local a90Module = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90
local l__TweenService__1 = game:GetService("TweenService");
local l__LocalPlayer__2 = game.Players.LocalPlayer;
local u1 = a90Module:FindFirstAncestor("MainUI");

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
    if not _G.DamagePlayer then
        if _G.DeveloperPrints then
            warn("_G.DamagePlayer is disabled | "..tostring(damage).." damage was going to be dealt to player.")
        end
        return
    end
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
	if p1.dead then
		return;
	end;
	local l__Jumpscare_A90__3 = u1.Jumpscare.Jumpscare_A90;
	l__Jumpscare_A90__3.BackgroundTransparency = 1;
	l__Jumpscare_A90__3.Face.Visible = true;
	l__Jumpscare_A90__3.FaceAngry.Visible = false;
	l__Jumpscare_A90__3.Static.Visible = true;
	l__Jumpscare_A90__3.Static2.Visible = true;
	l__Jumpscare_A90__3.Static.ImageTransparency = 1;
	l__Jumpscare_A90__3.Static2.ImageTransparency = 1;
	game.SoundService.Main.Volume = 0;
	l__Jumpscare_A90__3.Face.ImageColor3 = Color3.new(0, 0, 0);
	l__Jumpscare_A90__3.Face.Position = UDim2.new(math.random(10, 90) / 100, 0, math.random(10, 90) / 100, 0);
	l__Jumpscare_A90__3.Visible = true;
	a90Module.Spawn.SoundGroup = nil;
	a90Module.Hit.SoundGroup = nil;
	a90Module.Spawn:Play();
	task.wait(0.03333333333333333);
	l__Jumpscare_A90__3.Face.ImageColor3 = Color3.new(1, 1, 1);
	task.wait(0.48);
	l__Jumpscare_A90__3.BackgroundTransparency = 0;
	l__Jumpscare_A90__3.Face.Position = UDim2.new(0.5, 0, 0.49, 0);
	task.wait(0.03333333333333333);
	l__Jumpscare_A90__3.StopIcon.Visible = true;
	l__Jumpscare_A90__3.BackgroundColor3 = Color3.new(0, 0, 0);
	l__Jumpscare_A90__3.BackgroundTransparency = 1;
	l__Jumpscare_A90__3.Static.ImageTransparency = 0.8;
	l__Jumpscare_A90__3.Static2.ImageTransparency = 0.8;
	local u2 = true;
	local u3 = false;
	local l__LookVector__4 = p1.cam.CFrame.LookVector;
	task.delay(0.4, function()
		l__Jumpscare_A90__3.StopIcon.Visible = false;
		while u2 do
			task.wait(0.03333333333333333);
			l__Jumpscare_A90__3.Static.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0);
			l__Jumpscare_A90__3.Static.Rotation = math.random(0, 1) * 180;
			l__Jumpscare_A90__3.Static2.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0);
			l__Jumpscare_A90__3.Static2.Rotation = math.random(0, 1) * 180;
			l__Jumpscare_A90__3.Face.Position = UDim2.new(0.5, 0, 0.49, math.random(-1, 1));
			l__Jumpscare_A90__3.FaceAngry.Position = UDim2.new(0.5 + math.random(-100, 100) / 50000, 0, 0.49 + math.random(-100, 100) / 30000, math.random(-1, 1));
			local v4 = math.random(0, 1);
			l__Jumpscare_A90__3.FaceAngry.ImageColor3 = Color3.new(1, v4, v4);
			if not u3 then
				if (l__LookVector__4 - p1.cam.CFrame.LookVector).Magnitude > 0.4 then
                    if not _G.DetectCameraMovement then
                        print("_G.DetectCameraMovement is disabled | Camera: Movement detected.");
                        return
                    end
                    if _G.DeveloperPrints then
				    	print("Camera: Movement detected.");
                    end
					u3 = true;
				end;
				if p1.hum.MoveDirection.Magnitude > 0.4 then
                    if not _G.DetectCharacterMovement then
                        print("_G.DetectCharacterMovement is disabled | Character: Movement detected.");
                        return
                    end
                    if _G.DeveloperPrints then
					    print("Character: Movement detected.");
                    end
					u3 = true;
				end;
			end;		
		end;
	end);
	task.wait(0.5);
	l__Jumpscare_A90__3.BackgroundColor3 = Color3.new(0, 0, 0);
	l__Jumpscare_A90__3.BackgroundTransparency = 0;
	l__Jumpscare_A90__3.Static.ImageTransparency = 0;
	l__Jumpscare_A90__3.Static2.ImageTransparency = 0.5;
	task.wait(0.03333333333333333);
	l__Jumpscare_A90__3.Face.ImageColor3 = Color3.new(1, 0, 0);
	task.wait(0.03333333333333333);
	l__Jumpscare_A90__3.Visible = false;
	task.wait(0.08);
	if u3 then
		l__Jumpscare_A90__3.Visible = true;
		a90Module.Hit:Play();
		task.wait(0.03333333333333333);
		l__Jumpscare_A90__3.Face.ImageColor3 = Color3.new(1, 1, 1);
		task.wait(0.03333333333333333);
		l__Jumpscare_A90__3.BackgroundTransparency = 0;
		l__Jumpscare_A90__3.Static.ImageTransparency = 0;
		l__Jumpscare_A90__3.Static2.ImageTransparency = 0.5;
		task.wait(0.06666666666666667);
		l__Jumpscare_A90__3.FaceAngry.ImageColor3 = Color3.new(1, 0, 0);
		l__Jumpscare_A90__3.FaceAngry.Visible = true;
		task.wait(0.06666666666666667);
		l__Jumpscare_A90__3.FaceAngry.ImageColor3 = Color3.new(1, 1, 1);
		l__Jumpscare_A90__3.Face.Visible = false;
		l__Jumpscare_A90__3.FaceAngry.Size = UDim2.new(0.8, 0, 0.8, 0);
		task.wait(0.75);
		game.ReplicatedStorage.EntityInfo.A90:FireServer(u3);
        DamagePlayer(game.Players.LocalPlayer, _G.DamageAmount)
		task.wait(0.1);
		l__Jumpscare_A90__3.FaceAngry.Visible = false;
		l__Jumpscare_A90__3.BackgroundColor3 = Color3.new(1, 1, 1);
		l__Jumpscare_A90__3.Static.ImageTransparency = 1;
		l__Jumpscare_A90__3.Static2.ImageTransparency = 1;
		task.wait(0.06666666666666667);
		l__Jumpscare_A90__3.BackgroundColor3 = Color3.new(1, 0, 0);
		task.wait(0.06666666666666667);
		l__Jumpscare_A90__3.BackgroundColor3 = Color3.new(0, 0, 0);
		task.wait(0.06666666666666667);
	else
		a90Module.Spawn:Stop();
		l__Jumpscare_A90__3.BackgroundTransparency = 1;
		game.ReplicatedStorage.EntityInfo.A90:FireServer(false);
	end;
	u2 = false;
	game.SoundService.Main.Volume = 1;
	l__Jumpscare_A90__3.Visible = false;
end;

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
