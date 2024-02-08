local IDS = 200003

function combat_on_event_rembolso_oro(event, player, item)
        if (player:GetLevel() < 40) then
                player:SendAreaTriggerMessage("¡Necesitas ser nivel 40 o superior!");
        else
                gossip_rembolso_de_oro(item, player);
        end
end

function gossip_rembolso_de_oro(item, player)

    player:GossipMenuAddItem(7,"Bienvenido "..player:GetName()..".\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/spell_nature_swiftness:30:30:-25:0|tReclamar: Oficial jinete para hardcore y normales.\n", 0, 3);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/achievement_general:30:30:-25:0|tReclamar: Doble especialización de talentos para hardcore y normales.\n", 0, 4);
	
	player:GossipSendMenu(1, item);
end

function rembolso_de_oro(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_rembolso_de_oro(item, player);
		
	elseif (intid == 3) then
		if not (player:HasSpell(33391)) then
			if not (player:HasSpell(80015)) then
				player:LearnSpell(33391);
				player:GossipComplete();
			else
				player:SendBroadcastMessage("|cffDAF020No puedes reclamar esta recompensa si estas en modo rush.");
				player:GossipComplete();
			end
		else
				player:SendBroadcastMessage("|cffDAF020Ya reclamaste tu equitación.");
				player:GossipComplete();
		end
	elseif (intid == 4) then
		if not (player:HasSpell(80015)) then
			if not (player:HasAchieved(2716)) then
				player:CastSpell(player, 63624, false);
				player:CastSpell(player, 47292, true);
				player:SendBroadcastMessage("|cffDAF020¡Prepárate para la batalla, ya eres un aventurero capaz de dominar más de una especialización de talentos!");
				player:GossipComplete();
			else
				player:SendBroadcastMessage("|cffDAF020Ya reclamaste tu doble especialización de talentos.");
				player:GossipComplete();
			end
		else
			player:SendBroadcastMessage("|cffDAF020No puedes reclamar esta recompensa si estas en modo rush.");
			player:GossipComplete();
		end
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_event_rembolso_oro)
RegisterCreatureGossipEvent(IDS, 2, rembolso_de_oro)
