# Vending_Machine_Robbery
Vending Machine Robbery


Dependencies
    
    qb-core
    qb-target
    ps-ui


dispatch setup

add ps-dispatch client/extraalers.lua

    local function Vendingrobbery()
        local currentPos = GetEntityCoords(PlayerPedId())
        local locationInfo = getStreetandZone(currentPos)
        local gender = GetPedGender()
        TriggerServerEvent("dispatch:server:notify",{
            dispatchcodename = "vendingrobbery", 
            dispatchCode = "10-50",
            firstStreet = locationInfo,
            gender = gender,
            model = nil,
            plate = nil,
            priority = 2, -- priority
            firstColor = nil,
            automaticGunfire = false,
            origin = {
                x = currentPos.x,
                y = currentPos.y,
                z = currentPos.z
            },
            dispatchMessage = 'Vending robbery in progress',
            job = {"police"} 
        })
    end exports('Vendingrobbery', Vendingrobbery)
    RegisterNetEvent("ps-dispatch:client:vendingrobbery", function ()
        Vendingrobbery()
    end)


add ps-dispatch server/dispatchcodes.lua

    ["vendingrobbery"] =  {displayCode = '10-50', description = "Vending robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 595, blipColour = 60, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "false", blipflash = "false"},








