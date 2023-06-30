ESX = nil
local godmode = false
local invisible = false
local ammo = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

k = function(msg)
    ESX.ShowNotification(msg)
    end

RegisterNetEvent('topicadmin:2')
AddEventHandler('topicadmin:2',function()
    local source = source
    local name = GetPlayerName(source)
	if godmode then
		SetEntityInvincible(PlayerPedId(),false)
        k('Desactivaste el modo Dios 👳‍♂️')
		godmode = false
	else
		SetEntityInvincible(PlayerPedId(),true)
        k('Activaste el modo Dios 👳‍♂️')
		godmode = true
	end
end)

RegisterNetEvent('topicadmin:3')
AddEventHandler('topicadmin:3',function()
    local source = source
    local name = GetPlayerName(source)
	if invisible == false then
		SetEntityVisible(PlayerPedId(),false)
		invisible = true
        k('Has activado el invisible')
	else
		SetEntityVisible(PlayerPedId(),true)
		invisible = false
        k('Has desactivado el Invisible')
	end
end)

RegisterNetEvent('topicadmin:4')
AddEventHandler('topicadmin:4', function()
    local source = source
    local name = GetPlayerName(source)
SetEntityHealth(PlayerPedId(), 100)
k('Te has curado')
end)

RegisterNetEvent('topicadmin:5')
AddEventHandler('topicadmin:5', function()
    local source = source
    local name = GetPlayerName(source)
AddArmourToPed(PlayerPedId(), 100)
k('Te has añadido Armadura')
end)

RegisterNetEvent('topicadmin:6')
AddEventHandler('topicadmin:6',function()
    local source = source
    local name = GetPlayerName(source)
local WaypointHandle = GetFirstBlipInfoId(8)

    if DoesBlipExist(WaypointHandle) then
    k('Fuiste teletransportado al punto marcado.')
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords.x, waypointCoords.y, height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords.x, waypointCoords.y, height + 0.0)

                break
            end
            Citizen.Wait(10)
        end
    else
        k('No tienes ningun punto selecionado, marca un punto para ir.')
    end
end)

RegisterNetEvent('topicadmin:7')
AddEventHandler('topicadmin:7', function()

    if ammo == false then
    SetPedInfiniteAmmo(PlayerPedId(), true, GetSelectedPedWeapon(PlayerPedId()))
    k('Activaste la munición infinita')
    ammo = true
    else
ammo = false
SetPedInfiniteAmmo(PlayerPedId(), false, GetSelectedPedWeapon(PlayerPedId()))
k('Desactivaste la munición infinita')
	end
end)
