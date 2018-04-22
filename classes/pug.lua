local Dog = require("classes.dog")
local Pug = Dog:derive("Pug")

function Pug:new(name, weight, type, speed, color)
    self.name = name
    self.weight = weight
    self.type = type
    self.speed = speed
    self.color = color
end

return Pug