image_speed = 0
facing = 0
anim = 1//what sort of animation the unit should do
/*
0 is still
1 is idle/walk
2 is short attack
3 is long attack
4 is recoil
5 is item throw
6 is item use
*/
mx = 0
my = 0
mytile = 0
nexttile = 0
moverange = 7
movepoints = moverange
pmovepoints = movepoints//the number of movement points the unit will have when
//cancelling the current move. Used if the unit does something that wouldn't allow them
// to cancel the whole move, like moving up an elevator.
visionrange = 7//how many tiles the unit can see, for fog of war and AI activation.
uprange = 2//how far "up" a unit can move
downrange = 3//how far "down" a unit can move without taking damage
animstep = 0

prevanim = 0//the animation step the unit was previously on

shadowsprite = spsmallshadow

team = -1
unitanimtype = 0
unitmovesound = -1//the sound type the unit moves with. 

myheight = 3//the "height" of the unit, in tile elevation
elevation = 0

aiactivated = 1//if an AI unit has been "activated", if it will react to player units

cancancelmove = 1//if the unit can cancel the move - when FOW is implemented, units will be unable to cancel moves that illuminate the fog

myattributelist = -1//used only by auditors and set while placing the unit
myattributelistpos = -1//used only be auditors, the position of the attributelist in global variable playerunitlist
gender = 0//only used by auditors, 0 is female, 1 is male
name = "blankey"//changed in init, the name of the unit that appears in the interface
isauditor = 0//if the unit is an Auditor, or on the player team


moved = 0//if the unit moved to a different tile this turn - largely deprecated after introducing pmovepoints
didaction = 0//if the unit took an action besides moving this turn
attacked = 0//if the unit made an attack this turn
unittype = 0//type of unit, 0 for auditor
turnover = 0//if this unit cannot take any more actions this turn
movestack = 0//the data structure that holds all the tiles the unit will move through
maxhp = 1//the maximum HP the unit can have
hp = maxhp//the actual HP of the unit
level = 1//the units level

myweapon = -1//the units weapon number, for quick calling
myweaponlist = -1//the list that represents the weapon item
myarmor = -1//the units armor number, for quick calling
myarmorlist = -1//the list that represents the weapon item
inventoryslots = 2//how many items the unit can carry in its inventory
inventorylist = ds_list_create()
/*if irandom(1) = 1{
    ds_list_add(inventorylist,7)//randomly add a medkit
    }else{
    ds_list_add(inventorylist,8)//add a grenade
    }*/


amidead = 0//if the unit is dead
amirevived = 0//if a KO unit is being revived, it shouldn't turn into a corpse on destruction
amikod = 0//if a unit is currently KOd
koturns = -1//how many turns until the KOd unit is killed


//during a move. It's created when a move tile is clicked on and is destroyed when a
//unit finished moving to its destination.
prevtile = 0//the tile a unit was on before it started moving. Reset to its current tile
prevface = 0//the direction a unit was facing before it moved.
//at the start of a turn. Used for cancelling a move.
initialized = 0//if the unit has performed its init event yet. Units made from a list
//usually have.

knockdist = 2//the number of tiles this unit can knock another unit in an attack


moving = 0//if the unit is currently moving to another tile
walking = 0//if the unit is walking to another tile
falling = 0//if the unit is falling to another tile

fallingpit = 0//if the unit is falling into a pit
fadingoutblack = 0//if the unit sprite is fading to black
fadinginblack = 0//if the unit sprite is fading in to black

climbing = 0//if the unit is climbing to another tile
amknocked = 0//if the unit is currently being knocked to another tile

amdistracting = 0//if the unit using the distraction animation

cancounter = 0//if the unit can counter-attack with its current weapon

waswalking = 0//if the unit was walking before its most recent movement
wasknocked = 0//if the unit was knocked before the movement

willfall = 0//if the unit will fall when it completes its move to the next tile
willfallpit = 0//if the unit will fall into a pit

walkstep = 0//the step of the current tile movement animation

