local function SigiloLogHardcore(event, player) 

	if (player:HasSpell(80000)) then
		player:AddAura(58984, player);
	end
	
end

RegisterPlayerEvent(3, SigiloLogHardcore)
