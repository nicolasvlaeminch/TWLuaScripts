local ZoneCheck = {
        AllowedZones = {
		
--      Zonas LK	
	
    [3537] = true,
    [3711] = true,
    [4197] = true,
    [65] = true,	
    [210] = true,
    [67] = true,	
	[4742] = true,
	[4395] = true,
	[495] = true,

--      Zonas TBC
	[4080] = true,		
	[3521] = true,
	[3522] = true,
	[3523] = true,
	[3518] = true,
	[3519] = true,	
	[3520] = true,
	[3703] = true,
	[3483] = true,
	
        },
}
 
function ZoneCheck.OnChange(event, player, newZone)
        -- if not player:IsGM() then
                if (ZoneCheck.AllowedZones[newZone] and (player:IsGM() == false)) then
				player:Teleport(0, -14286.869141, 552.472229, 8.844465, 1.158765)
				player:SendBroadcastMessage("Zona Prohibida.")
                end
        -- end
end
 
RegisterPlayerEvent(27, ZoneCheck.OnChange)