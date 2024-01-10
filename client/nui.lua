ESX = exports["es_extended"]:getSharedObject()

local uiVisible = false

-- Remove this later on after testing. (Replace with something that makes everything happened based on when people join or leave the server)
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
    SendPlayerIdsToJS(playerIds)
end)

function SendPlayerIdsToJS(playerIds)
    SendNUIMessage({
        type = 'updatePlayerIds',
        playerIds = playerIds
    })
end

-- Below here is testing for sending license data to JS and using it for the new dynamic dropdown.

RegisterNetEvent('ll_receiveLicenseData')
AddEventHandler('ll_receiveLicenseData', function(ll_license_type, ll_license_label)
    ll_sendLicenses(ll_license_label)
end)

function ll_sendLicenses(ll_license_type, ll_license_label)
    SendNUIMessage({
        ll_license_type = ll_license_type,
        ll_license_label = ll_license_label
    })
end