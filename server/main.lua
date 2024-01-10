ESX = exports["es_extended"]:getSharedObject()

------------ Can this be removed? ----------------------
function ll_InitializeDropdown(playerId)
    local playerIds = {}
    for _, player in ipairs(GetPlayers()) do
        table.insert(playerIds, player)
    end
end
-----------------------------------------------

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

---------- THINGS THAT I AM TESTING CAN GO BELOW HERE, EVERYTHING ABOVE IS CURRENT AND WORKING AND MUST REMAIN CLEAN. ------------

-- Example for pulling all license information from the database for use.
RegisterCommand("getlicenseinfo", function(source, args, rawCommand)
    local query = "SELECT type, label FROM licenses"
    local parameters = {}
    MySQL.query(query, parameters, function(result)
        if result and #result > 0 then
            for _, row in ipairs(result) do
                print("License Type:", row.type)
                print("License Label:", row.label)
            end
        else
            print("No licenses found in the database.")
        end
    end)
end, false)


--- LICENSE SENDING FUNCTIOANLITY TESTING BELOW HERE

-- This is the one that triggers first on the client side, first chain
RegisterServerEvent('ll_fetchLicenses')
AddEventHandler('ll_fetchLicenses', function()

    --testing another appraoch
    local testData = {}

    -- Prepare the infomration for the SQL query
    local ll_query = "SELECT type, label FROM licenses"
    local ll_parameters = {}

    MySQL.query(ll_query, ll_parameters, function(result)
        if result and #result > 0 then
            for _, row in ipairs(result) do
                table.insert(testData, {type = row.type, label = row.label})
            end
            TriggerClientEvent('ll_test', -1, testData)
        else
            print("No licenses found in the database.")
        end
    end)   
end)
