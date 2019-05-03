attackermove = 0//if the attacker is currently animated
defendermove = 0//if the defender is currently animated

animationstep = 0//the number of steps in the current attack animation
attackstep = 0//the current step of the current attack round

canclick = 0//can't click during the attack animations

awinduptime = 40//the number of frames the attacker will wind up for
astriketime = 80//the number of frames the attacker will hold the strike pose for
//not including the time animating the HP lowering
dwinduptime = awinduptime
dstriketime = astriketime

particletraveltime = 0//the longest particle travel time of the current unit

atraveltime = 0//the time it takes the attackers projectile to travel from the attacker to defender
attackerprojectilespeed = 0//the real number of steps it will take the projectile to travel one tile
atravelstartx = 0
atravelstarty = 0
atraveldestx = 0
atraveldesty = 0

dtraveltime = 0//vice versa
defenderprojectilespeed = 0
dtravelstartx = 0
dtravelstarty = 0
dtraveldestx = 0
dtraveldesty = 0


animating = 0//if attackcontrol is actually animating yet

defenderprevface = 0//the direction the defender was facing before the attack started

finished = 0//if oAttackControl has done everything it needs to do

endturnunit = -3000//the unit who's turn will end once this attack is over

attackerlist = ds_list_create()
attacker = -1//the unit that initiated the attack
attackermadekill = 0//if the attacking unit killed another unit
defenderlist = ds_list_create()
unitlist = ds_list_create()//all units that have made an attack this round
targetmap = ds_map_create()//the map that lists who is trying to attack who
hitmap = ds_map_create()

howmanyloops = 0//how many attacks have been made
animdone = 0


