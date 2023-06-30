ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('topicadmin:getgrupo', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local grupo = xPlayer.getGroup()
    cb(grupo)
end)

