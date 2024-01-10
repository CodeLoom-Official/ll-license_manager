ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('ll_getOnlineIds')
AddEventHandler('ll_getOnlineIds', function()
    local playerIds = {}
    for _, player in ipairs(GetPlayers()) do
        table.insert(playerIds, player)
    end
    TriggerClientEvent('ll_receiveOnlineIds', -1, playerIds)
end)

exports('getOnlinePlayerIds', function()
    local playerIds = {}
    for _, player in ipairs(GetPlayers()) do
        table.insert(playerIds, player)
    end
    return playerIds
end)

RegisterServerEvent('ll_fetchLicenses')
AddEventHandler('ll_fetchLicenses', function()

    local testData = {}
    local ll_parameters = {}

    MySQL.query("SELECT type, label FROM licenses", ll_parameters, function(result)
        for _, row in ipairs(result) do
            table.insert(testData, row.label)
        end
        TriggerClientEvent('ll_test', -1, testData)
    end)   
end)