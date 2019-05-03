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

name = "Maint Robit"
mypalette = 0
headpalette = 0
hairpalette = 0

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

if irandom(1) = 0{//randomly select between close and long range
    myweapon = 1
    }else{
    myweapon = 4
    }

myweaponlist = sMakeItemData(myweapon,-1)
//ds_list_add(inventorylist,myweaponlist)

moverange = 6
movepoints = moverange
visionrange = 7
uprange = 2
team = 2//enemy team
unittype = 1//unit type, kinetic robit
unitanimtype = 1//humanoid animation type
gender = irandom(1)//switch random
mydebris = 0//kinetic robot debris

tlevel = 3//target level for the unit


/* */
/*  */
