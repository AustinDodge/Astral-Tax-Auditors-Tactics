maxhitpoints = myunit.maxhp
starthitpoints = myunit.hp
actualhitpoints = starthitpoints + heal//the number of hitpoints the unit will have at the end
if actualhitpoints  > maxhitpoints{
    actualhitpoints = maxhitpoints//correct so it doesn't go over max hp
    }
greenpoints = starthitpoints
hpdifference = actualhitpoints - starthitpoints
redpoints = 0
alarm[0] = 20


