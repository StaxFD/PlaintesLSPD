ESX = nil 
TriggerEvent(_Plaintes.ESX, function(obj) ESX = obj end)


local function getDate()
    return os.date("*t", os.time()).day.."/"..os.date("*t", os.time()).month.."/"..os.date("*t", os.time()).year.." à "..os.date("*t", os.time()).hour.."h"..os.date("*t", os.time()).min
end

RegisterNetEvent(("%s:InsertPlaintes_"):format(_Plaintes.Event.Prefix))
AddEventHandler(("%s:InsertPlaintes_"):format(_Plaintes.Event.Prefix), function(table)
    MySQL.Async.execute('INSERT INTO plaintes_lspd (nom, prenom, datedenaissance, numero, raison, date) VALUES (@nom, @prenom, @datedenaissance, @numero, @raison, @date)', {
        ['@nom'] = table.nom,
        ['@prenom'] = table.prenom,
        ['@datedenaissance'] = table.datedenaissance,
        ['@numero'] = table.numero,
        ['@raison'] = table.raison,
        ['@date'] = getDate()
    })
end)
RegisterNetEvent(("%s:RecupPlaintes_"):format(_Plaintes.Event.Prefix))
AddEventHandler(("%s:RecupPlaintes_"):format(_Plaintes.Event.Prefix), function()
    local src = source 
    if (not (src)) then
        return
    end
    MySQL.Async.fetchAll("SELECT * FROM plaintes_lspd", {}, function(result)
        if (result) then
            TriggerClientEvent(("%s:RecupPlaintes_"):format(_Plaintes.Event.Prefix), src, result)
        end
    end)
end)
RegisterNetEvent(("%s:DeletePlaintes_"):format(_Plaintes.Event.Prefix))
AddEventHandler(("%s:DeletePlaintes_"):format(_Plaintes.Event.Prefix), function(id)
    MySQL.Async.execute("DELETE FROM plaintes_lspd WHERE id ='"..id.."'")
end)