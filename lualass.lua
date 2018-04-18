--[[
                                                

                        _             _               
                        | |           | |              
                        | |_   _  __ _| | __ _ ___ ___ 
                        | | | | |/ _` | |/ _` / __/ __|
                        | | |_| | (_| | | (_| \__ \__ \
                        |_|\__,_|\__,_|_|\__,_|___/___/


                        @author:            Eoussama
                        @name:              lualass
                        @created on:        4/18/2018
]]

local Class = {
    __type = "Class"
}

Class.__index = Class

function Class:new() end

function Class:__call(...)
    local inst = setmetatable({}, self)
    inst:new(...)
    return inst
end

function Class:derive(class)
    assert(type(class) == "string", "[Lualass]: The class's name has to be a string")

    local derived = {}

    setmetatable(derived, self)
    derived["__call"] = self.__call
    derived.__index = derived
    derived.super = self
    derived.__type = class;

    return derived;
end

function Class:getType()
    return self.__type
end

function Class:count()
    local count = 0

    for k,v in pairs(self) do
        count = count + 1
    end

    return count
end

function Class:tostring()
    local separator = "" info = self:getType() .. " = { " props = self:count() count = 0

    for k,v in pairs(self) do
        count = count + 1
        if count == props then separator = " " else separator = ", " end 
        info = info .. k .. " = " .. v .. separator
    end

    info = info .. "}"
    return info
end

return Class