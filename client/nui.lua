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