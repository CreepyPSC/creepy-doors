-- [[  Loader  ]] --
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local scriptVersion, scriptDiscord = loadstring(game:HttpGet('https://raw.githubusercontent.com/CreepyPSC/creepy-doors/main/creepy-doorsdata.lua'))()
local scriptKey = "creepyontop123@123.yes"
local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
local Window = Rayfield:CreateWindow({
	Name = "Creepy Doors",
	LoadingTitle = "Loading...",
	LoadingSubtitle = "Version "..scriptVersion,
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Rayfield Interface Suite",
		FileName = "CreepyDoors-Save"
	},
    Discord = {
        Enabled = true,
        Invite = scriptDiscord; -- The Discord invite code, do not include discord.gg/
        RememberJoins = false; -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Creepy Doors",
		Subtitle = "Password Required",
		Note = "This script is locked via password, Please enter to continue.",
		FileName = "CreepyDoors-Key",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = scriptKey
	}
})

-- [[  Tabs  ]] --
local AutoFarmingTab = Window:CreateTab("Auto Farm", 4483362458)
local SpawnTab = Window:CreateTab("Spawn Monsters", 10110576663)
local OtherTab = Window:CreateTab("Items", 7818923311)
local EventTab = Window:CreateTab("Events", 7818981800)
local DoorTab = Window:CreateTab("Monsters Every Door", 6506779980)
local GuisTab = Window:CreateTab("Other GUIs", 11233340291)
local CreditsTab = Window:CreateTab("Credits", 11233340291)

