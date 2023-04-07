-- [[  Loader  ]] --
local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
function message(text, timee)
    task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 5;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = "Notice", Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "image"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
	)
end
if not fireproximityprompt then
    message("Your executor is not supported: Use Krnl, Synapse or something that supports 'fireproximityprompt'.")
    return
end

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
		SaveKey = false,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = scriptKey
	}
})

-- [[  Tabs  ]] --
local EasyCheatsTab = Window:CreateTab("Utilities", 4483362458)
local RoomsTab;
if game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("Floor").Value == "Rooms" then
    RoomsTab = Window:CreateTab("The Rooms", 4483362458)
end
local AutoFarmingTab = Window:CreateTab("Auto Farm", 4483362458)
--local SpawnTab = Window:CreateTab("Spawn Monsters", 10110576663)
local OtherTab = Window:CreateTab("Items", 7818923311)
local EventTab = Window:CreateTab("Events", 7818981800)
local GuisTab = Window:CreateTab("Other GUIs", 11233340291)
local CreditsTab = Window:CreateTab("Credits", 11233340291)

-- [[ Flags & Stuff ]] --
local flags = {
    espdoors = false,
    espkeys = false,
    espitems = false,
    espbooks = false,
    esprush = false,
    espchest = false,
    esplocker = false,
    esphumans = false,
    espgold = false,
    goldespvalue = 0,
    hintrush = false,
    light = false,
    fullbright = false,
    instapp = false,
    noseek = false,
    nogates = false,
    nopuzzle = false,
    noa90 = false,
    noskeledoors = false,
    noscreech = false,
    getcode = false,
    roomsnolock = false,
    draweraura = false,
    autorooms = false,
}
local DELFLAGS = {table.unpack(flags)}
local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={}}
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

-- [[ Exploits ]] --
-- Variables
local instanceInteraction = false;
local fbmode = false;
local isEnabled = false;
local walkspeedEnabled = false;
local walkspeedValue = 15;
local Plr = game.Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")

-- Functions
function esp(what,color,core,name)
    local parts
    
    if typeof(what) == "Instance" then
        if what:IsA("Model") then
            parts = what:GetChildren()
        elseif what:IsA("BasePart") then
            parts = {what,table.unpack(what:GetChildren())}
        end
    elseif typeof(what) == "table" then
        parts = what
    end
    
    local bill
    local boxes = {}
    
    for i,v in pairs(parts) do
        if v:IsA("BasePart") then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = v.Size
            box.AlwaysOnTop = true
            box.ZIndex = 1
            box.AdornCullingMode = Enum.AdornCullingMode.Never
            box.Color3 = color
            box.Transparency = 0.7
            box.Adornee = v
            box.Parent = game.CoreGui
            
            table.insert(boxes,box)
            
            task.spawn(function()
                while box do
                    if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
                        box.Adornee = nil
                        box.Visible = false
                        box:Destroy()
                    end  
                    task.wait()
                end
            end)
        end
    end
    
    if core and name then
        bill = Instance.new("BillboardGui",game.CoreGui)
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(0,400,0,100)
        bill.Adornee = core
        bill.MaxDistance = 2000
        
        local mid = Instance.new("Frame",bill)
        mid.AnchorPoint = Vector2.new(0.5,0.5)
        mid.BackgroundColor3 = color
        mid.Size = UDim2.new(0,8,0,8)
        mid.Position = UDim2.new(0.5,0,0.5,0)
        Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
        Instance.new("UIStroke",mid)
        
        local txt = Instance.new("TextLabel",bill)
        txt.AnchorPoint = Vector2.new(0.5,0.5)
        txt.BackgroundTransparency = 1
        txt.BackgroundColor3 = color
        txt.TextColor3 = color
        txt.Size = UDim2.new(1,0,0,20)
        txt.Position = UDim2.new(0.5,0,0.7,0)
        txt.Text = name
        Instance.new("UIStroke",txt)
        
        task.spawn(function()
            while bill do
                if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                    bill.Enabled = false
                    bill.Adornee = nil
                    bill:Destroy() 
                end  
                task.wait()
            end
        end)
    end
    
    local ret = {}
    
    ret.delete = function()
        for i,v in pairs(boxes) do
            v.Adornee = nil
            v.Visible = false
            v:Destroy()
        end
        
        if bill then
            bill.Enabled = false
            bill.Adornee = nil
            bill:Destroy() 
        end
    end
    
    return ret 
