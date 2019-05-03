/// @description sCrowbarStats()
/*this script sets the stats for the Crowbar weapon to the unit calling it.
*/
attackrange = 3//how far our the weapon can attack
attackminrange = 0//the minimum range from the unit
attackuprange = -1//the number of tiles up or down the weapon can attack, -1 for infinite
attackstrength = 5//the base strength of the weapon
damagescaleswith = 2//the stat the damage of the weapon scales with
accuracyscaleswith = 0//the stat the accuracy scales with
accuracybonus = 0//the bonus to accuracy this weapon gives, plus or minus
damagetype = 0//kinetic, energy or eldritch
attackanimtype = 1//if it uses the short-range or long-range animation
//ex- thowing something would use the same animation 0 as hitting with a short-range weapon
knockdist = 0//the distance this unit can knock another unit in an attack
cancounter = 0//if the unit can counter-attack with its current weapon

chainattacks = 0//if the weapon will chain attacks together, dealing damage to all units adjacent to the unit being attacked
//the value indicates how far the attacks will chain
weaponhealing = 0//if the unit's current weapon is healing or hurting.

weapontraveltime = 2//how many steps it takes the particls to travel one tile.

weaponstrikesound = soundCompressedAirBlast1
weaponwindupsound = soundCompressedAirCharge1
