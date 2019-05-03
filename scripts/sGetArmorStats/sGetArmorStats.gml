/// @description sGetArmorStats(armornum)
/// @param armornum
/*this script calls the script that sets the stats of the armor. Does nothing yet!
*/
var wnum;
wnum = argument0

switch wnum{
    case 0: sNoWeaponStats(); break;
    case 1: sCrowbarStats(); break;
    case 2: sShockProdStats(); break;
    case 3: sCursebarStats(); break;
    case 4: sNailGunStats(); break;
    case 5: sWeldGunStats(); break;
    case 6: sCursedCutterStats(); break;
    case 7: ; break;//medkit item
    case 8: ; break;//grenade item
    case 9: sOsculaWeaponStats(); break;
    case 10: sVolatileMixStats(); break;
    case 11: sSparkChargerStats(); break;
    }

