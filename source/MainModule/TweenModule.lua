local function overideWarn(input)
	warn("{ Davvex87s Tween Module } - "..input)
end
local function overideError(input)
	error("{ Davvex87s Tween Module } - "..input)
end





local TweenModule = {};
TweenModule.__index = TweenModule
_G.TweenModules = _G.TweenModules or {};
local TS = game:GetService("TweenService")

function TweenModule.new(instance:Instance, tweenInfo:TweenInfo, propertyTable:{ [string]:any })
	if game:GetService("RunService"):IsClient() then warn("") end
	local self = setmetatable({},TweenModule)
	self.__id = math.random(0,999999999)
	local id = self.__id
	local strId = tostring(id)
	local daTween = nil
	
	local tween = TS:Create(instance, tweenInfo, propertyTable)
	local daTweenInfo = {tweenInfo.Time, tweenInfo.EasingStyle, tweenInfo.EasingDirection, tweenInfo.RepeatCount, tweenInfo.Reverses, tweenInfo.DelayTime}
	local function addTweenToPlayer(plr)
		game.ReplicatedStorage:WaitForChild("TweenRemote"):FireAllClients("NewTween", {strId, instance, daTweenInfo, propertyTable})
	end
	for i, plr in pairs(game.Players:GetPlayers()) do
		addTweenToPlayer(plr)
	end
	game.Players.PlayerAdded:Connect(function(plr)
		plr.CharacterAdded:Connect(function()
			addTweenToPlayer(plr)
		end)
	end)
	
	_G.TweenModules[tween] = self
	
	local TweenFuncs = {}
	
	function TweenFuncs:Play()
		task.spawn(function()
			game.ReplicatedStorage:WaitForChild("TweenRemote"):FireAllClients("PlayTween", strId)
			task.wait(tweenInfo.Time + tweenInfo.DelayTime)
			TS:Create(instance, TweenInfo.new(0), propertyTable):Play()
		end)
	end
	
	function TweenFuncs:Pause()
		task.spawn(function()
			game.ReplicatedStorage:WaitForChild("TweenRemote"):FireAllClients("PauseTween", strId)
		end)
	end
	
	function TweenFuncs:Cancel()
		task.spawn(function()
			game.ReplicatedStorage:WaitForChild("TweenRemote"):FireAllClients("CancelTween", strId)
		end)
	end
	
	function TweenFuncs:Stop()
		task.spawn(function()
			game.ReplicatedStorage:WaitForChild("TweenRemote"):FireAllClients("StopTween", strId)
		end)
		_G.TweenModules[tween] = nil
		self = nil
	end
	
	return TweenFuncs
end

function TweenModule.Tween(Object, Info, Goal)
	local tweenInfo = Info
	if string.lower(type(Info)) ~= "table" then
		tweenInfo = {Info.Time, Info.EasingStyle, Info.EasingDirection, Info.RepeatCount, Info.Reverses, Info.DelayTime}
	end
	task.spawn(function()
		if tweenInfo[6] == nil then tweenInfo[6] = 0 end; if tweenInfo[4] == nil then tweenInfo[4] = 0 end;
		if tweenInfo[2] == nil then tweenInfo[2] = Enum.EasingStyle.Linear end; if tweenInfo[3] == nil then tweenInfo[3] = Enum.EasingDirection.InOut end;
		if tweenInfo[5] == nil then tweenInfo[5] = false end;
		game.ReplicatedStorage:WaitForChild("TweenRemote"):FireAllClients("FastTween", {Object,tweenInfo,Goal})
		task.wait(tweenInfo[6]+tweenInfo[1])
		if tweenInfo[5] == false then
			game:GetService("TweenService"):Create(Object,TweenInfo.new(0),Goal):Play()
		end
	end)
end

return TweenModule
