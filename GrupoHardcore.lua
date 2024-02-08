function GrupoHardcoreCombat(event, player, enemy)

	if(player:IsInGroup() and (player:HasSpell(80000))) then
			local groupGuid = CharDBQuery("SELECT guid FROM group_member WHERE memberGuid="..player:GetGUIDLow())
			
			local groupGuidDos = groupGuid:GetUInt32(0);
			
			local resultado = CharDBQuery("SELECT memberGuid FROM group_member WHERE guid="..groupGuidDos.." ORDER BY memberGuid DESC LIMIT 5")
    repeat
			local guidPlayer = resultado:GetUInt32(0);
			local resultadoLevel = CharDBQuery("SELECT level FROM characters WHERE guid="..guidPlayer)
			local levelPlayer = resultadoLevel:GetUInt32(0);
						
			local sumaLevels = 	(player:GetLevel() - levelPlayer);	
			
			if not((sumaLevels <= 10) and (sumaLevels >= -10)) then
					player:RemoveFromGroup();
					player:SendBroadcastMessage("Los jugadores hardcore no pueden combatir en grupo con otros jugadores con diferencia de 5 niveles.");
				end
        until not resultado:NextRow()
	end
end

function GrupoHardcoreZone(event, player, difficulty, mapid, permanent)

	if(player:IsInGroup() and (player:HasSpell(80000))) then
			local groupGuid = CharDBQuery("SELECT guid FROM group_member WHERE memberGuid="..player:GetGUIDLow())
			
			local groupGuidDos = groupGuid:GetUInt32(0);
			
			local resultado = CharDBQuery("SELECT memberGuid FROM group_member WHERE guid="..groupGuidDos.." ORDER BY memberGuid DESC LIMIT 5")
    repeat
			local guidPlayer = resultado:GetUInt32(0);
			local resultadoLevel = CharDBQuery("SELECT level FROM characters WHERE guid="..guidPlayer)
			local levelPlayer = resultadoLevel:GetUInt32(0);
						
			local sumaLevels = 	(player:GetLevel() - levelPlayer);	
			
			if not((sumaLevels <= 10) and (sumaLevels >= -10)) then
					player:RemoveFromGroup();
					player:SendBroadcastMessage("Los jugadores hardcore no pueden combatir en grupo con otros jugadores con diferencia de 5 niveles.");
				end
        until not resultado:NextRow()
	end
end
 
RegisterPlayerEvent(33, GrupoHardcoreCombat)
RegisterPlayerEvent(26, GrupoHardcoreZone)