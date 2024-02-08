local IDS = 200017

    function combat_on_event_inmortal(event, player, item)
            if (player:HasTitle(141)) then
				gossip_hardcore_mode_inmortal(item, player);
            else
                player:SendAreaTriggerMessage("Necesitas ser un Inmortal para usar este portal.");
				player:SendBroadcastMessage("Necesitas ser un Inmortal para usar este portal.");
            end
end

function gossip_hardcore_mode_inmortal(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al Portal del Salon de los Inmortales.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr al Salon de los Inmortales.\n", 0, 1, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|n|cffffffff¿Estás seguro que quieres ir al Salon de los Inmortales.?\n");
	
	player:GossipSendMenu(1, item);
end

function hardcore_mode_inmortal(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_hardcore_mode_inmortal(item, player);
		
	elseif (intid == 1) then
			player:Teleport(44, 321.835297, -53.972286, 30.828753, 1.535244);
			player:GossipComplete();
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_event_inmortal)
RegisterCreatureGossipEvent(IDS, 2, hardcore_mode_inmortal)