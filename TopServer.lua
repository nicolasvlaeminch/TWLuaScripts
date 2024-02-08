-- MENUS  DE TOPS

function TopServer(event, player, command, unit)

	if command == "top" then
        if (player:IsInCombat() == true) then
			player:SendAreaTriggerMessage("¡No puedes hacer esto en combate!");
			player:SendBroadcastMessage("¡No puedes hacer esto en combate!");
			return false
		else
			MenuTopServer(event, player);
			return false
		end
	end
end

function MenuTopServer(event, player)
    player:GossipClearMenu();
	player:GossipMenuAddItem(7,"Bienvenido "..player:GetName().." a los tops de los mejores jugadores del reino, selecciona el top que desees ver y conoce a los mejores jugadores:\n\n", 0, 0);
    player:GossipMenuAddItem(0, "|TInterface\\icons\\ability_creature_cursed_02:40:40:-25:0|t Top Hardcore.|r\n", 0, 15);
    player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_boss_ragnaros:40:40:-25:0|t Top Classic.|r\n", 0, 17);
    player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_gizmo_rocketlauncher:40:40:-25:0|t Top Rush.|r\n", 0, 20);
	
    player:GossipSendMenu(1, player, 100)
end

function MenuTopServerServerSelect(event, player, _, sender, intid, code)
    if (intid == 0) then
        MenuTopServer(event, player);
	elseif (intid == 15) then  
	player:SendBroadcastMessage("                              |Tinterface/Icons/ability_creature_cursed_02:20:20:-25:0|t Top Hardcore          |Tinterface/Icons/ability_creature_cursed_02:20:20:-25:0|t")
        local resultado = CharDBQuery("SELECT name, time FROM top_hardcore ORDER BY time ASC LIMIT 5")
			repeat
                    local playername = resultado:GetString(0);
                    local levelplayer = resultado:GetFloat(1);
					local formattedLevel = string.format("%.2f", levelplayer) -- Formatear a dos decimales
						
                    player:SendBroadcastMessage("|cFFCD2EFBEl jugador|cFFBF00FF|r "..playername.." |cFFCD2EFBlogró completar el reto hardcore en |r"..formattedLevel.." |cFFCD2EFBminutos.");
					player:GossipComplete();
					until not resultado:NextRow();
		
	elseif (intid == 17) then 
		player:SendBroadcastMessage("                              |Tinterface/Icons/achievement_boss_ragnaros:20:20:-25:0|t Top Classic          |Tinterface/Icons/achievement_boss_ragnaros:20:20:-25:0|t")
        local resultado = CharDBQuery("SELECT name, time FROM top_classic ORDER BY time ASC LIMIT 5")
			repeat
                    local playername = resultado:GetString(0);
                    local levelplayer = resultado:GetFloat(1);
					local formattedLevel = string.format("%.2f", levelplayer) -- Formatear a dos decimales
						
                    player:SendBroadcastMessage("|cFFFF8000El jugador|cFFBF00FF|r "..playername.." |cFFFF8000logró completar el reto classic en |r"..formattedLevel.." |cFFFF8000minutos.");
					player:GossipComplete();
					until not resultado:NextRow();
					
	elseif (intid == 20) then 	
		player:SendBroadcastMessage("                              |Tinterface/Icons/inv_gizmo_rocketlauncher:20:20:-25:0|t Top Rush          |Tinterface/Icons/inv_gizmo_rocketlauncher:20:20:-25:0|t")
        local resultado = CharDBQuery("SELECT name, time FROM top_rush ORDER BY time ASC LIMIT 5")
			repeat
                    local playername = resultado:GetString(0);
                    local levelplayer = resultado:GetFloat(1);
					local formattedLevel = string.format("%.2f", levelplayer) -- Formatear a dos decimales
						
                    player:SendBroadcastMessage("|cFFFF0000El jugador|cFFBF00FF|r "..playername.." |cFFFF0000logró completar el reto rush en |r"..formattedLevel.." |cFFFF0000minutos.");
					player:GossipComplete();
					until not resultado:NextRow();
	end
end

-- AGREGAR A LOS TOPS SCRIPTS


function AddCharTopHardcore(event, player, oldLevel)
	if ((player:GetLevel() == 60) and (player:HasSpell(80000))) then
		totalPlayTime = player:GetTotalPlayedTime();
		tiempoTotal = totalPlayTime / 60;
		CharDBQuery("DELETE FROM `top_hardcore` WHERE `guid` LIKE "..player:GetGUIDLow()..";");
		CharDBQuery("INSERT INTO `top_hardcore` (`guid`, `name`, `time`) VALUES ("..player:GetGUIDLow()..", '"..player:GetName().."', "..tiempoTotal..")");
	end
		
end

function AddCharTopClassic(event, player, oldLevel)
	if (player:GetLevel() == 60) then
		if not ((player:HasSpell(80000)) or (player:HasSpell(80015))) then
			totalPlayTime = player:GetTotalPlayedTime();
			tiempoTotal = totalPlayTime / 60;
			CharDBQuery("DELETE FROM `top_classic` WHERE `guid` LIKE "..player:GetGUIDLow()..";");
			CharDBQuery("INSERT INTO `top_classic` (`guid`, `name`, `time`) VALUES ("..player:GetGUIDLow()..", '"..player:GetName().."', "..tiempoTotal..")");
		end
	end
		
end

function AddCharTopRush(event, player, oldLevel)
	if (player:GetLevel() == 60 and (player:HasSpell(80015))) then
		totalPlayTime = player:GetTotalPlayedTime();
		tiempoTotal = totalPlayTime / 60;
		CharDBQuery("DELETE FROM `top_rush` WHERE `guid` LIKE "..player:GetGUIDLow()..";");
		CharDBQuery("INSERT INTO `top_rush` (`guid`, `name`, `time`) VALUES ("..player:GetGUIDLow()..", '"..player:GetName().."', "..tiempoTotal..")");
	end
		
end

RegisterPlayerEvent(42, TopServer)
RegisterPlayerGossipEvent(100, 2, MenuTopServerServerSelect)  -- Register Event for Gossip Select
RegisterPlayerEvent(13, AddCharTopHardcore)
RegisterPlayerEvent(13, AddCharTopClassic)
RegisterPlayerEvent(13, AddCharTopRush)