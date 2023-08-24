local QBCore = exports["qb-core"]:GetCoreObject()

local rob = false

local objecs = {
    "prop_vend_coffe_01",
    "prop_vend_fridge01",
    "prop_vend_snak_01",
    "prop_vend_snak_01_tu",
    "prop_vend_soda_01",
    "prop_vend_soda_02"
}

function loadAnimDict(dict)
if not HasAnimDictLoaded(dict) then
RequestAnimDict(dict)
while not HasAnimDictLoaded(dict) do
Wait(0)
end
end
end

RegisterNetEvent("FMC-vendingmachinerobbery:client:rob")
AddEventHandler("FMC-vendingmachinerobbery:client:rob", function()
local hasItem = QBCore.Functions.HasItem('lockpick')


local function Playvending_machineRAnimation(animation)
    local playerPed = PlayerPedId()
    if animation == 'idle_a' then
        RequestAnimDict('amb@prop_human_parking_meter@male@idle_a')
        while not HasAnimDictLoaded('amb@prop_human_parking_meter@male@idle_a') do
            Wait(0)
        end
        TaskPlayAnim(playerPed, 'amb@prop_human_parking_meter@male@idle_a', "idle_a", 1.0,-1.0, 10500, 1, 1, true, true, true)
    end
end



if rob then
    QBCore.Functions.Notify("You are already rob the vending machine", "error")
    Citizen.Wait(Config.cooldown)
    rob = false
else
if hasItem then
    exports['ps-ui']:Circle(function(success)
        if success then
            TriggerServerEvent("FMC-vendingmachinerobbery:server:reward")
            rob = true
            Playvending_machineRAnimation('idle_a')
            exports['progressbar']:Progress({
                name = "unique_action_atm",
                duration = 10500,
                label = "Taking Items",
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
            })
            QBCore.Functions.Notify("you have successfully rob the vending machine", "error")
        else
            QBCore.Functions.Notify("You failed", "error")
            exports['ps-dispatch']:Vendingrobbery()
            ClearPedTasksImmediately(PlayerPedId())
        end
    end, 10, 20) 
else
    QBCore.Functions.Notify("You don't have a lockpick", "error")
end
end
end)

Citizen.CreateThread(function()
while true do
exports['qb-target']:AddTargetModel(objecs, {
options = {
{
event = "FMC-vendingmachinerobbery:client:rob",
icon = "fas fa-hands",
label = "Rob vending machine",
},
},
distance = 2.0,
})
end
end)
