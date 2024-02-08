local function AntiSigilo(event, player) 

	if (player:HasSpell(80000)) then
		if not (player:HasSpell(80001)) then
			player:LearnSpell(80001);
			player:LearnSpell(19885);
			player:SendBroadcastMessage("Ahora tienes detección de sigilo aumentando durante el modo hardcore.");
		end
	end
	
end


RegisterPlayerEvent(3, AntiSigilo)