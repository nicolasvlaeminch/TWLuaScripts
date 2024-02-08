local IDS = 200013

    function combat_on_event_duelzone(event, player, item)
            if (player:IsInCombat() == true) then
                    player:SendAreaTriggerMessage("¡Estas en combate!");
            else
                    gossip_hardcore_mode_duelzone(item, player);
            end
end

function gossip_hardcore_mode_duelzone(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al Portal de la Zona de duelos.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a la Zona de duelos.\n", 0, 1, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|n|cffffffff¿Estás seguro que quieres ir a la Zona de duelos?\n");
	
	player:GossipSendMenu(1, item);
end

function hardcore_mode_duelzone(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_hardcore_mode_duelzone(item, player);
		
	elseif (intid == 1) then
		if (player:GetLevel() == 60) then
			player:Teleport(0, 4296.501465, -2763.406250, 16.4355, 3.719);
			player:GossipComplete();
		else
			player:SendBroadcastMessage("Necesitas ser nivel 60 para usar este portal.");
			player:SendAreaTriggerMessage("Necesitas ser nivel 60 para usar este portal.");
			player:GossipComplete();
		end
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_event_duelzone)
RegisterCreatureGossipEvent(IDS, 2, hardcore_mode_duelzone)