/// @description sGetWeaponStatusChance(weapon,status)
/// @param weapon
/// @param status
/*This script returns the base percent chance that the indicated weapon will inflict the indicated
status.*/

var vweapon,vstatus,stunchance,explodechance;

vweapon = argument0
vstatus = argument1

stunchance = 0
explodechance = 0

switch vweapon{
    case 0: stunchance = 0; explodechance = 0; break;//no weapons
    case 1: stunchance = 0; explodechance = 0; break;//crowbar
    case 2: stunchance = 0; explodechance = 0; break;//electrobar
    case 3: stunchance = 0; explodechance = 0; break;//cursedbar
    case 4: stunchance = 0; explodechance = 0; break;//nail gun
    case 5: stunchance = 0; explodechance = 0; break;//weld gun
    case 6: stunchance = 0; explodechance = 0; break;//cursed cutter
    case 7: ; break;//medkit item
    case 8: ; break;//grenade item
    case 9: stunchance = 0; explodechance = 0; break;//oscula weapon Big Mouth
    case 10: stunchance = 0; explodechance = 0; break;//volatile mix, Skullplode's weapon
    case 11: stunchance = 30; explodechance = 0; break;//spark charger, Hoverspark's weapon
    case 12: stunchance = 0;  explodechance = 0; break;//goat horns
    case 13: stunchance = 0;  explodechance = 0; break;//devil horns
    case 14: stunchance = 0;  explodechance = 0; break;//electro horns
    }
    
switch vstatus{
    case 0: return stunchance; break;
    case 1: return explodechance; break;
    }