end
function startSpeedLoop()
    while walkspeedEnabled == true do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeedValue
        wait()
    end
end

-- Buttons

-- character / lighting adjustments
local InstantInteractLabel = EasyCheatsTab:CreateSection("Instant Interact")
local InstantInteract = EasyCheatsTab:CreateButton({
	Name = "Instant Interact",
	Callback = function()
        instanceInteraction = true;
	end,
})
local CharacterLabel = EasyCheatsTab:CreateSection("Character")
local Walkspeed = EasyCheatsTab:CreateToggle({
    Name = "Walkspeed Toggle",
    CurrentValue = false,
    Flag = "WalkspeedCheats",
    Callback = function(Value)
        walkspeedEnabled = Value
        startSpeedLoop()
    end,
})
local SpeedSlider = EasyCheatsTab:CreateSlider({
    Name = "Walkspeed",
    Range = {15, 21},
    Increment = 1,
    Suffix = "Walkspeed",
    CurrentValue = 15,
    Flag = "WalkspeedFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        walkspeedValue = Value
    end,
})
local NoclipBypasss = EasyCheatsTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipBypasser",
    Callback = function(Value)
        isEnabled = Value
    end,
})
local LightingLabel = EasyCheatsTab:CreateSection("Lighting")
local Fullbright = EasyCheatsTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = function(Value)
        fbmode = Value
        if Value then
            while fbmode == true do
                game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                wait()
            end
        end
    end,
})
local ClientGlow = EasyCheatsTab:CreateToggle({
    Name = "Client Glow",
    CurrentValue = false,
    Flag = "ClientGlowToggle",
    Callback = function(Value)
        flags.light = Value
   
        if Value then
            local l = Instance.new("PointLight")
            l.Range = 10000
            l.Brightness = 2
            l.Parent = char.PrimaryPart
            repeat task.wait() until not flags.light
            l:Destroy() 
        end
    end,
})

