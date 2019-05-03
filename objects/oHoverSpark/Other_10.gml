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

name = "Hoverspark"
mypalette = 0
headpalette = 0
hairpalette = 0

unittype = 5//unit type, hoverspark

myweapon = 11
myweaponlist = sMakeItemData(myweapon,-1)
ds_list_add(inventorylist,myweaponlist)

    
strength = 2
skill = 70
accuracy = 80
maxhp = 15
hp = maxhp
defense = 2
mspeed = 2

strengthchance = 50
skillchance = 70
accuracychance = 40
maxhpchance = 60
defensechance = 50
mspeedchance = 50



moverange = 6
movepoints = moverange
visionrange = 7
uprange = 3
team = 2//enemy team

unitanimtype = 2//float/bounce animation
shadowsprite = spsmallshadowbounce
gender = irandom(1)//switch random
tlevel = 3//target level for the unit

/* */
/*  */
