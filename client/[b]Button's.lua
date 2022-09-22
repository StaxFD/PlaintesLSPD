function _PlaintesButton()
    RageUI.Button(_Plaintes.Translations.Menu.Nom, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.nom.."~s~"}, true, {
        onSelected = function()
            _Plaintes.Info.nom = _Plaintes.KeyboardInput(_Plaintes.Translations.Menu.Nom, "", 15)
            _Plaintes.Info.nom = GetOnscreenKeyboardResult()
        end,
    })
    RageUI.Button(_Plaintes.Translations.Menu.Prenom, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.prenom.."~s~"}, true, {
        onSelected = function()
            _Plaintes.Info.prenom = _Plaintes.KeyboardInput(_Plaintes.Translations.Menu.Prenom, "", 15)
            _Plaintes.Info.prenom = GetOnscreenKeyboardResult()
        end,
    })
    RageUI.Button(_Plaintes.Translations.Menu.Date, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.datedenaissance.."~s~"}, true, {
        onSelected = function()
            _Plaintes.Info.datedenaissance = _Plaintes.KeyboardInput(_Plaintes.Translations.Menu.Date, "", 15)
            _Plaintes.Info.datedenaissance = GetOnscreenKeyboardResult()
        end,
    })
    RageUI.Button(_Plaintes.Translations.Menu.Num, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.numero.."~s~"}, true, {
        onSelected = function()
            _Plaintes.Info.numero = _Plaintes.KeyboardInput(_Plaintes.Translations.Menu.Num, "", 15)
            _Plaintes.Info.numero = GetOnscreenKeyboardResult()
        end,
    })
    RageUI.Button(_Plaintes.Translations.Menu.raison, _Plaintes.Translations.Menu.color1 .._Plaintes.Info.raison.."~s~", {LeftBadge = RageUI.BadgeStyle.Star}, true, {
        onSelected = function()
            _Plaintes.Info.raison = _Plaintes.KeyboardInput(_Plaintes.Translations.Menu.raison, "", 250)
            _Plaintes.Info.raison = GetOnscreenKeyboardResult()
        end,
    })
    RageUI.Button(_Plaintes.Translations.Menu.color2.."Envoyer votre plainte~s~ :", nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color2.."→~s~"}, true, {
        onSelected = function()
            if tostring(_Plaintes.Info.nom) == "" or tostring(_Plaintes.Info.nom) == nil then
                ESX.ShowNotification(_Plaintes.Translations.Menu.error_nom)
            elseif tostring(_Plaintes.Info.prenom) == "" or tostring(_Plaintes.Info.prenom) == nil then
                ESX.ShowNotification(_Plaintes.Translations.Menu.error_prenom)
            elseif tostring(_Plaintes.Info.datedenaissance) == "" or tostring(_Plaintes.Info.datedenaissance) == nil then
                ESX.ShowNotification(_Plaintes.Translations.Menu.error_date)
            elseif tostring(_Plaintes.Info.numero) == "" or tostring(_Plaintes.Info.numero) == nil then
                ESX.ShowNotification(_Plaintes.Translations.Menu.error_tel)
            elseif tostring(_Plaintes.Info.raison) == "" or tostring(_Plaintes.Info.raison) == nil then
                ESX.ShowNotification(_Plaintes.Translations.Menu.error_raison)
            else
                _Plaintes.SendPlaintes()
            end
        end,
    })
end

function _Plaintes.SendPlaintes()
    TriggerServerEvent(("%s:InsertPlaintes_"):format(_Plaintes.Event.Prefix), _Plaintes.Info)
    ESX.ShowNotification(_Plaintes.Translations.Menu.color2.._Plaintes.Translations.Menu.success_plainte)
    RealoadInfo()
    RageUI.CloseAll()
end

RegisterNetEvent(("%s:RecupPlaintes_"):format(_Plaintes.Event.Prefix))
AddEventHandler(("%s:RecupPlaintes_"):format(_Plaintes.Event.Prefix), function(ListesPlaintes)
    _Plaintes.ListePlaintes = ListesPlaintes
end)

function _ListesPlaintesButton()
    RageUI.Line()
    if #_Plaintes.ListePlaintes < 1 then 
        RageUI.Separator(_Plaintes.Translations.Menu.no_plaintes)
        RageUI.Line()
    else
        for k,v in pairs(_Plaintes.ListePlaintes) do
            RageUI.Button("Plainte N°"..v.id, nil, {LeftBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    _Plaintes.Info = v
                    RageUI.Visible(_Plaintes.Menu.intoliste, true)
                end,
            })
        end
    end
end

function _IntoListesPlaintesButton()
    RageUI.Separator("Plainte N°".._Plaintes.Info.id)
    RageUI.Line()
    RageUI.Button(_Plaintes.Translations.Menu.Nom,nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.nom.."~s~"}, true, {})
    RageUI.Button(_Plaintes.Translations.Menu.Prenom,nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.prenom.."~s~"}, true, {})
    RageUI.Button(_Plaintes.Translations.Menu.Date,nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.datedenaissance.."~s~"}, true, {})
    RageUI.Button(_Plaintes.Translations.Menu.Num,nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color1 .._Plaintes.Info.numero.."~s~"}, true, {})
    RageUI.Button(_Plaintes.Translations.Menu.raison2,_Plaintes.Translations.Menu.raison2.._Plaintes.Translations.Menu.color1.._Plaintes.Info.raison.."~s~", {LeftBadge = RageUI.BadgeStyle.Star}, true, {})
    RageUI.Line()
    RageUI.Button(_Plaintes.Translations.Menu.delete_plaintes, nil, {LeftBadge = RageUI.BadgeStyle.Star, RightLabel = _Plaintes.Translations.Menu.color3.."→~s~"}, true, {
        onSelected = function()
            TriggerServerEvent(("%s:DeletePlaintes_"):format(_Plaintes.Event.Prefix), _Plaintes.Info.id)
            Wait(100)
            TriggerServerEvent(("%s:RecupPlaintes_"):format(_Plaintes.Event.Prefix))
            RageUI.Visible(_Plaintes.Menu.Listemain, true)
            ESX.ShowNotification("~r~La plainte N°".._Plaintes.Info.id.." à bien été supprimée !")
            RealoadInfo()
        end,
    })
end

function RealoadInfo()
    _Plaintes.Info = {
        nom = "",
        prenom = "",
        datedenaissance = "",
        numero = "",
        raison = "",
    }
end