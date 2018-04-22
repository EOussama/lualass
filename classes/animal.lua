local Lualass = require("lualass")
local Animal = Lualass:derive("Animal")

function Animal:new(name, weight, type)
    self.name = name
    self.weight = weight
    self.type = type
end

function Animal:soundOff()
    return "Uh?"
end

return Animal