-- [[  Items  ]] --
local Paragraph = OtherTab:CreateParagraph({Title = "Note", Content = "Crucifix works on only spawned entities, hold q and click an item to use it on objects instead of entities."})
local CrucifixButton = OtherTab:CreateButton({
	Name = "Give Crucifix",
	Callback = function()
        _G.SpawnableCrucifix = true; -- makes it so you can spawn a crucifix, this is client sided only so it only works on client entities (aka spawned entities) or client objects.
        _G.Skin = "Default"; -- set to default for the regular skin, or use love because those are the only skins.
        _G.Uses = 1; -- how many uses can be done with the crucifix before it deletes
        _G.Range = 30; -- the range of the crucifix, the higher number you set means the further you can reach objects with it.
        _G.OnAnything = true; -- makes it so you can use it on objects, hold q and press an object to use. if you set this to false you'll only be able to use it on spawned entities not real ones.
        loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
	end,
})
local Paragraph2 = OtherTab:CreateParagraph({Title = "Note", Content = "Shears can delete anything your looking at, Be careful not to delete the whole room."})
local ShearsButton = OtherTab:CreateButton({
	Name = "Give Shears",
	Callback = function()
        local Tool = game:GetObjects("rbxassetid://12685165702")[1]
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        local Sound = Instance.new("Sound")
        local Idle = Tool.Animations.idle
        local IdleTrack = Humanoid:LoadAnimation(Idle)
        Tool.Parent = game.Players.LocalPlayer.Backpack
        
        Sound.PlaybackSpeed = 1.25
        Sound.SoundId = "rbxassetid://9118823101"
        Sound.Parent = Tool
        
        Tool.Activated:Connect(function()
            local Use = Tool.Animations.use
            local UseTrack = Humanoid:LoadAnimation(Use)
            UseTrack:Play()
            Sound:Play()
            wait(0.25)
            Sound:Play()
            game:GetService("Players").LocalPlayer:GetMouse().Target:FindFirstAncestorOfClass("Model"):Destroy()
        end)
        
        Tool.Equipped:Connect(function()
            IdleTrack:Play()
        end)
        Tool.Unequipped:Connect(function()
           IdleTrack:Stop()
        end)
	end,
})
local INFVitaminsButton = OtherTab:CreateButton({
	Name = "Give INF Vitamins",
	Callback = function()
        getgenv().CustomVitamins = {
            SpeedBoost = 5,
            EffectDuration = 25
        }
        local tool = game:GetObjects("rbxassetid://12827538877")[1]
        tool.Parent = game.Players.LocalPlayer.Backpack
        
        local anim = Instance.new("Animation")
        anim.Name = "idle"
        anim.AnimationId = "rbxassetid://10479585177"
        local idle = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        
        local anim = Instance.new("Animation")
        anim.Name = "open"
        anim.AnimationId = "rbxassetid://10482563149"
        local use = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        
        tool.Equipped:Connect(function()
            idle:Play()
        end)
        
        tool.Unequipped:Connect(function()
            idle:Stop()
        end)
        
        local using = false
        tool.Activated:Connect(function()
            if using == false then
                using = true
                use:Play()
                tool.Handle.sound_open:Play()
                task.wait(0.5)
                --tool:Destroy()
                use:Stop()
                local OldSpeedBoost = game.Players.LocalPlayer.Character.Humanoid:GetAttribute("SpeedBoost")
                game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost", getgenv().CustomVitamins.SpeedBoost + OldSpeedBoost)
                task.wait(getgenv().CustomVitamins.EffectDuration)
                using = false
                game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost", OldSpeedBoost)
            end
        end)
	end,
})
local VitaminsButton = OtherTab:CreateButton({
	Name = "Give Vitamins",
	Callback = function()
        getgenv().CustomVitamins = {
            SpeedBoost = 5,
            EffectDuration = 25
        }
        local tool = game:GetObjects("rbxassetid://12827538877")[1]
        tool.Parent = game.Players.LocalPlayer.Backpack
        
        local anim = Instance.new("Animation")
        anim.Name = "idle"
        anim.AnimationId = "rbxassetid://10479585177"
        local idle = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        
        local anim = Instance.new("Animation")
        anim.Name = "open"
        anim.AnimationId = "rbxassetid://10482563149"
        local use = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        
        tool.Equipped:Connect(function()
            idle:Play()
        end)
        
        tool.Unequipped:Connect(function()
            idle:Stop()
        end)
        
        local using = false
        tool.Activated:Connect(function()
            if using == false then
                using = true
                use:Play()
                tool.Handle.sound_open:Play()
                task.wait(0.5)
                using = false
                tool:Destroy()
                use:Stop()
                local OldSpeedBoost = game.Players.LocalPlayer.Character.Humanoid:GetAttribute("SpeedBoost")
                game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost", getgenv().CustomVitamins.SpeedBoost + OldSpeedBoost)
                task.wait(getgenv().CustomVitamins.EffectDuration)
                game.Players.LocalPlayer.Character.Humanoid:SetAttribute("SpeedBoost", OldSpeedBoost)
            end
        end)
	end,
})
local IcecreamButton = OtherTab:CreateButton({
	Name = "Give Icecream",
	Callback = function()
        getgenv().CustomIcecream = {
            SpeedBoost = 5,
            EffectDuration = 120
        }
        loadstring(game:HttpGet('https://raw.githubusercontent.com/CreepyPSC/creepy-doors/main/icecream-source.lua'))()
	end,
})
local ShakelightButton = OtherTab:CreateButton({
	Name = "Give Shakelight",
	Callback = function()
        local tool = game:GetObjects("rbxassetid://12939196676")[1]
        tool.Parent = game.Players.LocalPlayer.Backpack
        local idle = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(tool.Animations.idle)
        local shake = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(tool.Animations.shake)
        tool:SetAttribute("Durability", 20)
        tool.Handle.Neon.PointLight.Brightness = 2;
        tool.Handle.Neon.Attachment.SurfaceLight.Brightness = 2;
        tool.Handle.Neon.LightAttach.SurfaceLight.Brightness = 2;
        tool.Equipped:Connect(function()
            idle:Play()
        end)
        tool.Unequipped:Connect(function()
             idle:Stop()
        end)
        local using = false
        tool.Activated:Connect(function()
             if using == false then
                using = true
                shake:Play()
                tool.Handle.sound_shake:Play()
		        wait(0.185)
                using = false
            end
        end)
	end,
})
local ScannerButton = OtherTab:CreateButton({
	Name = "Give Scanner",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
	end,
})