-- rooms
local ROomsLabel = EasyCheatsTab:CreateSection("Rooms")
local AutoFigureCode = EasyCheatsTab:CreateToggle({
    Name = "Auto Library Code",
    CurrentValue = false,
    Flag = "autocodesaver",
    Callback = function(Value)
        flags.getcode = Value
    
        if Value then
            message("Collect all the books & grab the paper.")

            local function deciphercode()
            local paper = char:FindFirstChild("LibraryHintPaper")
            local hints = plr.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")
            
            local code = {[1]="_",[2]="_",[3]="_",[4]="_",[5]="_"}
                
                if paper then
                    for i,v in pairs(paper:WaitForChild("UI"):GetChildren()) do
                        if v:IsA("ImageLabel") and v.Name ~= "Image" then
                            for i,img in pairs(hints:GetChildren()) do
                                if img:IsA("ImageLabel") and img.Visible and v.ImageRectOffset == img.ImageRectOffset then
                                    local num = img:FindFirstChild("TextLabel").Text
                                    
                                    code[tonumber(v.Name)] = num 
                                end
                            end
                        end
                    end 
                end
                
                return code
            end
            
            local addconnect
            addconnect = char.ChildAdded:Connect(function(v)
                if v:IsA("Tool") and v.Name == "LibraryHintPaper" then
                    task.wait()
                    
                    local code = table.concat(deciphercode())
                    
                    if code:find("_") then
                        message("Collect all the books first.")
                    else
                        message("The code is: ".. code)
                    end
                end
            end)

            local autoDoorOpen
            if game.Workspace.CurrentRooms:FindFirstChild("50") then
                autoDoorOpen = game.Workspace.CurrentRooms:FindFirstChild("50").Door.Padlock.ActivateEventPrompt.Triggered:Connect(function()
                    local code = table.concat(deciphercode())
                    if not code:find("_") then
                        game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("PL"):FireServer(code)
                    end
                end)
            else
                message("Please turn this off and wait until door 50.")
            end

            
            repeat task.wait() until not flags.getcode
            if game.Workspace.CurrentRooms:FindFirstChild("50") then
                autoDoorOpen:Disconnect()
            end
            addconnect:Disconnect()
        end
    end,
})
local TheRoomsNoLocks = EasyCheatsTab:CreateToggle({
    Name = "Remove A-000 Locks",
    CurrentValue = false,
    Flag = "roomLocks",
    Callback = function(Value)
        flags.roomsnolock = Value
        if Value then
            local function check(room)
                local door = room:WaitForChild("RoomsDoor_Entrance")
                if door then
                    local prompt = door:WaitForChild("Door"):WaitForChild("EnterPrompt")
                    prompt.Enabled = true
                end 
            end
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                check(room)
            end)
            for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
                check(v)
            end
            repeat task.wait() until not flags.roomsnolock
            addconnect:Disconnect()
        end
    end,
})
local deleteLeverGate = EasyCheatsTab:CreateToggle({
    Name = "Delete Gates",
    CurrentValue = false,
    Flag = "levergates",
    Callback = function(Value)
        flags.nogates = Value
        if Value then
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                local gate = room:WaitForChild("Gate",2)    
                if gate then
                    local door = gate:WaitForChild("ThingToOpen",2)
                    
                    if door then
                        door:Destroy() 
                    end
                end
            end)
            repeat task.wait() until not flags.nogates
            addconnect:Disconnect()
        end
    end,
})
local deletePuzzles = EasyCheatsTab:CreateToggle({
    Name = "Delete Puzzle Doors",
    CurrentValue = false,
    Flag = "puzzlegates",
    Callback = function(Value)
        flags.nopuzzle = Value
        if Value then
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                local assets = room:WaitForChild("Assets")
                local paintings = assets:WaitForChild("Paintings",2)
                if paintings then
                    local door = paintings:WaitForChild("MovingDoor",2)   
                    if door then
                        door:Destroy() 
                    end 
                end
            end)
            repeat task.wait() until not flags.nopuzzle
            addconnect:Disconnect()
        end
    end,
})
local skeletonDOORS = EasyCheatsTab:CreateToggle({
    Name = "Delete Skeleton Doors",
    CurrentValue = false,
    Flag = "skeledoors",
    Callback = function(Value)
        flags.noskeledoors = Value
        if Value then
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            local door = room:WaitForChild("Wax_Door",2)
               if door then
                   door:Destroy() 
                end
            end)    
            repeat task.wait() until not flags.noskeledoors
            addconnect:Disconnect()
        end
    end,
})

