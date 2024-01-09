ESX = exports["es_extended"]:getSharedObject()

local uiVisible = false

-- Remove this later on after testing.
TriggerServerEvent('ll_getOnlineIds')

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

RegisterNetEvent('ll_receiveOnlineIds')
AddEventHandler('ll_receiveOnlineIds', function(playerIds)
    for _, playerId in ipairs(playerIds) do
        print('Received Online Player ID:', playerId)
    end
    SendPlayerIdsToJS(playerIds)
end)

function SendPlayerIdsToJS(playerIds)
    SendNUIMessage({
        type = 'updatePlayerIds',
        playerIds = playerIds
    })
end