/// @description sAbilityFindTooltip(abilitynum)
/// @param abilitynum
/*Returns the tooltip string for the specified ability.
*/

var vnum,vstr;

vnum = argument0
vstr = "?"

switch vnum{
    case 1: vstr = "Vertical move range is increased to four"; break;//1 climber 1
    case 2: vstr = "Vertical move range is increased to five"; break;//2 climber2
    case 3: vstr = "Vertical move range is increased to six, and the cost of vertical movement is decreased by one"; break;//3 climber3
    case 4: vstr = "Can counter-attack with ranged weapons"; break;//4 return fire
    case 5: vstr = "Pick up and throw barrels and other objects. Explosive objects will explode on stopping"; break;//5 kong
    case 6: vstr = "Select an unoccupied tile. If an enemy unit is knocked into that tile before the enemy phase starts, make an attack that's guaranteed to hit for double damage."; break;//6 trick shot
    case 7: vstr = "If a unit or object is knocked past this this unit, turn to face it and knock it in that direction. Rolling items will start rolling in that direction"; break;//7 rebound
    case 8: vstr = "Once per room, if this unit would be knocked into a pit, jump back onto the last tile it was on"; break;//8 cliffhanger
    case 9: vstr = "Three times per room, if this unit would be knocked into a pit, jump back onto the last tile it was on"; break;//9 cliffhanger 2
    case 10: vstr = "Five times per room, if this unit would be knocked into a pit, jump back onto the last tile it was on"; break;//10 cliffhanger 3
    case 11: vstr = "Get one additional choice when learning new abilities"; break;//11 renaissance
    case 12: vstr = "Eldritch attacks will never get a HIT or DAM bonus against this unit, even if it is equipped with a Kinetic weapon"; break;//12 blessed
    case 13: vstr = "Energy weapons will never get a HIT or DAM bonus against this unit, even if it is equipped with an Eldritch weapon"; break;//13 tech savvy
    case 14: vstr = "Kinetic weapons will never get a HIT or DAM bonus against this unit, even if it is equipped with an Energy weapon"; break;//14 solid state
    case 15: vstr = "Vertical move costs are halved, rounding up"; break;//15 parkour 1
    case 16: vstr = "Vertical move costs are halved, rounding down"; break;//16 parkour 2
    case 17: vstr = "Vertical movement costs nothing"; break;//17 parkour 3
    case 18: vstr = "A special attack that doesn't require a weapon. Does no damage, but is guaranteed to knock unless the unit being attacked has the ability 'No Shoving'"; break;//18 shove
    case 19: vstr = "This unit cannot be shoved"; break;//19 no shoving
    case 20: vstr = "HIT and DAM bonuses when attacking from a higher elevation are doubled"; break;//20 high ground
    case 21: vstr = "HIT and DAM weapon type bonuses are doubled for this unit, both when it attacks and when it is attacked. Big damage, but be careful!"; break;//21 specialist
    case 22: vstr = "Damage this unit deals from explosives are doubled, including when this unit directly detonates environmental explosives"; break;//22 demolitions expert
    case 23: vstr = "This unit knocks farther when attacking"; break;//23 hard knock
    case 24: vstr = "If this unit's health is less than 25 percent, get a bonus to HIT, DAM and CRIT."; break;//24 rage
    case 25: vstr = "Unit will heal 8 HP at the end of every turn if it didn't do anything except a standard move"; break;//25 inner calm
    case 26: vstr = "Restore twice as much HP when healing self or others"; break;//26 healing touch
    case 27: vstr = "Once per room, if this unit would be killed or KOd, HP returns to 1 and unit stays alive. Doesn't work against pits."; break;//27 hard to kill
    case 28: vstr = "If this unit makes a kill this turn, it may take another non-movement action"; break;//28 bloodlust
    case 29: vstr = "Unit may move after attacking if it still has move points remaining"; break;//29 sneaky
    case 30: vstr = "This unit will never be left behind in a room as long as it has a clear path to the exit"; break;//30 wait for me
    case 31: vstr = "Enemies get no HIT or DAM bonus for attacking this unit from a higher elevation"; break;//31 bottom dweller
    case 32: vstr = "HIT and DAM bonuses are doubled when this unit attacks from behind"; break;//32 backstabber
    case 33: vstr = "Other units can climb this unit to reach a higher elevation. Move this unit next to a wall, and other units get +3 uprange with no additional penalty when moving through its tile"; break;//33 booster
    case 34: vstr = "Lifts other units when at a higher elevation. Move this unit atop a wall, and other units get +3 uprange with no additional penalty when moving through the tile beneath it."; break;//34 lifter
    case 35: vstr = "When activated, this unit cannot be knocked for one turn. 3 turn cooldown"; break;//35 sure footing
    case 36: vstr = "When activated, unit can move through non-friendly units for one turn. 3 turn cooldown"; break;//36 nimble
    case 37: vstr = "When activated, unit can move twice as far for one turn. 3 turn cooldown"; break;//37 sprint
    case 38: vstr = "This unit's relationships increase more quickly, but the bonuses gained from friendship are smaller"; break;//38 extrovert
    case 39: vstr = "This unit's relationships increase more slowly, but the bonuses gained from friendship are greater"; break;//39 introvert
    case 40: vstr = "This unit can always move through environmental obstacles - desks, bushes, etc - that are shorter than the unit's vertical move range"; break;//40 hurdler
    case 41: vstr = "On activation, vertical move range is doubled and move costs are halved for one turn. Two turn cooldown"; break;//41 leap
    case 42: vstr = "Unit heals itself or an adjacent unit for 10 HP. Two turn cooldown" ; break;//42 first aid
    case 43: vstr = "Unit heals itself or an adjacent unit for 20 HP. Two turn cooldown"; break;//43 first aid 2
    case 44: vstr = "Unit completely heals itself or an adjacent unit. Three turn cooldown"; break;//44 first aid 3
    case 45: vstr = "If this unit wouldn't learn a new ability when leveling up, 60 percent chance to learn a new ability"; break;//45 quick study
    case 46: vstr = "When activated, unit gains a defensive bonus and on the next enemy phase, all enemy units will target this unit if they can. Ends turn, 2 turn cooldown"; break;//46 diversion
    case 47: vstr = "When activated, enemy units will not attack this unit on the next enemy phase. Ends turn, 3 turn cooldown"; break;//47 blend in
    case 48: vstr = "When activated, all friendly units will act as though they have a level 3 friendship with this unit unitl the next player phase. 3 turn cooldown"; break;//48 charmer
    case 49: vstr = "Energy units will never attack this unit if they can attack another unit"; break;//49 tech friend
    case 50: vstr = "Eldritch units will never attack this unit if they can attack another unit"; break;//50 eldritch friend
    case 51: vstr = "Kinetic units will never attack this unit if they can attack another unit"; break;//51 kinetic friend
    case 52: vstr = "Unit inventory slots are increased to three"; break;//52 deep pockets
    case 53: vstr = "When activated, the next time this unit is attacked, that attack will miss. Two turn cooldown"; break;//53 Reflexes
    case 54: vstr = "If this unit kills another unit, the next attack against it will miss"; break;//54 Adrenaline
    case 55: vstr = "Unit inventory slots are increased to four"; break;//55 deep pockets 2
    case 56: vstr = "Unit can throw items twice as far when using, giving, or discarding"; break;//56 Throwing arm
    case 57: ; break;//57
    case 58: ; break;//58
    case 59: ; break;//59
    case 60: ; break;//60
    case 61: ; break;//61
    case 62: ; break;//62
    case 63: ; break;//63
    case 64: ; break;//64
    case 65: ; break;//65
    case 66: ; break;//66
    case 67: ; break;//67
    }
    
return vstr;
