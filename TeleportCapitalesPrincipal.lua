local IDS = 200014

    function combat_on_event_capitalesprincipales(event, player, item)
            if (player:IsInCombat() == true) then
                    player:SendAreaTriggerMessage("¡Estas en combate!");
            else
                    gossip_hardcore_mode_capitalesprincipales(item, player);
            end
end

function gossip_hardcore_mode_capitalesprincipales(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al Portal de Capital Principal.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a la Capital Principal.\n", 0, 1, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|n|cffffffff¿Estás seguro que quieres ir a la Capital Principal?\n");
	
	player:GossipSendMenu(1, item);
end

function hardcore_mode_capitalesprincipales(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_hardcore_mode_capitalesprincipales(item, player);
		
	elseif (intid == 1) then
		if (player:GetLevel() > 49) then
			if (player:IsHorde()) then
				player:Teleport(1, 1604.854858, -4389.495117, 10.174105, 3.921458);
				player:GossipComplete();
			else
				player:Teleport(0, -8833.379883, 628.627991, 94.006599, 2.221457);
				player:GossipComplete();
			end
		else
			player:SendBroadcastMessage("Necesitas ser nivel 49 o superior para usar este portal.");
			player:GossipComplete();
		end
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_event_capitalesprincipales)
RegisterCreatureGossipEvent(IDS, 2, hardcore_mode_capitalesprincipales)