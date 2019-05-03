/// @description sAbilityFindNameString(abilitynum)
/// @param abilitynum
/*Returns the name string for the specified ability.
*/

var vnum,vstr;

vnum = argument0
vstr = "?"

switch vnum{
    case 1: vstr = "Climber 1"; break;//1 climber 1
    case 2: vstr = "Climber 2"; break;//2 climber2
    case 3: vstr = "Climber 3"; break;//3 climber3
    case 4: vstr = "Return Fire"; break;//4 return fire
    case 5: vstr = "Kong"; break;//5 kong
    case 6: vstr = "Trick Shot"; break;//6 trick shot
    case 7: vstr = "Rebound"; break;//7 rebound
    case 8: vstr = "Cliffhanger"; break;//8 cliffhanger
    case 9: vstr = "Cliffhanger 2"; break;//9 cliffhanger 2
    case 10: vstr = "Cliffhanger 3"; break;//10 cliffhanger 3
    case 11: vstr = "Renaissance"; break;//11 renaissance
    case 12: vstr = "Blessed"; break;//12 blessed
    case 13: vstr = "Tech Savvy"; break;//13 tech savvy
    case 14: vstr = "Solid State"; break;//14 solid state
    case 15: vstr = "Parkour 1"; break;//15 parkour 1
    case 16: vstr = "Parkour 2"; break;//16 parkour 2
    case 17: vstr = "Parkour 3"; break;//17 parkour 3
    case 18: vstr = "Shove"; break;//18 shove
    case 19: vstr = "No Shoving"; break;//19 no shoving
    case 20: vstr = "High Ground"; break;//20 high ground
    case 21: vstr = "Specialist"; break;//21 specialist
    case 22: vstr = "Demolitions Expert"; break;//22 demolitions expert
    case 23: vstr = "Hard Knock"; break;//23 hard knock
    case 24: vstr = "Rage"; break;//24 rage
    case 25: vstr = "Inner Calm"; break;//25 inner calm
    case 26: vstr = "Healing Touch"; break;//26 healing touch
    case 27: vstr = "Hard to Kill"; break;//27 hard to kill
    case 28: vstr = "Taste for Combat"; break;//28 bloodlust
    case 29: vstr = "Sneaky"; break;//29 sneaky
    case 30: vstr = "Wait for Me"; break;//30 wait for me
    case 31: vstr = "Bottom Dweller"; break;//31 bottom dweller
    case 32: vstr = "Backstabber"; break;//32 backstabber
    case 33: vstr = "Booster"; break;//33 booster
    case 34: vstr = "Lifter"; break;//34 lifter
    case 35: vstr = "Sure Footing"; break;//35 sure footing
    case 36: vstr = "Nimble"; break;//36 nimble
    case 37: vstr = "Sprint"; break;//37 sprint
    case 38: vstr = "Extrovert"; break;//38 extrovert
    case 39: vstr = "Introvert"; break;//39 introvert
    case 40: vstr = "Hurdler"; break;//40 hurdler
    case 41: vstr = "Leap"; break;//41 leap
    case 42: vstr = "First Aid 1" ; break;//42 first aid
    case 43: vstr = "First Aid 2"; break;//43 first aid 2
    case 44: vstr = "First Aid 3"; break;//44 first aid 3
    case 45: vstr = "Quick Study"; break;//45 quick study
    case 46: vstr = "Diversion"; break;//46 diversion
    case 47: vstr = "Blend In"; break;//47 blend in
    case 48: vstr = "Charmer"; break;//48 charmer
    case 49: vstr = "Tech Friend"; break;//49 tech friend
    case 50: vstr = "Eldritch Friend"; break;//50 eldritch friend
    case 51: vstr = "Kinetic Friend"; break;//51 kinetic friend
    case 52: vstr = "Deep Pockets 1"; break;//52 deep pockets
    case 53: vstr = "Reflexes"; break;//53 Reflexes
    case 54: vstr = "Adrenaline"; break;//54 Adrenaline
    case 55: vstr = "Deep Pockets 2"; break;//55 deep pockets 2
    case 56: vstr = "Throwing Arm"; break;//56 Throwing arm
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