knockforce = 0//the number of tiles the unit has left to be knocked through
knockstep = 0//the number of frames into the "knock" animation the unit is
knockdamage = 0//the amount of damage that the unit has taken in the course of being knocked
knockdir = 0//the direction the unit is being knocked in
bouncing = 0//if the unit is currently "bouncing"
lasttile = 0//the last tile the unit was in while moving

vertdist = 0//how far up or down the unit needs to climb or fall

shuddering = 0//if the unit is animating shuddering
jumping = 0//if the unit is animating jumping
shuddercount = 0//how many shudders the unit should do
shudderstep = 0//the current step of the shudder animation

thrown = 0//if it's an item, it can be thrown. This variable says if it's being thrown or not.

bx = x//the units original x and y coordinates, to be returned to if the unit animates outside of those
by = y

unitisobject = 0
unitisitem = 0
itemdestination = -1//if the unit is an item, what "slot" it will go into in the target unit(inventory, weapon or armor)
itemisweapon = 0
itemisarmor = 0
startunit = 0//if the unit is an object, startunit is the unit that used it

objectiscrate = 0
knockable = 1//if the unit can be knocked
explodable = 0//if the unit can be exploded
rollingknock = 0//if the unit will continuously be knocked unless stopped, barrel
knockaxis = 0//if the unit can only be knocked along a specific axis. 0 is all, 1 is n-s, 2 is e-w

//init attack values to zero for items and objects
attackrange = 0//how far our the weapon can attack
attackminrange = 0//the minimum range from the unit
attackuprange = 0//the number of tiles up or down the weapon can attack, -1 for infinite
attackstrength = 0//the base strength of the weapon
damagescaleswith = 0//the stat the damage of the weapon scales with
accuracyscaleswith = 0//the stat the accuracy scales with
accuracybonus = 0//the bonus to accuracy this weapon gives, plus or minus
damagetype = 0//kinetic, energy or eldritch
attackanimtype = 0//if it uses the short-range or long-range animation
//ex- thowing something would use the same animation 0 as hitting with a short-range weapon
knockdist = 0//the distance this unit can knock another unit in an attack
cancounter = 0//if the unit can counter-attack with its current weapon

weaponhealing = 0//if the unit's current weapon is healing or hurting.

weaponstrikesound = -1//the sound the weapon will make on attack
weaponwindupsound = -1

weapontraveltime = 0//how long the projectile, if any, takes to travel across a single tile.


skill = 0
intelligence = 0

level = 1
xp = 0//the amount of XP the unit currently has
nextxp = 100//the amount of XP the unit needs to level up
xpgain = 0//the amount of XP the unit will gain at the end of whatever action is happening

strengthchance = 50
skillchance = 70
accuracychance = 40
maxhpchance = 60
defensechance = 50
mspeedchance = 50
fallfadestage = 0
fallfadelimit = 0//how far a unit will fall before it starts to fade to black
myinfluencemap = -1//created, if necessary, in sMapActivateAIUnits

mylightsource = -1//the lightsource object following the object

mycontrol = -1//if the unit/item has a specific control object to react to
mydata = -1//if the unit is an item, this is the data associated with the item.

relationshipmap = ds_map_create()
canmakefriends = 0
relationshipdist = 1//how many tiles away a unit is to make friends


abilitieslist = sUnitMakeAbilitiesListInit()
abilitiesusedlist = sUnitMakeAbilitiesListInit()
abilitiescooldownlist = sUnitMakeAbilitiesListInit()

climbedonlist = ds_list_create()//a list of units that the unit climbed over this turn

myscar = irandom(2)//the scar that the unit will leave behind on a tile when destroyed
mydebris = -1//the type of debris that the unit will create when destroyed - -1 for none.


//STATUS EFFECTS

statusdraw = 0//the status that's currently being drawn
mystatus = 0//the instance id of the status icon
hasstatus = 0//if the unit is suffering from any status effects


kostatus = 0
explodestatus = 0
showexplodestatus = 0
stunnedstatus = 0
showstunnedstatus = 0


/* */
/*  */