-- Entities
local EntityLabel = EasyCheatsTab:CreateSection("Entities")
local notifyentityes = EasyCheatsTab:CreateToggle({
    Name = "Notify Entities",
    CurrentValue = false,
    Flag = "entitynotifercheck",
    Callback = function(Value)
        flags.hintrush = Value
        if Value then
            local addconnect
            addconnect = workspace.ChildAdded:Connect(function(v)
                if table.find(entitynames,v.Name) then
                    repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)
                    if v:IsDescendantOf(workspace) then
                        message(v.Name:gsub("Moving","").." has spawned, Hide.")
                    end
                end
            end) 
            repeat task.wait() until not flags.hintrush
            addconnect:Disconnect()
        end
    end,
})
local removeseek = EasyCheatsTab:CreateToggle({
    Name = "Disable Seek Chase",
    CurrentValue = false,
    Flag = "byebyeseeklol",
    Callback = function(Value)
        flags.noseek = Value
    
        if Value then
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                local trigger = room:WaitForChild("TriggerEventCollision",2)
                if trigger then
                    trigger:Destroy() 
                end
            end)
            repeat task.wait() until not flags.noseek
            addconnect:Disconnect()
        end
    end,
})
local screechremote = entityinfo:FindFirstChild("Screech")
local screechymodule = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Screech")
if screechremote and screechymodule then
    local antiscreechstuff = EasyCheatsTab:CreateToggle({
        Name = "Harmless Screech",
        CurrentValue = false,
        Flag = "harmlessScreech",
        Callback = function(Value)
            flags.noscreech = Value
            if Value then
                screechremote.Parent = nil;
                screechymodule.Name = "Baller";
                screechymodule.Parent = nil;
                repeat task.wait() until not flags.noscreech
                screechymodule.Parent = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules
                screechymodule.Name = "Screech"
                screechremote.Parent = entityinfo
             end
        end,
    })
end

