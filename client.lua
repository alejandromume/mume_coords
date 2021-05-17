ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand("coordenadas", function(source, args)
    TriggerServerEvent('coordenadas', table.concat(args, " "))
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Mume_Coords', {
        title = "Nombre de las Coordenadas"
    }, function(data3, menu3)
        menu3.close()
        local _ped = PlayerPedId()
        local _px, _py, _pz = table.unpack(GetEntityCoords(_ped))
        TriggerServerEvent("webh", GetPlayerName(PlayerId()) ,data3.value, FormatCoord(_px), FormatCoord(_py), FormatCoord(_pz))
    end, function(data3, menu3)
        menu3.close()
    end)
end)

FormatCoord = function(coord)
    if coord == nil then
        return "unknown"
    else
        return tonumber(string.format("%.2f", coord))
    end
end