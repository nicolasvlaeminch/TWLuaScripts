local IDS = 200016

    function combat_on_reiniciar_raidsid(event, player, item)
            if (player:IsInCombat() == true) then
                    player:SendAreaTriggerMessage("¡Estas en combate!");
            else
                    gossip_reiniciar_raidsid(item, player);
            end
end

function gossip_reiniciar_raidsid(item, player)

    player:GossipMenuAddItem(7,"Bienvenido "..player:GetName().." puedo ayudarte a reiniciar tus bandas.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_misc_book_04:30:30:-25:0|tReiniciar bandas.\n", 0, 1, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|n|cffffffff¿Estás seguro que quieres reiniciar tus bandas?\n");
	
	player:GossipSendMenu(1, item);
end

function reiniciar_raidsid_low(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_reiniciar_raidsid(item, player);
		
	elseif (intid == 1) then
		player:UnbindAllInstances();
		player:SendBroadcastMessage("|cffDAF020Tus bandas fueron reiniciadas.");
		player:GossipComplete();
		
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_reiniciar_raidsid)
RegisterCreatureGossipEvent(IDS, 2, reiniciar_raidsid_low)
