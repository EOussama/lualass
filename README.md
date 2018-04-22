<p align="center">
    <h1 align="center">Lualass</h1>
    
</p>
---

## Table of content
* [Description](#description)
* [Methods](#methods)
* [Samples](#samples)

## Description
This is a very lightweight Lua module that helps simplify faking object-oriented programming, very easy and simple to use, almost plug'n play I'd say.

## Methods
|Method         |Description                               |Usage                       |
|---------------|------------------------------------------|----------------------------|
|`derive(class)`|Derive a class based on another one       |`local Dog = Animal("Dog")` |
|`getType()`    |Get the class's type (_name_)             |`Dog:getType()`             |
|`is(class)`    |Check if a class is based on another one  |`Dog:is(Animal)`            |
|`count()`      |Return the number of properties of a class|`Cat:count()`               |
|`tostring()`   |Display a class's information             |`Animal:tostring()`         |

## Samples
### I. **Creating a new class**
It's preferable to create an entirely new file, and create a class there, as follows;
```lua
-- “animal.lua” file

local Lualass = require("lualass")
local Animal = Lualass:derive("Animal")

function Animal:new(name, weight)
    self.name = name
    self.weight = weight
end

function Animal:soundOff()
    return "Uh?"
end

return Animal
```

### II. **Inheritance**
In order to create another class and inherit from the `Animal` class, we need to create a new file and place our derived class there;
```lua
-- “dog.lua” file

local Animal = require("animal")
local Dog = Animal:derive("Dog")

function Dog:new(name, weight, speed)
    self.name = name
    self.weight = weight
    self.speed = speed
end

function Dog:soundOff()
    return "Woof"
end

return Dog
```
Just like that, we have created 2 classes, with the second class `Dog` inheriting from the first class `Animal`. now, if we want to create yet another class, we can do so;

```Lua
-- “pug.lua” file

local Dog = require("dog")
local Pug = Dog:derive("Pug")

function Pug:new(name, weight, speed, color)
    self.name = name
    self.weight = weight
    self.speed = speed
    self.color = color
end

return Pug
```
and that's it, notice that we don't have to override the `soundOff()` method because we want out pugs to produce the same bark.

### III. **Testing**
Now for testing, we can set off a simple `main.lua` file (_it can be called anything_), and require the 3 files.

```lua
-- “main.lua” file

local Animal = require("animal")
local Dog = require("dog")
local Pug = require("pug")

function main()
    animals = {
        Dog("Spot", 23.45, 59.36),
        Animal("Spurtle", 41.00),
        Pug("Edgar", 20.15, 23.30, "Orange")
    }

    for k,v in pairs(animals) do
        print(v:tostring())
        print(v:getType().."s go "..v:soundOff())
        print("-----------")
    end

    print(animals[1]:is(animals[2]))
    print(animals[2]:is(animals[3]))
    print(animals[3]:is(animals[1]))
end

main();
```
Notice how we don't have to call the `Class:new` method, but rather call the table as if it was a function, trying to for a more constructor like syntax, the output would be like this;
```
Dog = { speed = 59.36, name = Spot, type = Friendly, weight = 23.45 }
Dogs go Woof
-----------
Animal = { name = Spurtle, type = SWAT, weight = 41.0 }
Animals go Uh?
-----------
Pug = { color = Orange, name = Marcel, type = Friendly, weight = 20.15, speed = 23.3 }
Pugs go Woof
-----------
true
false
true
```

### IV. **Method overriding**
Let's edit the `Pug` class and override the `soundOff()` method;

```Lua
-- “pug.lua” file

local Dog = require("dog")
local Pug = Dog:derive("Pug")

function Pug:new(name, weight, speed, color)
    self.name = name
    self.weight = weight
    self.speed = speed
    self.color = color
end

function Pug:soundOff()
    return "Wooffyy"
end

return Pug
```
Now let's run another test and see the how the it goes;

```lua
-- “main.lua” file

local Animal = require("animal")
local Dog = require("dog")
local Pug = require("pug")

function main()
    animals = {
        Dog("Spot", 23.45, 59.36),
        Animal("Spurtle", 41.00),
        Pug("Edgar", 20.15, 23.30, "Orange")
    }

    for k,v in pairs(animals) do
        print(v:getType().."s go "..v:soundOff())
    end
end

main();
```
The output is going to be like this;
```
Dogs go Woof
Animals go Uh?
Pugs go Wooffyy
```