-- [[ Farming ]] --

local DeathFarmingNotif = AutoFarmingTab:CreateParagraph({Title = "Death Farmer", Content = "Use this Death Farmer to AFK grind deaths, Please have 1 revive before starting."})
local DeathFarming = AutoFarmingTab:CreateButton({
	Name = "Start Death Auto-Farm",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Doors%20Death%20Farmer"))()
	end,
})

-- [[  Entities  ]] --

local EntityWarning = SpawnTab:CreateParagraph({Title = "Note", Content = "Our entity spawner no longer works, Please use Plamen6789's entity spawner. There is a button below!"})
local Plamen6789BUTTON = SpawnTab:CreateButton({
	Name = "Load Entity Spawner",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI'))()
	end,
})

--[[
local ScreechButton = SpawnTab:CreateButton({
	Name = "Spawn Screech",
	Callback = function()
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
	end,
})
local A90Button = SpawnTab:CreateButton({
	Name = "Spawn A90",
	Callback = function()
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90)(Data)
        
	end,
})
local RushButton = SpawnTab:CreateButton({
	Name = "Spawn Rush",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iCherryKardes/Entity-Spawner/main/Rush"))()
end,
})
local HaltButton = SpawnTab:CreateButton({
	Name = "Spawn Halt",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
	end,
})
local GlitchButton = SpawnTab:CreateButton({
	Name = "Spawn Glitch",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
    wait(1.99)
    game.Players.LocalPlayer.Character.Humanoid.Health -= 40
    firesignal(game.ReplicatedStorage.EntityInfo.DeathHint.OnClientEvent, {"That is odd. I cannot figure out who you died to.", "However, I did notice you lagged back from your friends.", "Stay close together!"})
    wait(2.55)
    game.Players.LocalPlayer.PlayerGui.MainUI.Statistics.Death.Text = "Died to Glitch"
	end,
})
local EyesButton = SpawnTab:CreateButton({
	Name = "Spawn Eyes",
	Callback = function()
        local enableDamage = true
        repenttimes = 0
        local deadeyescrucifix = false
        local repentcomplete = false
        local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
        local eyes = game:GetObjects("rbxassetid://11488518082")[1]
        local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
        eyes.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)

        eyes.Parent = workspace
        eyes.Initiate:Play()
        task.wait(0.5)
        eyes.Attachment.Eyes.Enabled = true
        eyes.whisper:Play()
        eyes.whisper.Looped = true
        function EyesHell()
            local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
            local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
            local camara = game.Workspace.CurrentCamera
            local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
            camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        camShake:ShakeOnce(10,30,0.7,0.1)
        ts = game:GetService("TweenService")
        wait(0.2)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
            camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        camShake:ShakeOnce(2,30,5,2)
        wait(3)

        eyes.Scream:Play()
        ts:Create(eyes,TweenInfo.new(5),{CFrame = eyes.CFrame - Vector3.new(0,12,0)}):Play()
            wait(7)
            eyes:Destroy()
        end
        local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

        local function IsVisible(part)
            local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            local onscreen = found and vec.Z > 0
            local cfg = RaycastParams.new();
            cfg.FilterType = Enum.RaycastFilterType.Blacklist
            cfg.FilterDescendantsInstances = {part};

            local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg);
            return (onscreen and true) and ((cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and true)
        end

        while true do
            if workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value] ~= currentLoadedRoom then
                enableDamage = false
                task.wait(0.2)
                eyes:Destroy()
            end
            if enableDamage then
                if (IsVisible(eyes)) and not game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and deadeyescrucifix == false then
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 10
                wait(0.2)
                elseif (IsVisible(eyes)) and game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes < 5 and deadeyescrucifix == false then
                print("GET THAT AWAY FROM ME")
                eyes.Repent:Play()
                eyes.Attachment.Angry.Enabled = true
                local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
                local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
                local camara = game.Workspace.CurrentCamera
                local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
                camara.CFrame = camara.CFrame * shakeCf
            end)
            camShake:Start()

            camShake:ShakeOnce(5,50,0.7,0.2)
                wait(0.7)
                repenttimes = repenttimes + 1
                print(repenttimes)
                eyes.Attachment.Angry.Enabled = false
                wait(0.4)
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes == 5 and deadeyescrucifix == false then
                local hi = game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle:Clone()
                hi.Anchored = true
                hi.Parent = workspace
                hi:PivotTo(game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle.CFrame)
                game.Players.LocalPlayer.Character:FindFirstChild("Crucifix"):Destroy()
                EyesHell()
                enableDamage = false
                    if hum.Health <= 0 then
                        game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value =
                            "Eyes"
                        debug.setupvalue(
                            getconnections(game:GetService("ReplicatedStorage").EntityInfo.OnClientEvent)[1].Function,
                            1,
                            {
                                "You died to the Eyes...",
                                "They don't like to be stared at.",
                            }
                        )
                    end
                end
            end
            task.wait(0.2)
        end          
	end,
})
local TimothyButton = SpawnTab:CreateButton({
	Name = "Spawn Timothy",
	Callback = function()
        local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
        require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)].Assets.Dresser.DrawerContainer, 0.2)
            game.Players.LocalPlayer.Character.Humanoid.Health -= 5
        end,
})
local Paragraph3 = SpawnTab:CreateParagraph({Title = "Bug", Content = "Glitching during chase, Sometimes you might chase seek."})
local SeekButton = SpawnTab:CreateButton({
    Name = "Spawn Seek",
    Callback = function()
        local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/EntitySpawner.lua"))()
        local Configuration = {}
        EntitySpawner:Spawn("Seek", unpack(Configuration))
    end,
})]]

