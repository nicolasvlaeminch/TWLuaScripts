function RevivirHardcoreDonacion(event, player, spell, target)

local guild = GetGuildByName("Modo Hardcore");

	if not (player:HasSpell(80000)) then
		if (player:GetGuildId() == 2) then
			guild:DeleteMember(player);
			player:RemoveSpell(80001);
			player:RemoveSpell(19885);
			player:SendBroadcastMessage("|cffDAF020¡Has vuelto de la muerte, pero ya no eres Hardcore!");
			if (player:HasSpell(58984)) then
				player:RemoveSpell(26297);
			end
		end
    end
	
end


RegisterPlayerEvent(3, RevivirHardcoreDonacion)