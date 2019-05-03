//facing = 3
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
mypalette = 0
headpalette = 0
hairpalette = 0

moverange = 6
movepoints = moverange
uprange = 2
team = 4//environmental team
unitanimtype = 1//humanoid animation type
gender = irandom(1)//switch random
exploderange = 0//how far in each direction the explosion will reach
explodable = 0

attackrange = 0//how far our the weapon can attack
attackminrange = 0//the minimum range from the unit
attackuprange = 0//the number of tiles up or down the weapon can attack, -1 for infinite
damagescaleswith = 0//the stat the damage of the weapon scales with
accuracyscaleswith = 0//the stat the accuracy scales with
accuracybonus = 0//the bonus to accuracy this weapon gives, plus or minus
attackanimtype = 0//if it uses the short-range or long-range animation
//ex- thowing something would use the same animation 0 as hitting with a short-range weapon

//the following are relevant to objects
name = "Crate"

attackstrength = 0//the how much damage the explosion will cause
damagetype = 0//kinetic, energy or eldritch
knockdist = 0//the distance units in the explosion will be knocked

maxhp = 5
hp = 5

myheight = 2

unitisobject = 1
objectiscrate = 1
facing = 2//always face the direction of the sprite
rollingknock = 0//if the unit will continuously be knocked unless stopped, barrel
knockaxis = 0//if the unit can only be knocked along a specific axis. 0 is all, 1 is n-s, 2 is e-w

iteminside = sRedChestPickItem()
itemsprite = sGetItemInfo(iteminside,2)
itemstring = sGetItemInfo(iteminside,1)

lidheight = 0
lidalpha = 1
myalpha = 1
open = 0
opening = 0
disappearing = 0

    
initialized = 1

/* */
/*  */
