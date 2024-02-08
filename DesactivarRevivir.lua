
local function PlayerDeathCreature(event, creature, player)
    if(player:HasSpell(80000)) then
		if (player:GetLevel() >= 5) then
			SendWorldMessage("|cffDA0808¡Ha ocurrido una catástrofe! "..player:GetName().." muere al nivel "..player:GetLevel().." asesinado por la criatura "..creature:GetName().." nivel "..creature:GetLevel().." en modo hardcore.");
			creature:SummonGameObject(888, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 86400);
		end
    end
end

local function PlayerDeathPvP(event, killer, killdead)
    if(killdead:HasSpell(80000)) then
		if (killdead:GetLevel() >= 5) then
			if (killer:GetGUIDLow() == killdead:GetGUIDLow()) then
				killdead:LearnSpell(80014);
				killdead:SendBroadcastMessage("Moriste asesinado por un error del juego puedes volver a la vida sin perder el reto hardcore.");
			else
				killdead:LearnSpell(80014);
				killdead:SendBroadcastMessage("Moriste asesinado por un jugador puedes volver a la vida sin perder el reto hardcore.");
			end
		end
    end
end

local function AnnounceLvL(event, player, oldLevel)
    if(player:HasSpell(80000)) then
		if (player:GetLevel() == 10) then
			SendWorldMessage("|cff08A4DA¡El jugador "..player:GetName().." asciende hacia el camino a la inmortalidad, llego al nivel "..player:GetLevel().." en modo hardcore!");
		elseif (player:GetLevel() == 20) then
				SendWorldMessage("|cff08A4DA¡El jugador "..player:GetName().." asciende hacia el camino a la inmortalidad, llego al nivel "..player:GetLevel().." en modo hardcore!");
		elseif (player:GetLevel() == 30) then
				SendWorldMessage("|cff08A4DA¡El jugador "..player:GetName().." asciende hacia el camino a la inmortalidad, llego al nivel "..player:GetLevel().." en modo hardcore!");
		elseif (player:GetLevel() == 40) then
				SendWorldMessage("|cff08A4DA¡El jugador "..player:GetName().." asciende hacia el camino a la inmortalidad, llego al nivel "..player:GetLevel().." en modo hardcore!");
		elseif (player:GetLevel() == 50) then
				SendWorldMessage("|cff08A4DA¡El jugador "..player:GetName().." asciende hacia el camino a la inmortalidad, llego al nivel "..player:GetLevel().." en modo hardcore!");
		elseif (player:GetLevel() == 60) then
				SendWorldMessage("|cffFFC300¡El jugador "..player:GetName().." completo el camino hacia la inmortalidad, llego al nivel "..player:GetLevel().." en modo hardcore, ahora es un inmortal!");
				player:SendBroadcastMessage("¡Felicidades, jugador, por alcanzar el nivel 60 y convertirte en un inmortal! Vuelve con la Vakiria para recibir las recompensas.");
		end
    end
end

local function BanearRevivir(event, player, oldLevel)
    if(player:HasSpell(80000)) then
		if not (player:HasSpell(80014)) then
			Ban(1, player:GetName(), 999999999);
		else
			player:RemoveSpell(80014);
		end
	end
end


RegisterPlayerEvent(8, PlayerDeathCreature)
RegisterPlayerEvent(6, PlayerDeathPvP)
RegisterPlayerEvent(13, AnnounceLvL)
RegisterPlayerEvent(36, BanearRevivir)