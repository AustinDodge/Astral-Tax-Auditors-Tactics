/// @description sUnitAbilitiesCooldown()
/*This script is called by a unit to subtract one from the cooldown of all abilities
that have cooldowns. */



sUnitCooldownAbility(35)//35 sure footing
sUnitCooldownAbility(36)//36 nimble
sUnitCooldownAbility(37)//37 sprint

sUnitCooldownAbility(41)//41 leap
sUnitCooldownAbility(42)//42 first aid all

sUnitCooldownAbility(46)//46 diversion
sUnitCooldownAbility(47)//47 blend in
sUnitCooldownAbility(48)//48 charmer

sUnitCooldownAbility(53)//53 reflexes




/*********************************************************************************

Index for unit abilities

1 Climber 1, unit's vertical move range is increased by one ***IMPLEMENTED
2 Climber 2, unit's vertical move range is increased by two ***IMPLEMENTED
3 Climber 3, vertical move range is increased by three, vertical move cost is decreased by one ***IMPLEMENTED
4 Return Fire, unit can counter-attack with ranged weapons ***IMPLEMENTED
5 Kong, unit can pick up adjacent environmental objects and throw them in any direction.***IMPLEMENTED
6 Trick Shot, unit picks an empty tile in attack range. If any non-friendly unit or object enters that tile
     before the player's turn ends, make an attack that's guaranteed to hit for double damage.
    *********IMPLEMENTED***********
7 Rebound, If a unit is knocked into an adjacent tile, face that unit and knock it away.*****IMPLEMENTED********
8 Cliffhanger 1, Once per room, the unit will jump back up if it would be knocked into a pit.****IMPLEMENTED*******
9 Cliffhanger 2, Three times per room, the unit will jump back up if it would be knocked into a pit.****IMPLEMENTED*******
10 Cliffhanger 3, Five times per room, the unit will jump back up if it would be knocked into a pit.****IMPLEMENTED*******
11 Renaissance, when the unit gains abilities in the future, it will have three choices instead of two****IMPLEMENTED*******
12 Blessed, eldritch attacks will never get a HIT or DAM bonus against this unit, even if this unit is using
    a kinetic weapon.***********IMPLEMENTED*************
13 Tech Savvy, energy attacks will never get a HIT or DAM bonus against this unit, even if this unit has an
    eldritch weapon equipped.*************IMPLEMENTED***************
14 Solid State, kinetic attacks will never get a HIT or DAM bonus against this unit, even if this unit has a tech
    weapon equipped.********IMPLEMENTED*************
15 Parkour 1, vertical move costs are halved, rounding up.****IMPLEMENTED*********
16 Parkour 2, vertical move costs are halved, rounding down.**********IMPLEMENTED***********
17 Parkour 3, vertical move costs are always zero******IMPLEMENTED********
18 Shove, instead of attacking the unit can push another unit for no damage but a guaranteed knock. Does not work
    against certain very large units.********IMPLEMENTED*******
19 No Shoving, the shove ability does not apply to this unit.*********IMPLEMENTED********
20 High Ground, HIT and DAM elevation bonuses are doubled.*****IMPLEMENTED******
21 Specialist, HIT and DAM bonuses for weapon type are doubled. NOTE: This applies both to attacks the unit makes, and
    to attacks against this unit!*****IMPLEMENTED***********
22 Demolitions Expert, all explosive damage from this unit is doubled. Applies to environmental explosives that this
    unit directly detonated.******IMPLEMENTED********
23 Hard Knock, attacks by this unit knock one tile further.******IMPLEMENTED*******
24 Rage, if the unit's HP is less than 25 percent, unit's DAM is doubled.*******IMPLEMENTED*****
25 Inner Calm, if the unit did not perform an action except moving, gain HP at the end of the turn.*****IMPLEMENTED******
26 Healing Touch, the unit restores twice as much HP when using healing items.*******IMPLEMENTED********
27 Hard to Kill, once per room, if the unit's HP would be reduced to 0, keep a single HP.*****IMPLEMENTED******
28 Taste for Combat, if the unit kills an enemy, it may make another attack without moving. There is no limit to how many
    attacks it may make this way.
29 Sneaky, if the unit may move after attacking if it hasn't already moved.
30 Wait for Me, the unit can never be left behind in a room if it has a clear path to the tram when it leaves.
31 Bottom Dweller, Enemies get no HIT or DAM bonus for attacking this unit from a higher elevation. 
    Unit still receives regular elevation bonuses.*******IMPLEMENTED******
32 Backstabber, HIT and DAM bonuses are doubled and CRIT chance is doubled when this unit attacks from behind.****IMPLEMENTED****
33 Booster, if this unit is next to a wall, friendly units can climb it to reach high places - up to 3 verts higher
    than their usual vertical distance with no additional penalty///Friendly units gain 3 vertical distance with
    no additional penalty if this unit is on the tile at the bottom of the wall.
34 Lifter, friendly units gain 3 vertical distance with no additional penalty if this unit is on the tile at the
    top of the wall.
35 Sure Footing, the unit cannot be knocked this turn. Two turn cooldown.
36 Nimble, move through enemy units. Three turn cooldown.
37 Sprint, move twice as far for one turn. Three turn cooldown.
38 Extrovert, this unit's relationships improve more quickly, but bonuses are smaller. Removes Introvert.
39 Introvert, this unit's relationships improve more slowly, but bonuses are larger. Removes Extrovert.
40 Hurdler, this unit can move through obstacles that are equal to or shorter than its vertical move range.
41 Leap, unit's vertical move range is doubled and vertical penalties are halved (rounding down) this turn. Two turn cooldown.
42 First Aid, heal self or adjacent unit 10 HP without healing items. Two turn cooldown.
43 First Aid 2, heal 20 hp. Two turn
44 First Aid 3, First Aid heals fully, but the cooldown is increased to three turns.
45 Quick Study, if the unit would not learn an ability on level up, 30 percent chance to learn an ability.
46 Diversion, this unit gains a defensive bonus and enemy units are forced to target it this turn. One turn cooldown.
47 Blend In, enemy units will not target this unit this turn. Three turn cooldown.
48 Charmer, this turn all friendly units will act as though they have relationship level 3 with this unit. Three turn
    cooldown.
49 Tech Friend, Energy enemies will not target this unit unless there are no other units they can attack.
50 Eldritch Friend, Eldritch units will not target this unit unless there are no other units they can attack.
51 Kinetic Friend, Kinetic units will not target this unit unless there are no other units they can attack.
52 Deep Pockets, unit gains an attitional inventory slot
53 Reflexes, the next time this unit is attacked, that attack will miss. Does not apply to area-of-effect damage. Two turn cooldown
54 Adrenaline, if this unit kills another unit, the next attack against it will miss. DOes not apply to area-of-effect damage.
55 Deep Pockets 2, unit gains an additional inventory slot
56 Throwing Arm, unit can throw items twice as far*******IMPLEMENTED**********











































