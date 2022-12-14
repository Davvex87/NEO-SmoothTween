local TweenRemote = game.ReplicatedStorage:WaitForChild("TweenRemote")
local TS = game:GetService("TweenService")
local tweens = {}

TweenRemote.OnClientEvent:Connect(function(action,data)
	local s, e = pcall(function()
		if action == "NewTween" then
			tweens[data[1]] = TS:Create(data[2],TweenInfo.new(table.unpack(data[3])),data[4])
		elseif action == "PlayTween" then
			tweens[data]:Play()
		elseif action == "PauseTween" then
			tweens[data]:Pause()
		elseif action == "CancelTween" then
			tweens[data]:Cancel()
		elseif action == "StopTween" then
			tweens[data]:Cancel()
			tweens[data] = nil
		elseif action == "FastTween" then
			coroutine.resume(coroutine.create(function()
				local s, e = pcall(function()
					local tween = TS:Create(data[1],TweenInfo.new(table.unpack(data[2])),data[3])
					tween:Play()	
				end)
			end))
		end
	end)
end)