-- ESP & Aura
local EspLabel = EasyCheatsTab:CreateSection("ESP & Auras")
local doorESP = EasyCheatsTab:CreateToggle({
    Name = "Door ESP",
    CurrentValue = false,
    Flag = "doorESP",
    Callback = function(Value)
        flags.espdoors = Value
        if Value then
            local function setup(room)
                local door = room:WaitForChild("Door"):WaitForChild("Door")
                
                task.wait(0.1)
                local h = esp(door,Color3.fromRGB(255,240,0),door,"Door")
                table.insert(esptable.doors,h)
                
                door:WaitForChild("Open").Played:Connect(function()
                    h.delete()
                end)
                
                door.AncestryChanged:Connect(function()
                    h.delete()
                end)
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            
            repeat task.wait() until not flags.espdoors
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.doors) do
                v.delete()
            end 
        end
    end,
})
local keyESP = EasyCheatsTab:CreateToggle({
    Name = "Key / Lever ESP",
    CurrentValue = false,
    Flag = "keyandleverESP",
    Callback = function(Value)
        flags.espkeys = Value
    
        if Value then
            local function check(v)
                if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") then
                    task.wait(0.1)
                    if v.Name == "KeyObtain" then
                        local hitbox = v:WaitForChild("Hitbox")
                        local parts = hitbox:GetChildren()
                        table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))
                        
                        local h = esp(parts,Color3.fromRGB(90,255,40),hitbox,"Key")
                        table.insert(esptable.keys,h)
                        
                    elseif v.Name == "LeverForGate" then
                        local h = esp(v,Color3.fromRGB(90,255,40),v.PrimaryPart,"Lever")
                        table.insert(esptable.keys,h)
                        
                        v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
                            h.delete()
                        end) 
                    end
                end
            end
            
            local function setup(room)
                local assets = room:WaitForChild("Assets")
                
                assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                    
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end 
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            
            repeat task.wait() until not flags.espkeys
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.keys) do
                v.delete()
            end 
        end
    end,
})
local itemESP = EasyCheatsTab:CreateToggle({
    Name = "Item ESP",
    CurrentValue = false,
    Flag = "itemESP",
    Callback = function(Value)
        flags.espitems = Value
    
        if Value then
            local function check(v)
                if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then
                    task.wait(0.1)
                    
                    local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
                    local h = esp(part,Color3.fromRGB(160,190,255),part,v.Name)
                    table.insert(esptable.items,h)
                end
            end
            
            local function setup(room)
                local assets = room:WaitForChild("Assets")
                
                if assets then  
                    local subaddcon
                    subaddcon = assets.DescendantAdded:Connect(function(v)
                        check(v) 
                    end)
                    
                    for i,v in pairs(assets:GetDescendants()) do
                        check(v)
                    end
                    
                    task.spawn(function()
                        repeat task.wait() until not flags.espitems
                        subaddcon:Disconnect()  
                    end) 
                end 
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            
            repeat task.wait() until not flags.espitems
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.items) do
                v.delete()
            end 
        end
    end,
})
local bookandbreakerESP = EasyCheatsTab:CreateToggle({
    Name = "Book / Breaker ESP",
    CurrentValue = false,
    Flag = "bookESP",
    Callback = function(Value)
        flags.espbooks = Value
    
        if Value then
            local function check(v)
                if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") then
                    task.wait(0.1)
                    
                    local h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"Book")
                    table.insert(esptable.books,h)
                    
                    v.AncestryChanged:Connect(function()
                        if not v:IsDescendantOf(room) then
                            h.delete() 
                        end
                    end)
                end
            end
            
            local function setup(room)
                if room.Name == "50" or room.Name == "100" then
                    room.DescendantAdded:Connect(function(v)
                        check(v) 
                    end)
                    
                    for i,v in pairs(room:GetDescendants()) do
                        check(v)
                    end
                end
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                setup(room) 
            end
            
            repeat task.wait() until not flags.espbooks
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.books) do
                v.delete()
            end 
        end
    end,
})
local entityESP = EasyCheatsTab:CreateToggle({
    Name = "Entity ESP",
    CurrentValue = false,
    Flag = "entityESP",
    Callback = function(Value)
        flags.esprush = Value
    
        if Value then
            local addconnect
            addconnect = workspace.ChildAdded:Connect(function(v)
                if table.find(entitynames,v.Name) then
                    task.wait(0.1)
                    
                    local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
                    table.insert(esptable.entity,h)
                end
            end)
            
            local function setup(room)
                if room.Name == "50" or room.Name == "100" then
                    local figuresetup = room:WaitForChild("FigureSetup")
                
                    if figuresetup then
                        local fig = figuresetup:WaitForChild("FigureRagdoll")
                        task.wait(0.1)
                        
                        local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
                        table.insert(esptable.entity,h)
                    end 
                else
                    local assets = room:WaitForChild("Assets")
                    
                    local function check(v)
                        if v:IsA("Model") and table.find(entitynames,v.Name) then
                            task.wait(0.1)
                            
                            local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
                            table.insert(esptable.entity,h)
                        end
                    end
                    
                    assets.DescendantAdded:Connect(function(v)
                        check(v) 
                    end)
                    
                    for i,v in pairs(assets:GetDescendants()) do
                        check(v)
                    end
                end 
            end
            
            local roomconnect
            roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
                setup(v) 
            end
            
            repeat task.wait() until not flags.esprush
            addconnect:Disconnect()
            roomconnect:Disconnect()
            
            for i,v in pairs(esptable.entity) do
                v.delete()
            end 
        end
    end,
})
local lockerESP = EasyCheatsTab:CreateToggle({
    Name = "Locker ESP",
    CurrentValue = false,
    Flag = "lockeresp",
    Callback = function(Value)
        flags.esplocker = Value
    
        if Value then
            local function check(v)
                if v:IsA("Model") then
                    task.wait(0.1)
                    if v.Name == "Wardrobe" then
                        local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Closet")
                        table.insert(esptable.lockers,h) 
                    elseif (v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge") then
                        local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"Locker")
                        table.insert(esptable.lockers,h) 
                    end
                end
            end
            
            local function setup(room)
                local assets = room:WaitForChild("Assets")
                
                if assets then
                    local subaddcon
                    subaddcon = assets.DescendantAdded:Connect(function(v)
                        check(v) 
                    end)
                    
                    for i,v in pairs(assets:GetDescendants()) do
                        check(v)
                    end
                    
                    task.spawn(function()
                        repeat task.wait() until not flags.esplocker
                        subaddcon:Disconnect()  
                    end) 
                end 
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
                setup(room) 
            end
            
            repeat task.wait() until not flags.esplocker
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.lockers) do
                v.delete()
            end 
        end
    end,
})
local chestESP = EasyCheatsTab:CreateToggle({
    Name = "Chest ESP",
    CurrentValue = false,
    Flag = "chestESP",
    Callback = function(Value)
        flags.espchest = Value
    
        if Value then
            local function check(v)
                if v:IsA("Model") then
                    task.wait(0.1)
                    if v.Name == "ChestBox" then
                        warn(v.Name)
                        local h = esp(v,Color3.fromRGB(205,120,255),v.PrimaryPart,"Chest")
                        table.insert(esptable.chests,h) 
                    elseif v.Name == "ChestBoxLocked" then
                        local h = esp(v,Color3.fromRGB(255,120,205),v.PrimaryPart,"Locked Chest")
                        table.insert(esptable.chests,h) 
                    end
                end
            end
            
            local function setup(room)
                local subaddcon
                subaddcon = room.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(room:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.espchest
                    subaddcon:Disconnect()  
                end)  
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            
            repeat task.wait() until not flags.espchest
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.chests) do
                v.delete()
            end 
        end
    end,
})
local playerESP = EasyCheatsTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "playerESP",
    Callback = function(Value)
        flags.esphumans = Value
    
        if Value then
            local function personesp(v)
                v.CharacterAdded:Connect(function(vc)
                    local vh = vc:WaitForChild("Humanoid")
                    local torso = vc:WaitForChild("UpperTorso")
                    task.wait(0.1)
                    
                    local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
                    table.insert(esptable.people,h) 
                end)
                
                if v.Character then
                    local vc = v.Character
                    local vh = vc:WaitForChild("Humanoid")
                    local torso = vc:WaitForChild("UpperTorso")
                    task.wait(0.1)
                    
                    local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
                    table.insert(esptable.people,h) 
                end
            end
            
            local addconnect
            addconnect = game.Players.PlayerAdded:Connect(function(v)
                if v ~= plr then
                    personesp(v)
                end
            end)
            
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= plr then
                    personesp(v) 
                end
            end
            
            repeat task.wait() until not flags.esphumans
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.people) do
                v.delete()
            end 
        end
    end,
})
local goldpileESP = EasyCheatsTab:CreateToggle({
    Name = "Gold Pile ESP",
    CurrentValue = false,
    Flag = "goldpileesp",
    Callback = function(Value)
        flags.espgold = Value
        
        if Value then
            local function check(v)
                if v:IsA("Model") then
                    task.wait(0.1)
                    local goldvalue = v:GetAttribute("GoldValue")
                    
                    if goldvalue and goldvalue >= flags.goldespvalue then
                        local hitbox = v:WaitForChild("Hitbox")
                        local h = esp(hitbox:GetChildren(),Color3.fromRGB(255,255,0),hitbox,"GoldPile [".. tostring(goldvalue).."]")
                        table.insert(esptable.gold,h)
                    end
                end
            end
            
            local function setup(room)
                local assets = room:WaitForChild("Assets")
                
                local subaddcon
                subaddcon = assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.espchest
                    subaddcon:Disconnect()  
                end)  
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            
            repeat task.wait() until not flags.espgold
            addconnect:Disconnect()
            
            for i,v in pairs(esptable.gold) do
                v.delete()
            end 
        end
    end,
})
local goldSlider = EasyCheatsTab:CreateSlider({
    Name = "Minimum Gold Displayed",
    Range = {5, 100},
    Increment = 5,
    Suffix = "MinimumGold",
    CurrentValue = 15,
    Flag = "MinimumGoldFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        flags.goldespvalue = Value
    end,
})

