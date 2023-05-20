local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local playerData = DataStoreService:GetDataStore("playerData")

local testClass = {}
testClass.__index = testClass

function testClass.Main()
    local self = setmetatable({}, testClass)

    self._level = 0
    self._gamepass = true
    self._loadData = true

    return self
end

function testClass:LoadData(player)
    if player then
        local key = "player" .. player.UserId
        if key then
            self._level = playerData:GetAsync(key) or 0 -- wrap in pcall
        end
    end
end