-- [[  Events  ]] --
local HeartbeatButton = EventTab:CreateButton({
    Name = "Heartbeat Minigame",
    Callback = function()
        firesignal(game.ReplicatedStorage.EntityInfo.ClutchHeartbeat.OnClientEvent)
    end,
})
local DisableA90 = EventTab:CreateButton({
    Name = "Disable A-90",
    Callback = function()
        game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules["A90"].Name = "Baller"
    end,
})

local selectedAchievement
local AchievementsDropdown = EventTab:CreateDropdown({
    Name = "Achievements",
    Options = {require(game.ReplicatedStorage.Achievements)},
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "AchievementDropdown",
    Callback = function(Option)
        
    end,
 })
 local SelectAchievement = Tab3:CreateButton({
    Name = "Grant Achievement",
    Callback = function()
        if selectedAchievement then
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.AchievementUnlock)(nil, selectedAchievement)
        end
    end,
 })

local AchievementsButton = EventTab:CreateButton({
    Name = "Grant All Achievements",
    Callback = function()
        for i,v in pairs(require(game.ReplicatedStorage.Achievements)) do
            spawn(function()
                require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.AchievementUnlock)(nil, i)
            end)
        end
    end,
})
--[[local JackHallwayButton = EventTab:CreateButton({
    Name = "Blood Room Jack",
    Callback = function()
	    local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
        local shadow=game:GetObjects("rbxassetid://11499539790")[1]
        game.ReplicatedStorage.EntityInfo.UseEventModule:FireServer("flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1)
        shadow:PivotTo(currentLoadedRoom.RoomEntrance.CFrame)
        wait(0.2)
        shadow.Parent=workspace
        shadow.Sound:Play()
        task.wait(0.3)
        shadow:Destroy()
        game.ReplicatedStorage.EntityInfo.UseEventModule:FireServer("tryp", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 10)
    end,
})]]
local SeekEyesButton = EventTab:CreateButton({
	Name = "Seek Eyes",
	Callback = function()
        require(game.ReplicatedStorage.ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], 100)
	end,
})
--[[local BreakLightsButton = EventTab:CreateButton({
    Name = "Break Lights",
    Callback = function()
        firesignal(game.ReplicatedStorage.EntityInfo.UseEventModule.OnClientEvent, "breakLights", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 0.416, 60) 
    end,
})
local FlickerLightsButton = EventTab:CreateButton({
    Name = "Flicker Lights",
    Callback = function()
       firesignal(game.ReplicatedStorage.EntityInfo.UseEventModule.OnClientEvent, "flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1) 
    end,
})]]
local Input = EventTab:CreateInput({
	Name = "Caption",
	PlaceholderText = "Your text here",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        firesignal(game.ReplicatedStorage.EntityInfo.Caption.OnClientEvent, Text)
	end,
})
local StartNewMatchButton = EventTab:CreateButton({
    Name = "Start New Match",
    Callback = function()
        game.ReplicatedStorage.EntityInfo.PlayAgain:FireServer()
    end,
})
local EndCurrentMatchButton = EventTab:CreateButton({
    Name = "End Current Match",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0;
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
            game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value =
                "Match Ended"
            debug.setupvalue(
                getconnections(game:GetService("ReplicatedStorage").EntityInfo.DeathHint.OnClientEvent)[1].Function,
                1,
                {
                    "You ended your match...",
                }
            )
        end
    end,
})

-- [[  Every Door Events ]] --
local ScreechDoorButton = DoorTab:CreateButton({
	Name = "Screech every Door",
	Callback = function()
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
        end)
	end,
})
local GlitchDoorButton = DoorTab:CreateButton({
	Name = "Glitch every Door",
	Callback = function()
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
		    require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
        end)
	end,
})
--[[local JackHallwayDoorButton = DoorTab:CreateButton({
    Name = "Blood Room Jack every Door",
    Callback = function()
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
	        local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
            local shadow=game:GetObjects("rbxassetid://11499539790")[1]
            firesignal(game.ReplicatedStorage.EntityInfo.UseEventModule.OnClientEvent, "flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1)
            shadow:PivotTo(currentLoadedRoom.RoomStart.CFrame)
            wait(0.2)
            shadow.Parent=workspace
            shadow.Sound:Play()
            task.wait(0.3)
            shadow:Destroy()
            firesignal(game.ReplicatedStorage.EntityInfo.UseEventModule.OnClientEvent, "tryp", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 10)
        end)
    end,
})]]
local SeekEyesDoorButton = DoorTab:CreateButton({
	Name = "Seek Eyes every Door",
	Callback = function()
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
   require(game.ReplicatedStorage.ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], 100)
    end)
	end,
})

