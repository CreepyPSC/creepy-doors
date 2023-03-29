local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
mouse.KeyDown:connect(function(key)
 if key == _G.ActivationKey and _G.OnlySkins ~= true then
	game.Players.LocalPlayer.Character:SetAttribute("Hiding", true)
	loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
 end
end)
if _G.Skin ~= "Default" then
	if _G.Skin == "Love" then
		game.Workspace.ChildAdded:Connect(function(part)
			if part.Name == "Repentance" then
				local colorSequence = game:GetObjects("rbxassetid://12932531326")[1].Color
				part:WaitForChild("Crucifix").Glow.Color = Color3.fromRGB(255, 102, 252)
				part:WaitForChild("Crucifix").Glow.MeshId = "rbxassetid://3080212940"
				part:WaitForChild("Crucifix").Glow.Light.Color = Color3.fromRGB(214, 11, 255)
				part:WaitForChild("Pentagram").Base.LightAttach.Light.Color =  Color3.fromRGB(255, 102, 252)
				part:WaitForChild("Pentagram").Base.LightAttach.LightBright.Color =  Color3.fromRGB(255, 102, 252)
				part.:WaitForChild("Crucifix").Glow.ExplodeParticle.Color = colorSequence
				for i,v in pairs(part:WaitForChild("Pentagram"):GetChildren()) do
					if v.ClassName == "Beam" then
						v.Color = colorSequence
						if v.Name == "BeamChain" then
							v.Texture = "rbxassetid://241778280"
						end
						if v.Name == "BeamFlat" and v.Texture == "rbxassetid://11523868403" then
							v.Texture = "rbxassetid://12323570774"
						end
					end
				end
			end
		end)
	end
end
