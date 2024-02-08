 function TeleportClass(event, player, quest)
 
	if (quest:GetPrevQuestId() == 47008) then
		player:Teleport(530, 9526.316406, -6837.052734, 16.493971, 4.693541);
		player:SetReputation(911, 3000)
	elseif (quest:GetPrevQuestId() == 47010) then
		player:Teleport(530, -4127.413574, -13735.888672, 74.623520, 1.584320);
	end
	
 end
 
RegisterPlayerEvent(54, TeleportClass)