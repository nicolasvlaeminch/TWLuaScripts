function EntrarEnCombate(event, creature, target)
    creature:SendUnitYell("¡Vení para acá cagón!", 0);
end

function MuereMago(event, creature, target)
    creature:SendUnitYell("¡Nos vemoooh!", 0);
end

function ReviveMago(event, creature, target)
    SendWorldMessage("¡Atención Guerreros de Azeroth! El Rey Richard acaba de revivir.");
end

RegisterCreatureEvent(50004, 1, EntrarEnCombate)
RegisterCreatureEvent(50004, 4, MuereMago)
RegisterCreatureEvent(50004, 5, ReviveMago)