local AutoLootAura = EasyCheatsTab:CreateToggle({
    Name = "Loot Aura",
    CurrentValue = false,
    Flag = "lootingAuraFlag",
    Callback = function(Value)
        flags.draweraura = Value
    
        if Value then
            local function setup(room)
                local function check(v)
                    if v:IsA("Model") then
                        if v.Name == "DrawerContainer" then
                            local knob = v:WaitForChild("Knobs")
                            
                            if knob then
                                local prompt = knob:WaitForChild("ActivateEventPrompt")
                                local interactions = prompt:GetAttribute("Interactions")
                                
                                if not interactions then
                                    task.spawn(function()
                                        repeat task.wait(0.1)
                                            if plr:DistanceFromCharacter(knob.Position) <= 12 then
                                                fireproximityprompt(prompt)
                                            end
                                        until prompt:GetAttribute("Interactions") or not flags.draweraura
                                    end)
                                end
                            end
                        elseif v.Name == "GoldPile" then
                            local prompt = v:WaitForChild("LootPrompt")
                            local interactions = prompt:GetAttribute("Interactions")
                                
                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                            fireproximityprompt(prompt) 
                                        end
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        elseif v.Name:sub(1,8) == "ChestBox" then
                            local prompt = v:WaitForChild("ActivateEventPrompt")
                            local interactions = prompt:GetAttribute("Interactions")
                            
                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                            fireproximityprompt(prompt)
                                        end
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        elseif v.Name == "RolltopContainer" then
                            local prompt = v:WaitForChild("ActivateEventPrompt")
                            local interactions = prompt:GetAttribute("Interactions")
                            
                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                            fireproximityprompt(prompt)
                                        end
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        end 
                    end
                end
        
                local subaddcon
                subaddcon = room.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(room:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.draweraura
                    subaddcon:Disconnect() 
                end)
            end
            
            local addconnect
            addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
                setup(room)
            end)
            
            for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
                if room:FindFirstChild("Assets") then
                    setup(room) 
                end
            end
            
            repeat task.wait() until not flags.draweraura
            addconnect:Disconnect()
        end
    end,
})
-- end of aura/esp