-- [[  Credits  ]] --
local CreditParagraph1 = CreditsTab:CreateParagraph({Title = "A-90, Crucifix Skins, Shakelight, Other script modifications.", Content = "CreepyPSC#6666"})
local CreditParagraph2 = CreditsTab:CreateParagraph({Title = "Crucifix & Shears", Content = "PenguinManiack#2322"})
local CreditParagraph3 = CreditsTab:CreateParagraph({Title = "Vitamins", Content = "Master Oogway#3595"})
local CreditParagraph4 = CreditsTab:CreateParagraph({Title = "Scanner", Content = "Deivid#9999"})
local CreditParagraph5 = CreditsTab:CreateParagraph({Title = "Couple of Entities", Content = "Dreadmania#0001"})

-- [[  Other Guis  ]] --
local MSDoors = GuisTab:CreateButton({
	Name = "MSDoors",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"),true))()
	end,
})
local VynixuDoorsButton = GuisTab:CreateButton({
	Name = "Vynixu's Doors GUI",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
	end,
})
local DarkraiXButton = GuisTab:CreateButton({
	Name = "Darkrai X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
	end,
})
local PlamenUtilButton = GuisTab:CreateButton({
	Name = "Plamen6789's Utilities GUI",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI'))()
	end,
})
local InfiniteYieldButton = GuisTab:CreateButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end,
})
local RemoteSpyButton = GuisTab:CreateButton({
	Name = "Remote Spy",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/bCghX33W", true))()
	end,
})
local DarkDexButton = GuisTab:CreateButton({
	Name = "Dark Dex",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
	end,
})

Rayfield:LoadConfiguration()
