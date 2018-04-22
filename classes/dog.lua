local Animal = require("classes.animal")
local Dog = Animal:derive("Dog")

function Dog:new(name, weight, type, speed)
    self.name = name
    self.weight = weight
    self.type = type
    self.speed = speed
end

function Dog:soundOff()
    return "Woof"
end

return Dog