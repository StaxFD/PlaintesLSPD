_Plaintes = _Plaintes or {}
_Plaintes.Menu = _Plaintes.Menu or {}
_Plaintes = {
    ESX = "esx:getSharedObject",
    Event = {
        Prefix = "_/Stax_/",
    },
    PositionsPlaintes = {
        {pos = vector3(442.034851, -981.360352, 30.689611)},	
    },
    PositionsListePlaintes = {
        {pos = vector3(440.938477, -975.709839, 30.68961)},	
    },
    Info = {
        nom = "",
        prenom = "",
        datedenaissance = "",
        numero = "",
        raison = "",
    },
    Markers = {
        Type = 22,
        TailleX = 0.5,
        TailleY = 0.5,
        TailleZ = 0.5,
        CouleurR = 255,
        CouleurG = 255,
        CouleurB = 255, 
        Opacite = 155,
    },
    Blips = {
        Sprite = 525,
        Scale = 0.65,
        Color = 3,
        Display = 4,
        AsShortRange = true,
        Name = "Plaintes",  
    },
    ["Translations"] = {
        ["Menu"] = {
            ["Title"] = "Plaintes",
            ["SubTitle"] = "Plaintes",
            ["Button"] = "Plaintes",
            ["TypeAdvancedNotif"] = "esx:showAdvancedNotification",
            ["TypeNotif"] = "esx:showNotification",
            ["HelpNotif"] = "Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu plaintes ~HC_11~LSPD ~BLIP_police_station~ ~s~",
            ["Nom"] = "Nom :",
            ["Prenom"] = "Prénom :",
            ["Date"] = "Date de naissance :",
            ["Num"] = "Numéro de téléphone :",
            ["raison"] = "Votre plainte :",
            ["raison2"] = "Raison : ",
            ["color1"] = "~b~",
            ["color2"] = "~g~",
            ["color3"] = "~r~",
            ["success_plainte"] = "Votre plainte a bien été envoyée !",
            ["no_plaintes"] = "~r~Aucune plaintes~s~",
            ["delete_plaintes"] = "~r~Supprimer la plainte~s~ :",
            ["error_nom"] = "~r~Vous devez entrer un nom valide~s~",
            ["error_prenom"] = "~r~Vous devez entrer un prenom valide~s~",
            ["error_date"] = "~r~Vous devez entrer une date valide~s~",
            ["error_tel"] = "~r~Vous devez entrer un numéro valide~s~",
            ["error_raison"] = "~r~Vous devez entrer une raison valide~s~",
        },
    }
}


