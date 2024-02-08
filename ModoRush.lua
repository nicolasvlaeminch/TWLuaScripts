local IDS = 200012

    function modorush_combat(event, player, item)
            if (player:HasSpell(80000)) then
                    player:SendAreaTriggerMessage("Ya tienes otro modo de juego activado!");
            else
                    modorush_menu(item, player);
            end
end

function modorush_menu(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al modo rush "..player:GetName()..".\n\n", 0, 0)
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_misc_book_07:30:30:-25:0|t¿Que es el modo rush?\n", 0, 1)
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_holy_rune:30:30:-25:0|t¿Cuales son los beneficios?\n", 0, 2)
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_gizmo_rocketlauncher:30:30:-25:0|tActivar modo rush.\n", 0, 3, false, "|cffffff00 ¡Atención "..player:GetName().."\n\n|cffffffff¿Estás seguro de activar el modo rush?\n")
	
	player:GossipSendMenu(1, item);
end

function gossip_rush_mode_whatis(item, player)

    player:GossipMenuAddItem(7,".            |Tinterface/Icons/inv_gizmo_rocketlauncher:30:30:-25:0|t Modo rush          |Tinterface/Icons/inv_gizmo_rocketlauncher:30:30:-25:0|t\n", 0, 1)
	player:GossipMenuAddItem(7,".        ¿Que es el modo rush?\n\n• Es un modo de juego en el cual podrás subir de nivel de una manera más rápida y sencilla, ya que tendrás experiencia aumenta en un 300% y tendrás autoaprendizaje de hechizos.", 0, 1)
	
	player:GossipSendMenu(1, item)
end

function gossip_rush_mode_rewars(item, player)

    player:GossipMenuAddItem(7,".            |Tinterface/Icons/inv_gizmo_rocketlauncher:30:30:-25:0|t Modo rush          |Tinterface/Icons/inv_gizmo_rocketlauncher:30:30:-25:0|t\n                     Beneficios:", 0, 2)
	player:GossipMenuAddItem(7,"|Tinterface/Icons/spell_chargepositive:30:30:-25:0|t• Experiencia aumenta en un 300%.\n", 0, 2)
	player:GossipMenuAddItem(7,"|Tinterface/Icons/spell_holy_devineaegis:30:30:-25:0|t• Autoaprendizaje de hechizos.\n", 0, 2)
	
	player:GossipSendMenu(1, item)
end

function modorush(event, player, item, sender, intid, code)
	if (intid == 0) then
		modorush_menu(item, player);
		
	elseif (intid == 1) then
		gossip_rush_mode_whatis(item, player);

	elseif (intid == 2) then
		gossip_rush_mode_rewars(item, player);
		
	elseif (intid == 3) then
		if (player:GetLevel() == 1) then
			if not (player:HasSpell(80015)) then
				player:LearnSpell(80015);
				player:CastSpell(player, 47292, true);
				player:SendBroadcastMessage("|cffDAF020Modo rush activado.");
				player:GossipComplete();
			else
				player:SendBroadcastMessage("|cffDAF020Ya tienes el modo rush activado.");
				player:GossipComplete();
			end
		else
			player:SendBroadcastMessage("|cffDAF020Necesitas ser nivel 1 para poder activar el modo rush.");
			player:GossipComplete();
		end
	end
end

RegisterCreatureGossipEvent(IDS, 1, modorush_combat);
RegisterCreatureGossipEvent(IDS, 2, modorush);