local anticheatLabel = EasyCheatsTab:CreateSection("Anti-Cheat")
local bypassdesc = EasyCheatsTab:CreateParagraph({Title = "Bypass Anti-Cheat", Content = "bypass anticheat makes it so you CANT pick up ANYTHING so only do this in multiplayer or in the rooms area, if you use this you will not get the a-1000 badge."})
local bypassenable = EasyCheatsTab:CreateButton({
    Name = "Activate Anti-Cheat",
    Callback = function()
        local newhum = hum:Clone()
        newhum.Name = "humlol"
        newhum.Parent = char
        task.wait()
        hum.Parent = nil
        hum = newhum
    end,
})

-- Services
game:GetService("Lighting").Changed:Connect(function()
    if fbmode == true then
        game.Lighting.Ambient = Color3.fromRGB(255,255,255)
    end
end)
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    if not instanceInteraction then return end
    fireproximityprompt(prompt)
end)
game:GetService("RunService").RenderStepped:Connect(function()
    if not Char:FindFirstChild("HumanoidRootPart") then return end
    Char.HumanoidRootPart.CanCollide = not isEnabled
    Char.Collision.CanCollide = not isEnabled

    local HrpCFrame = Char.HumanoidRootPart.CFrame

    local ray = Ray.new(HrpCFrame.Position, HrpCFrame.LookVector * 0.5)
    local part = workspace:FindPartOnRay(ray)
    if part and part.CanCollide == true and isEnabled then
        Char.HumanoidRootPart.Anchored = true
        Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0))
        task.wait()
        Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4))
        task.wait()
        Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, -1000, 0))
        task.wait(0.1)
        Char.HumanoidRootPart.Anchored = false
    end
end)

