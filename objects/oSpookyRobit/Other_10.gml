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

name = "Spooky Bot"
mypalette = 0
headpalette = 0
hairpalette = 0

if irandom(1) = 0{
    myweapon = 3
    }else{
    myweapon = 6
    }
    
myweaponlist = sMakeItemData(myweapon,-1)
ds_list_add(inventorylist,myweaponlist)


strength = 2
skill = 70
accuracy = 70
maxhp = 20
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
uprange = 2
team = 2//enemy team
unittype = 3//unit type, spooky robit
unitanimtype = 1//humanoid animation type
gender = irandom(1)//switch random
tlevel = 3//target level for the unit


/* */
/*  */
