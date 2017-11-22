local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.dynamic-transform.access"

local DynoTransformHandler = BasePlugin:extend()

DynoTransformHandler.PRIORITY = 900

function DynoTransformHandler:new()
  DynoTransformHandler.super.new(self, "dynamic-transform")
end

function DynoTransformHandler:access(conf)
    DynoTransformHandler.super.access(self)
  access.execute(conf)
end

return DynoTransformHandler
