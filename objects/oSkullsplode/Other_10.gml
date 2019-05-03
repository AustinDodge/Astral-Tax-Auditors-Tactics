facing = 3
anim = 1
/*
0 is still
1 is idle/walk
2 is short attack
3 is long attack
4 is recoil
5 is item throw
6 is item use
*/

//mypalette = auditormainpalettebase

name = "Skullsplode"
mypalette = 0
headpalette = 0
hairpalette = 0

strength = 1
skill = 0
accuracy = 0
maxhp = 10
hp = maxhp
defense = 2
mspeed = 2

strengthchance = 50
skillchance = 0
accuracychance = 0
maxhpchance = 60
defensechance = 50
mspeedchance = 50


myweapon = 10
myweaponlist = sMakeItemData(myweapon,-1)
ds_list_add(inventorylist,myweaponlist)



moverange = 4
movepoints = moverange
visionrange = 9
uprange = 2
team = 2//enemy team
unittype = 4//unit type, skullsplode, used for AI and map creation
unitanimtype = 2//float/bounce animation
shadowsprite = spsmallshadowbounce
gender = irandom(1)//switch random

tlevel = 3//target level for the unit

explodestatus = 1//the unit has explode status by defauly
showexplodestatus = 0//do not show it


/* */
/*  */
