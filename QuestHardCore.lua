-- local IDS = 200016

    -- function combat_on_event_hardcore_quest(event, player, item)
            -- if (player:IsInCombat() == true) then
                    -- player:SendAreaTriggerMessage("¡Estas en combate!");
            -- else
                    -- gossip_hardcore_mode_quest_hardcore(item, player);
            -- end
	-- end

	-- function gossip_hardcore_mode_quest_hardcore(item, player)

		-- player:GossipMenuAddItem(7,"Bienvenido al Reto Hardcore de Molten Core.\n\n", 0, 0);
		-- player:GossipMenuAddItem(1,"|Tinterface/Icons/ability_creature_cursed_02:30:30:-25:0|tActivar el Reto Hardcore de Molten Core.\n", 0, 1, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|nAl morir en modo hardcore antes de completar el reto perderas tu personaje permanentemente.\n\n|cffffffff¿Estas seguro de activar el modo hardcore?\n");
		
		-- player:GossipSendMenu(1, item);
	-- end

	-- function hardcore_mode_hardcore_quest(event, player, item, sender, intid, code)

		-- if (intid == 0) then
			-- gossip_hardcore_mode_quest_hardcore(item, player);
			
		-- elseif (intid == 1) then
			-- if (player:GetLevel() == 60) then
				-- player:AddQuest(190003);
				-- player:LearnSpell(80000);
				-- player:SendBroadcastMessage("Reto Hardcore de Molten Core activado!");
				-- player:GossipComplete();
			-- else
				-- player:SendBroadcastMessage("Necesitas ser nivel 60 para tomar este reto.");
				-- player:GossipComplete();
			-- end
		-- end
		
	-- end
	
    -- function complete_quest_hardcore(event, player, quest)
	
		-- if (player:CanCompleteQuest(190003)) then
			-- player:RemoveSpell(80000);
		-- end
		
	-- end
	

-- RegisterCreatureGossipEvent(IDS, 1, combat_on_event_hardcore_quest)
-- RegisterCreatureGossipEvent(IDS, 2, hardcore_mode_hardcore_quest)
-- RegisterPlayerEvent(54, complete_quest_hardcore)