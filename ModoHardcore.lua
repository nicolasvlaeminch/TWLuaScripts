local IDS = 200000

    function combat_on(event, player, item)
            if (player:HasSpell(80015)) then
                    player:SendAreaTriggerMessage("Ya tienes otro modo de juego activado!");
            else
                    gossip_hardcore_mode(item, player);
            end
end

function gossip_hardcore_mode(item, player)

    player:GossipMenuAddItem(7,"Bienvenido al modo hardcore "..player:GetName()..".\n\n", 0, 0);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_misc_book_04:30:30:-25:0|t¿Que es el modo hardcore?\n", 0, 1);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_misc_bag_felclothbag:30:30:-25:0|t¿Cuales son las recompensas?\n", 0, 2);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/inv_misc_coin_01:30:30:-25:0|tReclamar recompensa.\n", 0, 5);
	player:GossipMenuAddItem(1,"|Tinterface/Icons/ability_creature_cursed_02:30:30:-25:0|tActivar modo hardcore.\n", 0, 3, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|nAl morir en modo hardcore perderas tu personaje permanentemente.\n\n|cffffffff¿Estas seguro de activar el modo hardcore?\n");
	
	player:GossipSendMenu(1, item)
end

function gossip_hardcore_mode_whatis(item, player)

    player:GossipMenuAddItem(7,".            |Tinterface/Icons/ability_creature_cursed_02:30:30:-25:0|t Modo Hardcore          |Tinterface/Icons/ability_creature_cursed_02:30:30:-25:0|t\n", 0, 1);
	player:GossipMenuAddItem(7,".        ¿Que es el modo hardcore?\n\n• Me he enterado de que buscas convertirte en un inmortal y codearte con los dioses. Para lograrlo, debes completar un reto.\n\n• En este desafío, si mueres antes de completarlo, tu ser le pertenecerá a Helya, la diosa de la muerte. Si estás dispuesto a correr este riesgo, debes leer las reglas. \n\nReglas:\n\n• Cuando tu personaje muera, el juego terminará para ti. Lo haces bajo tu propio riesgo: no restauraremos ningún personaje incondicional fallecido por ningún motivo, incluidos problemas de conexión, errores, calentamiento global, tu hermana pequeña o cualquier otro motivo.\n\n• No podrás comerciar ni comprar en la casa de subastas.\n\n• Podrás usar el correo, pero sin archivos adjuntos.\n\n• Estarás en la hermandad Modo Hardcore sin poder salir hasta completar el reto.\n\n• Solo podrás hacer grupo con jugadores que tengan 5 niveles de diferencia o menos.\n\n•A los elfos de la noche se les reemplazará su racial por Rabiar hasta que termine el reto.", 0, 1);
	
	player:GossipSendMenu(1, item)
end

function gossip_hardcore_mode_rewars(item, player)

    player:GossipMenuAddItem(7,".            |Tinterface/Icons/ability_creature_cursed_02:30:30:-25:0|t Modo Hardcore          |Tinterface/Icons/ability_creature_cursed_02:30:30:-25:0|t\n                     Recompensas:", 0, 2);
	player:GossipMenuAddItem(7,"|Tinterface/Icons/achievement_bg_killxenemies_generalsroom:30:30:-25:0|t• Titulo: El Inmortal.\n", 0, 2);
	-- player:GossipMenuAddItem(7,"|Tinterface/Icons/ability_mount_mammoth_brown:30:30:-25:0|t• Montura: Riendas del mamut de\n        tundra de viajero.\n", 0, 2);
	player:GossipMenuAddItem(7,"|Tinterface/Icons/spell_deathknight_summondeathcharger:30:30:-25:0|tUna de las siguientes monturas:\n       • Montura: Riendas de Invencible.\n                                   \n|Tinterface/Icons/inv_misc_key_06:30:30:-25:0|t• Montura: Meca / Chopper.\n\n|Tinterface/Icons/ability_mount_celestialhorse:30:30:-25:0|t• Montura: Corcel celestial.\n                                   \n|Tinterface/Icons/ability_mount_spectraltiger:30:30:-25:0|t• Montura: Riendas del tigre espectral presto.", 0, 2);
	player:GossipMenuAddItem(7,"|Tinterface/Icons/inv_misc_coin_01:30:30:-25:0|t• 1000 de oro.\n", 0, 2);
	
	player:GossipSendMenu(1, item)
end

function gossip_hardcore_mode_rewars_invensible_or_meca(item, player)

    player:GossipMenuAddItem(7,"Elige una montura:", 0, 5);
	player:GossipMenuAddItem(7,"|Tinterface/Icons/inv_misc_key_06:30:30:-25:0|t• Meca / Chopper.\n", 0, 6, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|nDebes tener espacio en tus mochilas para reclamar tus recompensas y completar el modo hardcore.\n\n|cffffffff¿Estás seguro que tienes espacio en tus mochilas?\n");
	player:GossipMenuAddItem(7,"|Tinterface/Icons/spell_deathknight_summondeathcharger:30:30:-25:0|t• Riendas de Invencible.\n", 0, 4, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|nDebes tener espacio en tus mochilas para reclamar tus recompensas y completar el modo hardcore.\n\n|cffffffff¿Estás seguro que tienes espacio en tus mochilas?\n");
	player:GossipMenuAddItem(7,"|Tinterface/Icons/ability_mount_celestialhorse:30:30:-25:0|t• Corcel celestial.\n", 0, 10, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|nDebes tener espacio en tus mochilas para reclamar tus recompensas y completar el modo hardcore.\n\n|cffffffff¿Estás seguro que tienes espacio en tus mochilas?\n");
	player:GossipMenuAddItem(7,"|Tinterface/Icons/ability_mount_spectraltiger:30:30:-25:0|t• Riendas del tigre espectral presto.\n", 0, 15, false, "|cffffff00 ¡Atención "..player:GetName().."!|n|nDebes tener espacio en tus mochilas para reclamar tus recompensas y completar el modo hardcore.\n\n|cffffffff¿Estás seguro que tienes espacio en tus mochilas?\n");	
	
	player:GossipSendMenu(1, item)
end

function hardcore_mode(event, player, item, sender, intid, code)

	if (intid == 0) then
		gossip_hardcore_mode(item, player);
		
	elseif (intid == 1) then
		gossip_hardcore_mode_whatis(item, player);

	elseif (intid == 2) then
		gossip_hardcore_mode_rewars(item, player);
	 
	elseif (intid == 3) then
	if (player:HasSpell(80000)) then
		player:SendBroadcastMessage("|cffDAF020Ya tienes activado el modo hardcore.");
		player:GossipComplete();
	else
		if (player:IsInGuild()) then
			player:SendBroadcastMessage("|cffDAF020No debes formar parte de una hermandad para activar el modo hardcore.");
		else
			if (player:GetLevel() == 1) then
				local guild = GetGuildByName("Modo Hardcore");
				player:LearnSpell(80000);
				guild:AddMember(player, 4);
				player:SetPvP(false);
				player:SendBroadcastMessage("|cffDAF020Modo hardcore activado.");
				if (player:HasSpell(58984)) then
					player:LearnSpell(26297);
					player:RemoveSpell(58984);
					player:SendBroadcastMessage("|cffDAF020Tu racial 'Fusión de las Sombras' fue cambiada por 'Rabiar' hasta completar el modo hardcore.");
				end
				player:GossipComplete();
				else
				player:SendBroadcastMessage("|cffDAF020Necesitas ser nivel 1 para poder activar el modo hardcore.");
				player:GossipComplete();
				end
			end
		end
	elseif (intid == 4) then
		local guild = GetGuildByName("Modo Hardcore");
		if ((player:HasSpell(80000)) and (player:GetLevel() == 60)) then
			guild:DeleteMember(player);
			player:RemoveSpell(80000);
			player:AddItem(50818);
			player:ModifyMoney(10000000);
			player:SetKnownTitle(141);
			if (player:HasSpell(26297) and player:IsAlliance()) then
				player:RemoveSpell(26297);
				player:LearnSpell(58984);
			end
			player:SendBroadcastMessage("|cffDAF020Recompensa entregada con éxito.");
			player:GossipComplete();
		else
			player:SendBroadcastMessage("|cffDAF020No cumples con los requisitos para reclamar esta recompensa.");
			player:GossipComplete();
		end
	elseif (intid == 5) then
		if ((player:HasSpell(80000)) and (player:GetLevel() == 60)) then
			gossip_hardcore_mode_rewars_invensible_or_meca(item, player);
		else
			player:SendBroadcastMessage("|cffDAF020No cumples con los requisitos para reclamar esta recompensa.");
			player:GossipComplete();
		end
		
	elseif (intid == 6) then
		local guild = GetGuildByName("Modo Hardcore");
		if ((player:HasSpell(80000)) and (player:GetLevel() == 60)) then
			guild:DeleteMember(player);
			player:RemoveSpell(80000);
			player:RemoveSpell(80001);
			player:RemoveSpell(19885);
			player:ModifyMoney(10000000);
			player:SetKnownTitle(141);
			if (player:IsAlliance()) then
				player:AddItem(44413);
			else
				player:AddItem(41508);
			end
			if (player:HasSpell(26297) and player:IsAlliance()) then
				player:RemoveSpell(26297);
				player:LearnSpell(58984);
			end
			player:SendBroadcastMessage("|cffDAF020Recompensa entregada con éxito.");
			player:GossipComplete();
		else
			player:SendBroadcastMessage("|cffDAF020No cumples con los requisitos para reclamar esta recompensa.");
			player:GossipComplete();
		end
	
	elseif (intid == 10) then
		local guild = GetGuildByName("Modo Hardcore");
		if ((player:HasSpell(80000)) and (player:GetLevel() == 60)) then
			guild:DeleteMember(player);
			player:RemoveSpell(80000);
			player:AddItem(54811);
			player:ModifyMoney(10000000);
			player:SetKnownTitle(141);
			if (player:HasSpell(26297) and player:IsAlliance()) then
				player:RemoveSpell(26297);
				player:LearnSpell(58984);
			end
			player:SendBroadcastMessage("|cffDAF020Recompensa entregada con éxito.");
			player:GossipComplete();
		else
			player:SendBroadcastMessage("|cffDAF020No cumples con los requisitos para reclamar esta recompensa.");
			player:GossipComplete();
		end	
	
	elseif (intid == 15) then
		local guild = GetGuildByName("Modo Hardcore");
		if ((player:HasSpell(80000)) and (player:GetLevel() == 60)) then
			guild:DeleteMember(player);
			player:RemoveSpell(80000);
			player:AddItem(49284);
			player:ModifyMoney(10000000);
			player:SetKnownTitle(141);
			if (player:HasSpell(26297) and player:IsAlliance()) then
				player:RemoveSpell(26297);
				player:LearnSpell(58984);
			end
			player:SendBroadcastMessage("|cffDAF020Recompensa entregada con éxito.");
			player:GossipComplete();
		else
			player:SendBroadcastMessage("|cffDAF020No cumples con los requisitos para reclamar esta recompensa.");
			player:GossipComplete();
		end	
	end
end


function HardcoreLogin(event, player)

	if (player:HasSpell(80000)) then
		player:SendAreaTriggerMessage("¡Bienvenido "..player:GetName()..", estas en Modo Hardcore!");
	end
	
end

RegisterCreatureGossipEvent(IDS, 1, combat_on)
RegisterCreatureGossipEvent(IDS, 2, hardcore_mode)
RegisterPlayerEvent(3, HardcoreLogin)