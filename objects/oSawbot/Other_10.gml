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

name = "Sawbot"
mypalette = 0
headpalette = 0
hairpalette = 0

strength = 6
skill = 60
accuracy = 60
maxhp = 20
hp = maxhp
defense = 4
mspeed = 2

strengthchance = 50
skillchance = 70
accuracychance = 40
maxhpchance = 60
defensechance = 50
mspeedchance = 50

myweapon = 15
myweaponlist = sMakeItemData(myweapon,-1)
ds_list_add(inventorylist,myweaponlist)


moverange = 5
movepoints = moverange
visionrange = 7
uprange = 1
team = 2//enemy team
unittype = 9//unit type, kinetic cabra
unitanimtype = 2//float/bounce animation
shadowsprite = spsmallshadowbounce
gender = irandom(1)//switch random

tlevel = 3//target level for the unit


/* */
/*  */
