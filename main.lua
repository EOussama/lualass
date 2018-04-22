--[[
                                                

                        _             _               
                        | |           | |              
                        | |_   _  __ _| | __ _ ___ ___ 
                        | | | | |/ _` | |/ _` / __/ __|
                        | | |_| | (_| | | (_| \__ \__ \
                        |_|\__,_|\__,_|_|\__,_|___/___/


                        @description:       The main testing environement for the “lualass” module
                        @author:            Eoussama
                        @name:              lualass
                        @created on:        4/18/2018
]]
local Animal = require("classes.animal")
local Dog = require("classes.dog")
local Cat = require("classes.cat")
local Pug = require("classes.pug")

function main()
    os.execute("cls")
    print("________________________________\n\n")

    animals = {
        Dog("Spot", 23.45, "Friendly", 59.36),
        Cat("Fluffy", 16.33, "Home", "Fish"),
        Animal("Spurtle", 41.00, "SWAT"),
        Pug("Marcel", 20.15, "Friendly", 23.30, "Orange"),
        Cat("Puff", 6.33, "Home", "Cookies")
    }

    for k,v in pairs(animals) do
        print(v:tostring())
        print(v:getType().."s go "..v:soundOff())
        print("-----------")
    end

    print("------------------------------")
    print(animals[1]:is(animals[2]))
    print(animals[2]:is(animals[3]))
    print(animals[3]:is(animals[1]))
    print(animals[4]:is(animals[1]))

    print("\n\n________________________________")
end

main();