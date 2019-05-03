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

name = "Oscula"
mypalette = 0
headpalette = 0
hairpalette = 0


//need special nemesis weapon

myweapon = 3//for now use spookybar
myweaponlist = sMakeItemData(myweapon,-1)
ds_list_add(inventorylist,myweaponlist)

    

strength = 10
skill = 80
accuracy = 80
maxhp = 50
hp = maxhp
defense = 6
mspeed = 2

strengthchance = 50
skillchance = 70
accuracychance = 40
maxhpchance = 60
defensechance = 50
mspeedchance = 50



moverange = 7
movepoints = moverange
uprange = 3
team = 2//enemy team
unittype = 3//unit type, spooky robit
unitanimtype = 1//humanoid animation type
gender = 0//0 is female
tlevel = 16
level = 16

shadowsprite = splargeshadow4


/* */
/*  */
