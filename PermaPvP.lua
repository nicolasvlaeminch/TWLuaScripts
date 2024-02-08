function PermaPvPZone(event, player, newZone, newArea)

	if not (player:HasSpell(80000)) then
		if (((player:GetLevel() > 19) and (player:IsPvPFlagged() == false))) then
			player:SetPvP(true);
		end
    end
	
end

function PermaPvPCombat(event, player, enemy)

	if not (player:HasSpell(80000)) then
		if (((player:GetLevel() > 19) and (player:IsPvPFlagged() == false))) then
			player:SetPvP(true);
		end
    end
	
end


RegisterPlayerEvent(27, PermaPvPZone)
RegisterPlayerEvent(33, PermaPvPCombat)