-- [[  The Rooms ]] --
if game.ReplicatedStorage:WaitForChild("GameData"):WaitForChild("Floor").Value == "Rooms" then
    local a90remote = game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90")
    local HarmlessA90 = RoomsTab:CreateToggle({
        Name = "Disable A-90",
        CurrentValue = false,
        Flag = "ewwenighty",
        Callback = function(Value)
            flags.noa90 = Value
        
            if Value  then
                local jumpscare = plr.PlayerGui:WaitForChild("MainUI"):WaitForChild("Jumpscare"):FindFirstChild("Jumpscare_A90")
               
                if jumpscare then
                    jumpscare.Parent = nil
                    
                    a90remote.Parent = nil
                    repeat task.wait()
                        game.SoundService.Main.Volume = 1 
                    until not flags.noa90
                    jumpscare.Parent = plr.PlayerGui.MainUI.Jumpscare
                    a90remote.Parent = entityinfo 
                end
            end
        end,
    })
    local AutoRoomsLikeYes = RoomsTab:CreateToggle({
        Name = "Auto A-1000",
        CurrentValue = false,
        Flag = "autoroomsbeatit",
        Callback = function(Value)
        flags.autorooms = Value
        
        if Value then
            local hide = false

            local function getrecentroom(index)
                local rooms = workspace.CurrentRooms:GetChildren() 
                table.sort(rooms,function(a,b)
                    return tonumber(a.Name) > tonumber(b.Name) 
                end)
                
                return rooms[index]
            end
            
            local entconnect
            entconnect = workspace.ChildAdded:Connect(function(v)
                if v:IsA("Model") then
                    if v.Name == "A60" or v.Name == "A120" then
                        hide = true
                        
                        repeat task.wait() until not v:IsDescendantOf(workspace)
                        hide = false
                    end
                end
            end)
            
            while flags.autorooms do
                local room = getrecentroom(2)
                local door = room:WaitForChild("Door")
                local dpos = door.CFrame
                
                if hide then
                    repeat task.wait()
                        char.Humanoid:MoveTo(dpos+Vector3.new(0,150,0))
                    until not hide
                else
                    repeat task.wait()
                        char.Humanoid:MoveTo(dpos)
                    until lastroom ~= room or not flags.autorooms
                end
                
                task.wait()
            end
            entconnect:Disconnect()
        end
        end,
    })
end

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
        game:GetService("ReplicatedStorage").EntityInfo.ReviveInfo.Name = "reviveshat"
        local bb=game:GetService('VirtualUser')
        game:GetService('Players').LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        end)
        while true do
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        wait(3)
        game:GetService("ReplicatedStorage").EntityInfo.Revive:FireServer()
        end
	end,
})

-- [[  Entities  ]] --

--[[local EntityWarning = SpawnTab:CreateParagraph({Title = "Note", Content = "Our entity spawner no longer works, Please use Plamen6789's entity spawner. There is a button below!"})
local Plamen6789BUTTON = SpawnTab:CreateButton({
	Name = "Load Entity Spawner",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI'))()
	end,
})]]

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

-- [[  Visuals  ]] --
local HeartbeatButton = EventTab:CreateButton({
    Name = "Heartbeat Minigame",
    Callback = function()
        firesignal(game.ReplicatedStorage.EntityInfo.ClutchHeartbeat.OnClientEvent)
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

-- [[  Credits  ]] --
local CreditParagraph1 = CreditsTab:CreateParagraph({Title = "A-90, Crucifix Skins, Shakelight, Other script modifications.", Content = "CreepyPSC#6666"})
local CreditParagraph2 = CreditsTab:CreateParagraph({Title = "Crucifix & Shears", Content = "PenguinManiack#2322"})
local CreditParagraph3 = CreditsTab:CreateParagraph({Title = "Vitamins", Content = "Master Oogway#3595"})
local CreditParagraph4 = CreditsTab:CreateParagraph({Title = "Scanner", Content = "Deivid#9999"})
local CreditParagraph5 = CreditsTab:CreateParagraph({Title = "Rayfield UI Library", Content = "https://discord.gg/sirius"})

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
