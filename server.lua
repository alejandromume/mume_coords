Config = {}
Config.green 				  = 56108
Config.grey 				  = 8421504
Config.red 					  = 16711680
Config.orange 				  = 16744192
Config.blue 				  = 2061822
Config.purple 				  = 11750815

RegisterServerEvent('webh')
AddEventHandler('webh', function(player, param, x, y, z)

    local DiscordWebHook = "WEBHOOK_URL" -- Your webhook right here.

    local embeds = {
        {
            ["title"]="```Jugador: " .. player .. "\n\nNombre: ".. param .."\n\n" .. x .. ", " .. y .. ", " .. z .. "\n\n" .. x .. " " .. y .. " " .. z .. "\n\n" .. "{x = " .. x .. ", y = " .. y .. ", z = " .. z .."}```",
            ["type"]="rich",
            ["color"] = Config.purple,
        }
    }


    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Coordenadas", embeds = embeds}), { ['Content-Type'] = 'application/json' })
    TriggerClientEvent('esx:showNotification', _source, "Has enviado las coordenadas con el nombre de: ~r~".. param )
end)
