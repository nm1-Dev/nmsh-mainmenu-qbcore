local QBCore = exports['nmsh-base']:GetCoreObject()
local inMenu = false

function QBCore.Functions.GetPlayerData(cb)
    if cb then
        cb(QBCore.PlayerData)
    else
        return QBCore.PlayerData
    end
end

local player = QBCore.Functions.GetPlayerData()

function SetDisplay(bool)
    SendNUIMessage({
        type = "show",
        status = bool,
    })

	SetNuiFocus(bool, bool)
    
    -- Player's character name
    QBCore.Functions.TriggerCallback('nmsh-mainmenu:getPlayerName', function(playername)
        SendNUIMessage({action = 'playername', value = playername})
    end)
    
    -- Phone Number
    QBCore.Functions.TriggerCallback('nmsh-mainmenu:getPhoneNumber', function(phonenumber)
        SendNUIMessage({action = 'phonenumber', value = phonenumber})
    end)

    -- Job Name and Grade
    QBCore.Functions.TriggerCallback('nmsh-mainmenu:getJob', function(job, jobGrade)
        SendNUIMessage({action = 'jobname', value = job})
    end)

    -- Money in hand (cash)
    QBCore.Functions.TriggerCallback('nmsh-mainmenu:getCash', function(walletamount)
        SendNUIMessage({action = 'walletamount', value = walletamount})
    end)

    -- Bank Money
    QBCore.Functions.TriggerCallback('nmsh-mainmenu:getBank', function(bankamount)
        SendNUIMessage({action = 'bankamount', value = bankamount})
    end)
    
    -- Administration Contact
    if GlobalState.AdminContact then
        SendNUIMessage({
            type = "showadmincontact",
            status = true,
        })

    else
        SendNUIMessage({
            type = "showadmincontact",
            status = false,
        })
    end

    -- Level System
    if GlobalState.LevelSystem then
        SendNUIMessage({
            type = "showlevel",
            status = true,
        })

        SendNUIMessage({action = 'whatlevel', value = TriggerEvent("nmsh-base:getLevel")})
    else
        SendNUIMessage({
            type = "showlevel",
            status = false,
        })
    end

    inMenu = true
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 244) and not inMenu then
			SetDisplay(true, true)
		end
	end
end)

RegisterNUICallback("close", function(data)
    SetNuiFocus(false, false)

    inMenu = false
end)

RegisterNUICallback("inventory", function(data)
    SetDisplay(false, false)
    
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان

    inMenu = false
end)

RegisterNUICallback("billing", function(data)
    SetDisplay(false, false)
    
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان

    inMenu = false
end)

RegisterNUICallback("cardealership", function(data)
    SetDisplay(false, false)

    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    
    inMenu = false
end)

RegisterNUICallback("shop", function(data)
    SetDisplay(false, false)

    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    
    inMenu = false
end)

RegisterNUICallback("administratorcontact", function(data)
    SetDisplay(false, false)
    
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    
    inMenu = false
end)

RegisterNUICallback("jobcenter", function(data)
    SetDisplay(false, false)
    
    -- ضبف هنا ال event اللي تبيه يسويه لما يضغط على هذا المكان
    
    inMenu = false
end)