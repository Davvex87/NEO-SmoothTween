local TweenModule = script:WaitForChild("TweenModule")
local TweenClient = script:WaitForChild("TweenClient")
--local DirectModule = TweenClient:WaitForChild("DirectModule")

local function overideWarn(input)
	warn("{ Davvex87s Tween Module } - "..input)
end

local function overideError(input)
	error("{ Davvex87s Tween Module } - "..input)
end

if game:GetService("ReplicatedStorage"):FindFirstChild(TweenModule.Name) then
	overideWarn("Module already exist in the game, using current")
	return require(game:GetService("ReplicatedStorage"):FindFirstChild(TweenModule.Name))
else
	if not game:GetService("RunService"):IsClient() then
		TweenModule.Parent = game:GetService("ReplicatedStorage")

		local Remote = Instance.new("RemoteEvent")
		Remote.Name = "TweenRemote"
		Remote.Parent = game.ReplicatedStorage
		
		local clone = TweenClient:Clone()
		clone.Parent = game.StarterGui
		clone.Disabled = false
		
		local function LoadPlayer(player)
			print("loading player "..player.Name)
			local clone = TweenClient:Clone()
			local playerGui = player:WaitForChild("PlayerGui", 20)

			if not playerGui then
				overideError(player.Name.."s player gui not found or unable to load ")
			else
				clone.Parent = playerGui
				clone.Disabled = false
				coroutine.resume(coroutine.create(function()
					player.CharacterAdded:Connect(function()
						local find = player.PlayerGui:WaitForChild("TweenClient", 20)
						if find == nil then
							local clone = TweenClient:Clone()
							clone.Parent = playerGui
							clone.Disabled = false
						end
					end)
				end))
			end
		end

		for i, player in pairs(game.Players:GetPlayers()) do
			coroutine.resume(coroutine.create(function()
				LoadPlayer(player)
			end))
		end
		game.Players.PlayerAdded:Connect(function(player)
			LoadPlayer(player)
		end)
		
		overideWarn("Module Loaded")
		return require(TweenModule)
	end
end
