function RacialElfo(event, player, spell, target)

	if ((player:HasSpell(80000)) and (player:HasSpell(58984))) then
		player:RemoveSpell(58984);
    end
	
end


RegisterPlayerEvent(3, RacialElfo)