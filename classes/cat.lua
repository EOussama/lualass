local Animal = require("classes.animal")
local Cat = Animal:derive("Cat")

function Cat:new(name, weight, type, favFood)
    self.name = name
    self.weight = weight
    self.type = type
    self.favFood = favFood
end

function Cat:soundOff()
    return "Meow"
end

return Cat