_Plaintes.Menu = _Plaintes.Menu or {}
_Plaintes.ListePlaintes = _Plaintes.ListePlaintes or {}
_Plaintes.Menu.Create = function()
    _Plaintes.Menu.main = RageUI.CreateMenu(_Plaintes.Translations.Menu.Title, _Plaintes.Translations.Menu.Title)
end
_Plaintes.Menu.Liste = function()
    _Plaintes.Menu.Listemain = RageUI.CreateMenu(_Plaintes.Translations.Menu.Title, _Plaintes.Translations.Menu.Title)
    _Plaintes.Menu.intoliste = RageUI.CreateSubMenu(_Plaintes.Menu.Listemain,_Plaintes.Translations.Menu.Title, _Plaintes.Translations.Menu.Title)
end