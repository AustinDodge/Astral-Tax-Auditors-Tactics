/// @description sGetWeaponStats(weaponnum)
/// @param weaponnum
/*this script calls the script that sets the stats of the weapon. Called by the unit
equipping the weapon.
*/
var wnum;
wnum = argument0

switch wnum{
    case 0: sNoWeaponStats(); break;
    case 1: sCrowbarStats(); break;
    case 2: sShockProdStats(); break;
    case 3: sTentacleWeaponStats(); break;
    case 4: sNailGunStats(); break;
    case 5: sWeldGunStats(); break;
    case 6: sCursedCutterStats(); break;
    case 7: ; break;//medkit item
    case 8: ; break;//grenade item
    case 9: sOsculaWeaponStats(); break;
    case 10: sVolatileMixStats(); break;
    case 11: sSparkChargerStats(); break;
    case 12: sGoatHornStats(); break;
    case 13: sDevilGoatHornStats(); break;
    case 14: sElectroGoatHornStats(); break;
    case 15: sRotarySawStats(); break;
    case 16: sTwoByFourStats(); break;
    case 17: sFireAxeStats();   break;
    case 18: sLiveWiresStats(); break;
    case 19: sLaserSawStats(); break;
    case 20: sSmallRevolverStats(); break;
    case 21: sStunPistolStats(); break;
    case 22: sResinChunkStats(); break;
    case 23: sRitualKnifeStats(); break;
    case 24: sPlasmaRifleStats(); break;
    case 25: sYoricksMawStats(); break;
    case 26: sHealRayStats(); break;
    }
    
/***********************************************
modify stats to account for abilities
**********************************************/


//Return Fire, can always counter-attack even with ranged weapons
if object_is_ancestor(id,oUnitParent){
    if ds_list_find_value(abilitieslist,4) = 1{
        cancounter = 1
        }
    }

