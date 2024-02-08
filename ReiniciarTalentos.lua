local IDS = 200006

    function combat_on_reiniciar_talentos(event, player, item)
            if (player:IsInCombat() == true) then
                    player:SendAreaTriggerMessage("¡Estas en combate!");
            else
                    gossip_reiniciar_talentos(item, player);
            end
end

function gossip_reiniciar_talentos(item, player)

    player:GossipMenuAddItem(7,"Bienvenido "..player:GetName().." puedo ayudarte a reiniciar tus talentos.\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_misc_book_04:30:30:-25:0|tReiniciar tus talentos.\n", 0, 1, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|n|cffffffff¿Estás seguro que quieres reiniciar tus talentos?\n");
	
	player:GossipSendMenu(1, item);
end

function reiniciar_talentos_low(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_reiniciar_talentos(item, player);
		
	elseif (intid == 1) then
		player:ResetTalents(true);
		player:SendBroadcastMessage("|cffDAF020Tus talentos fueron reiniciados.");
		player:GossipComplete();
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on_reiniciar_talentos)
RegisterCreatureGossipEvent(IDS, 2, reiniciar_talentos_low)
