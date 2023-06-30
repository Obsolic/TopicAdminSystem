ESX = nil

local noclip = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


s = function(msg)
ESX.ShowNotification(msg)
end

openfunctiondeadmin = function()
local src = source
local nombread = GetPlayerName(PlayerId())
local elements = {}
local elements = {
{label = 'NoClip', value = 'nocliped'},
{label = 'God Mode', value = 'god'},
{label = 'Invisible', value = 'invisible'},
{label = 'Regenerar Vida', value = 'health'},
{label = 'Regenear Armadura', value = 'proof'},
{label = 'Tp To WayPoint', value = 'tp'},
{label = 'Balas Infinitas', value = 'infiniteammo'}
}
ESX.UI.Menu.CloseAll()

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'functions', { 
title = 'STAFF | '..nombread..'',
align = 'bottom-right',
elements = elements    
}, function(data,menu)
    local ks = data.current.value
    if ks == 'nocliped' then
        admin_no_clip()
        menu.close()
    elseif ks == 'god' then
        TriggerEvent('topicadmin:2', src)
        menu.close()
    elseif ks == 'invisible' then
        TriggerEvent('topicadmin:3', src)
        menu.close()
    elseif ks == 'health' then 
        TriggerEvent('topicadmin:4', src)
        menu.close()
    elseif ks == 'proof' then 
    TriggerEvent('topicadmin:5', src)
        menu.close()
    elseif ks == 'tp' then 
        TriggerEvent('topicadmin:6', src)
        menu.close()
    elseif ks == 'infiniteammo' then 
        TriggerEvent('topicadmin:7', src)
        menu.close()
    end
end)
end


RegisterCommand("adminis", function(source,args)
	ESX.TriggerServerCallback('topicadmin:getgrupo', function(grup)  grupo = grup end)
	while grupo == nil do
		Citizen.Wait(500)
	end

	for k,v in pairs(Config.Team) do 
		if grupo == v then 
			ESX.UI.Menu.CloseAll()
			openfunctiondeadmin()
			s('Has accedido al menú de administrador, si administras no te olvides de abrir fichaje.')
			s('Tu rango actual en la administración es: '..grupo)

		end
	end

	if grupo == 'user' then 
		ESX.UI.Menu.CloseAll()
		s('Comprobando si tienes permisos para acceder al menú de administrador...')
		Wait(3000)
        s('No tienes suficientes permisos para abrir el menu de admin')
	end

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if IsControlJustReleased(0, Config.KeyOpen) then
            ExecuteCommand('adminis')
        end
    end
  end)

  function admin_no_clip()
	noclip = not noclip
	if noclip then
		plyPed = PlayerPedId()
		FreezeEntityPosition(plyPed, true)
		SetEntityInvincible(plyPed, true)
		SetEntityCollision(plyPed, false, false)

		SetEntityVisible(plyPed, false, false)

		SetEveryoneIgnorePlayer(PlayerId(), true)
		SetPoliceIgnorePlayer(PlayerId(), true)
		s('Te has activado el noclip')		


	else
		plyPed = PlayerPedId()
		FreezeEntityPosition(plyPed, false)
		SetEntityInvincible(plyPed, false)
		SetEntityCollision(plyPed, true, true)

		SetEntityVisible(plyPed, true, false)
			s('Te has desactivado el noclip')
	end
end

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		plyPed = PlayerPedId()
        if noclip then
			sleep = 0
			local coords = GetEntityCoords(plyPed)
			local camCoords = getCamDirection()
			local velocidad = 1

			SetEntityVelocity(plyPed, 0.01, 0.01, 0.01)

			if IsControlPressed(0, 32) then
				coords = coords + (velocidad * camCoords)
			end

			if IsControlPressed(0, 269) then
				coords = coords - (velocidad * camCoords)
			end

			SetEntityCoordsNoOffset(plyPed, coords, true, true, true)
        end
		Citizen.Wait(sleep)
	end
end)
function getCamDirection()
	local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(plyPed)
	local pitch = GetGameplayCamRelativePitch()
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end


Citizen.CreateThread(function()
	while true do
		Wait(0)
		if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'functions') then 
			if IsControlJustPressed(0, 202) then 
				ESX.UI.Menu.CloseAll()
			end
		end
	end
end)
