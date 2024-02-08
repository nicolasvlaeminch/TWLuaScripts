local function SpellsFaltantesChamanPala(event, player) 

	if ((player:GetLevel() == 60)) then
		if ((player:GetClass() == 2) and (player:IsHorde())) then
			if not (player:HasSpell(53736)) then
				player:LearnSpell(53736);
			end
		elseif 	((player:GetClass() == 2) and (player:IsAlliance())) then
			if not (player:HasSpell(31801)) then
				player:LearnSpell(31801);
			end			
		elseif 	((player:GetClass() == 7) and (player:IsAlliance())) then
			if not (player:HasSpell(32182)) then
				player:LearnSpell(32182);
			end
		end
	end
	
end

local function SpellsFaltantesChamanPalaCambioLevel(event, player) 

	if ((player:GetLevel() == 60)) then
		if ((player:GetClass() == 2) and (player:IsHorde())) then
			player:LearnSpell(53736);
		elseif ((player:GetClass() == 7) and (player:IsAlliance())) then
			player:LearnSpell(32182);
		end
	end
	
end

RegisterPlayerEvent(3, SpellsFaltantesChamanPala)
RegisterPlayerEvent(13, SpellsFaltantesChamanPalaCambioLevel)
