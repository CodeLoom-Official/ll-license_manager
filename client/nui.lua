ESX = exports["es_extended"]:getSharedObject()

local uiVisible = false

-- Remove this later on after testing. (Replace with something that makes everything happened based on when people join or leave the server)
TriggerServerEvent('ll_getOnlineIds')
TriggerServerEvent('ll_fetchLicenses')

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
    SendPlayerIdsToJS(playerIds)
end)

function SendPlayerIdsToJS(playerIds)
    SendNUIMessage({
        type = 'updatePlayerIds',
        playerIds = playerIds
    })
end






-- Below here is testing for sending license data to JS and using it for the new dynamic dropdown.



-- Testing function to see what values we are getting back
RegisterNetEvent('ll_test')
AddEventHandler('ll_test', function(testData)

    for _, data in ipairs(testData) do
        
        -- Test prints to make sure the data is being recieved as it should.
        print(data.type)
        print(data.label)
        print('-----------------')

        -- try sending the nui message inside the same loop as the recieve?
        SendNUIMessage({
            type = 'updateLicenses',
            ll_license_type = data.type,
            ll_license_label = data.label
        })
    end
end)