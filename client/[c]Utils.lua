ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent(_Plaintes.ESX, function(obj) ESX = obj end)
        Citizen.Wait(80)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    ESX.PlayerData = ESX.GetPlayerData()
    TriggerEvent("Plainte:blips")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local tablepositionsandblips = _Plaintes.PositionsPlaintes
function _Plaintes.Menu:Main()
    _Plaintes.Menu.Create()
    RageUI.Visible(_Plaintes.Menu.main, not RageUI.Visible(_Plaintes.Menu.main))
	FreezeEntityPosition(PlayerPedId(),true)
    while _Plaintes.Menu.main do
        Citizen.Wait(0)
        RageUI.IsVisible(_Plaintes.Menu.main, function()
            _PlaintesButton()
        end)
        if not RageUI.Visible(_Plaintes.Menu.main) 
        then 
            _Plaintes.Menu.main = RMenu:DeleteType("_Plaintes.Menu.main", true, FreezeEntityPosition(PlayerPedId(),false))
        end
    end
end

local tablepositionsliste = _Plaintes.PositionsListePlaintes
function _Plaintes.Menu:MainListe()
    _Plaintes.Menu.Liste()
    RageUI.Visible(_Plaintes.Menu.Listemain, not RageUI.Visible(_Plaintes.Menu.Listemain))
	FreezeEntityPosition(PlayerPedId(),true)
    while _Plaintes.Menu.Listemain do
        Citizen.Wait(0)
        RageUI.IsVisible(_Plaintes.Menu.Listemain, function()
            _ListesPlaintesButton()
        end)
        RageUI.IsVisible(_Plaintes.Menu.intoliste, function()
            _IntoListesPlaintesButton()
        end)
        if not RageUI.Visible(_Plaintes.Menu.Listemain)
        and not RageUI.Visible(_Plaintes.Menu.intoliste)
        then 
            _Plaintes.Menu.Listemain = RMenu:DeleteType("_Plaintes.Menu.main", true, FreezeEntityPosition(PlayerPedId(),false), RealoadInfo())
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local wait = 700
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(tablepositionsandblips) do
            local PositionsPlaintes = vec3(v.pos)
            local dst1 = #(playerPos - PositionsPlaintes)
            if dst1 < 5.0 then
                wait = 0
                DrawMarker(_Plaintes.Markers.Type, PositionsPlaintes.x, PositionsPlaintes.y, PositionsPlaintes.z, 0, 0, 0, 0, 0, 0, _Plaintes.Markers.TailleX, _Plaintes.Markers.TailleY, _Plaintes.Markers.TailleZ, _Plaintes.Markers.CouleurR, _Plaintes.Markers.CouleurG, _Plaintes.Markers.CouleurB, _Plaintes.Markers.Opacite, 0, 0, 0, 1, 0, 0, 0)
                if dst1 < 2.0 then
                    ESX.ShowHelpNotification(_Plaintes.Translations.Menu.HelpNotif)
                    if IsControlJustReleased(1, 38) then
                        _Plaintes.Menu:Main()
                    end
                end
            end
        end
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "police" then
            for k,v in pairs(tablepositionsliste) do
                local PositionsListePlaintes = vec3(v.pos)
                local dst1 = #(playerPos - PositionsListePlaintes)
                if dst1 < 5.0 then
                    wait = 0
                    DrawMarker(_Plaintes.Markers.Type, PositionsListePlaintes.x, PositionsListePlaintes.y, PositionsListePlaintes.z, 0, 0, 0, 0, 0, 0, _Plaintes.Markers.TailleX, _Plaintes.Markers.TailleY, _Plaintes.Markers.TailleZ, _Plaintes.Markers.CouleurR, _Plaintes.Markers.CouleurG, _Plaintes.Markers.CouleurB, _Plaintes.Markers.Opacite, 0, 0, 0, 1, 0, 0, 0)
                    if dst1 < 2.0 then
                        ESX.ShowHelpNotification(_Plaintes.Translations.Menu.HelpNotif)
                        if IsControlJustReleased(1, 38) then
                            _Plaintes.Menu:MainListe()
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

RegisterNetEvent("Plainte:blips")
AddEventHandler("Plainte:blips", function()
    for k,v in pairs(tablepositionsandblips) do
        blip = AddBlipForCoord(v.pos.x,v.pos.y,v.pos.z)
        SetBlipSprite(blip, _Plaintes.Blips.Sprite)
        SetBlipScale(blip, _Plaintes.Blips.Scale)
        SetBlipColour(blip, _Plaintes.Blips.Color)
        SetBlipDisplay(blip, _Plaintes.Blips.Display)
        SetBlipAsShortRange(blip, _Plaintes.Blips.ShortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(_Plaintes.Blips.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

function _Plaintes.KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end
