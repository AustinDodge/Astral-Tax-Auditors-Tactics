/// @description sAbilityFindIcon(abilitynum)
/// @param abilitynum
/*Returns the ability icon for the specified ability number. Gives the question mark icon
if it can't find the right one.
*/

var vnum,vspr;

vnum = argument0
vspr = spabilityicondefault

switch vnum{
    case 1: vspr = spabilityiconclimbing; break;//1 climber 1
    case 2: vspr = spabilityiconclimbing; break;//2 climber2
    case 3: vspr = spabilityiconclimbing; break;//3 climber3
    case 4: vspr = spabilityiconreturnfire; break;//4 return fire
    case 5: vspr = spabilityiconkong; break;//5 kong
    case 6: vspr = spabilityicontrickshot; break;//6 trick shot
    case 7: vspr = spabilityiconrebound; break;//7 rebound
    case 8: vspr = spabilityiconcliffhanger; break;//8 cliffhanger
    case 9: vspr = spabilityiconcliffhanger; break;//9 cliffhanger 2
    case 10: vspr = spabilityiconcliffhanger; break;//10 cliffhanger 3
    case 11: vspr = spabilityiconrenaissance; break;//11 renaissance
    case 12: vspr = spabilityiconblessed; break;//12 blessed
    case 13: vspr = spabilityicontechsavvy; break;//13 tech savvy
    case 14: vspr = spabilityiconsolidstate; break;//14 solid state
    case 15: vspr = spabilityiconparkour; break;//15 parkour 1
    case 16: vspr = spabilityiconparkour; break;//16 parkour 2
    case 17: vspr = spabilityiconparkour; break;//17 parkour 3
    case 18: vspr = spabilityiconshove; break;//18 shove
    case 19: vspr = spabilityiconnoshoving; break;//19 no shoving
    case 20: vspr = spabilityiconhighground; break;//20 high ground
    case 21: vspr = spabilityiconspecialist; break;//21 specialist
    case 22: vspr = spabilityicondemolitionsexpert; break;//22 demolitions expert
    case 23: vspr = spabilityiconhardknock; break;//23 hard knock
    case 24: vspr = spabilityiconrage; break;//24 rage
    case 25: vspr = spabilityiconinnercalm; break;//25 inner calm
    case 26: vspr = spabilityiconhealingtouch; break;//26 healing touch
    case 27: vspr = spabilityiconhardtokill; break;//27 hard to kill
    case 28: vspr = spabilityicontasteforcombat; break;//28 taste for combat
    case 29: vspr = spabilityiconsneaky; break;//29 sneaky
    case 30: vspr = spabilityiconwaitforme; break;//30 wait for me
    case 31: vspr = spabilityiconbottomdweller; break;//31 bottom dwelled
    case 32: vspr = spabilityiconbackstabber; break;//32 backstabber
    case 33: vspr = spabilityiconbooster; break;//33 booster
    case 34: vspr = spabilityiconlifter; break;//34 lifter
    case 35: vspr = spabilityiconsurefooting; break;//35 sure footing
    case 36: vspr = spabilityiconnimble; break;//36 nimble
    case 37: vspr = spabilityiconsprint; break;//37 sprint
    case 38: vspr = spabilityiconextrovert; break;//38 extrovert
    case 39: vspr = spabilityiconintrovert; break;//39 introvert
    case 40: vspr = spabilityiconhurdler; break;//40 hurdler
    case 41: vspr = spabilityiconleap; break;//41 leap
    case 42: vspr = spabilityiconfirstaid; break;//42 first aid
    case 43: vspr = spabilityiconfirstaid; break;//43 first aid 2
    case 44: vspr = spabilityiconfirstaid; break;//44 first aid 3
    case 45: vspr = spabilityiconquickstudy; break;//45 quick study
    case 46: vspr = spabilityicondiversion; break;//46 diversion
    case 47: vspr = spabilityiconblendin; break;//47 blend in
    case 48: vspr = spabilityiconcharmer; break;//48 charmer
    case 49: ; break;//49 tech friend
    case 50: ; break;//50 eldritch friend
    case 51: ; break;//51 kinetic friend
    case 52: vspr = spabilityicondeeppockets; break;//52 deep pockets
    case 53: vspr = spabilityiconreflexes; break;//53 reflexes
    case 54: vspr = spabilityiconadrenaline; break;//54 adrenaline
    case 55: vspr = spabilityicondeeppockets; break;//55 deep pockets 2
    case 56: vspr = spabilityiconthrowingarm; break;//56 throwing arm
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
    
return vspr;
