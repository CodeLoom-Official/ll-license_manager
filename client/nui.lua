ESX = exports["es_extended"]:getSharedObject()

local uiVisible = false

RegisterCommand('showuitest', function()
    uiVisible = not uiVisible

    if uiVisible then
        SendNUIMessage({ showUI = true })
        SetNuiFocus(true, true)
    else
        SendNUIMessage({ showUI = false })
        SetNuiFocus(false, false)
    end
end, false)

RegisterNUICallback('closeUI', function(data)
    SetNuiFocus(false, false)
end)

RegisterKeyMapping('showuitest', 'Opens the UI', 'keyboard', "L")






-- trigger this automatically for everyone when a player joins to update the menu.
TriggerServerEvent('ll_getOnlineIds')





RegisterNetEvent('ll_receiveOnlineIds')
AddEventHandler('ll_receiveOnlineIds', function(playerIds)
    for _, playerId in ipairs(playerIds) do
        print('Received Online Player ID:', playerId)
    end

    -- Pass the playerIds to the JS file
    SendPlayerIdsToJS(playerIds)
end)

function SendPlayerIdsToJS(playerIds)
    -- Trigger a client event to send data to the JS file
    SendNUIMessage({
        type = 'updatePlayerIds',
        playerIds = playerIds
    })
end