mypalette = 0
headpalette = 0
hairpalette = 0

moverange = 6
uprange = 2
team = 4//environmental team
unitanimtype = 1//humanoid animation type
gender = irandom(1)//switch random
exploderange = 0//how far in each direction the explosion will reach
explodable = 0

attackrange = exploderange//how far our the weapon can attack
attackminrange = 0//the minimum range from the unit
attackuprange = uprange//the number of tiles up or down the weapon can attack, -1 for infinite
damagescaleswith = 0//the stat the damage of the weapon scales with
accuracyscaleswith = 0//the stat the accuracy scales with
accuracybonus = 0//the bonus to accuracy this weapon gives, plus or minus
attackanimtype = 0//if it uses the short-range or long-range animation
//ex- thowing something would use the same animation 0 as hitting with a short-range weapon

//the following are relevant to objects
name = "Yorick's Maw"
myheight = 0

attackstrength = 5//the how much damage the explosion will cause
damagetype = 0//kinetic, energy or eldritch
knockdist = 2//the distance units in the explosion will be knocked

maxhp = 1
hp = 1

unitisobject = 0
unitisitem = 1

itemisweapon = 1

itemisarmor = 0

objectiscrate = 0

facing = 0
rollingknock = 0//if the unit will continuously be knocked unless stopped, barrel
knockaxis = 0//if the unit can only be knocked along a specific axis. 0 is all, 1 is n-s, 2 is e-w
switch facing{
    case 0: knockaxis = 1; break;
    case 1: knockaxis = 2; break;
    case 2: knockaxis = 1; break;
    case 3: knockaxis = 2; break;
    }
if mycontrol = -1{
    mycontrol = oItemControl
    }
    
initialized = 1

