local RepicatedStorage = game:GetService("ReplicatedStorage")

local Networker = require(RepicatedStorage.Packages.Networker)
local BUILD_COOLDOWN = 5
local BuildServiceServer = {}




function BuildServiceServer.init(self: BuildServiceServer)
	self.previousBuildTime = 0
	self.networker = Networker.server.new("BuildService", self, {
		self.attemptBuild,
	})
	  
end

function BuildServiceServer.attemptBuild(self: BuildServiceServer, Player: Player, cf: CFrame)
	local timeSinceLastBuild = os.time() - self.previousBuildTime
	if timeSinceLastBuild < BUILD_COOLDOWN then
		return 
	end
	
	self.previousBuildTime = os.time()
	
	local part = Instance.new("Part")
	part.CFrame = cf
	part.Anchored = true
	part.Parent = workspace
end

type BuildServiceServer = typeof(BuildServiceServer ) & {
	previousBuildTime: number,
	networker: Networker.sever 
}


return BuildServiceServer :: BuildServiceServer