local QBCore = exports["qb-core"]:GetCoreObject()



RegisterNetEvent("FMC-vendingmachinerobbery:server:reward", function(Money)
	Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.AddItem('kurkakola', math.random(5, 10), false, info)
	Player.Functions.AddItem('snikkel_candy', math.random(5, 10), false, info)
end)


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName.. ' loading 100% ')
  end)

  AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName..  ' loading 100% ')
  end)

