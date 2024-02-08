local IDS = 200009

    function combat_on_event_zona_iniciales(event, player, item)
            if (player:IsInCombat() == true) then
                    player:SendAreaTriggerMessage("¡Estas en combate!");
            else
				if (player:IsHorde()) then
					gossip_teleport_zona_iniciales(item, player);
				else
					gossip_teleport_zona_iniciales_alianza(item, player);
				end
            end
end

function gossip_teleport_zona_iniciales(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al Portal a Zonas Iniciales.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Durotar.\n", 0, 1);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Claros de Tirisfal.\n", 0, 2);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Mulgore.\n", 0, 3);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Bosque Canción Eterna.\n", 0, 4);
	
	player:GossipSendMenu(1, item);
end

function gossip_teleport_zona_iniciales_alianza(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al Portal a Zonas Iniciales.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Bosque de Elwynn.\n", 0, 5);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Dun Morogh.\n", 0, 6);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Teldrassil.\n", 0, 7);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_shadow_teleport:30:30:-25:0|tIr a Isla Bruma Azur.\n", 0, 8);
	
	player:GossipSendMenu(1, item);
end

function teleport_zona_iniciales(event, player, item, sender, intid, code)

	if (intid == 0) then
		if (player:IsHorde()) then
			gossip_teleport_zona_iniciales(item, player);
		else
			gossip_teleport_zona_iniciales_alianza(item, player);
		end
		
	elseif (intid == 1) then
		player:Teleport(1, -618.518, -4251.67, 38.718, 0);
		player:GossipComplete();
		
	elseif (intid == 2) then
		player:Teleport(0, 1676.71, 1678.31, 121.67, 2.70526);
		player:GossipComplete();
		
	elseif (intid == 3) then
		player:Teleport(1, -2917.58, -257.98, 52.9968, 0);
		player:GossipComplete();
		
	elseif (intid == 4) then
		if	(player:GetRace() == 10) then
			player:Teleport(530, 10349.6, -6357.29, 33.4026, 5.31605);
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("¡Solo los Elfos de sangre pueden usar este portal!");
			player:GossipComplete();
		end
		
	elseif (intid == 5) then
		player:Teleport(0, -8949.95, -132.493, 83.5312, 0);
		player:GossipComplete();
		
	elseif (intid == 6) then
		player:Teleport(0, -6240.32, 331.033, 382.758, 0);
		player:GossipComplete();
		
	elseif (intid == 7) then
		player:Teleport(1, 10311.3, 832.463, 1326.41, 5.69632);
		player:GossipComplete();
		
	elseif (intid == 8) then
		if	(player:GetRace() == 11) then
			player:Teleport(530, -3961.64, -13931.2, 100.615, 2.08364);
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("¡Solo los Draenei pueden usar este portal!");
			player:GossipComplete();
		end
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_event_zona_iniciales)
RegisterCreatureGossipEvent(IDS, 2, teleport_zona_iniciales)