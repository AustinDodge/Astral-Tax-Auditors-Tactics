/// @description sGetWeaponStatusTurns(weapon,status)
/// @param weapon
/// @param status
/*This script returns the number of turns that the indicated weapon will inflict the indicated
status.*/

var vweapon,vstatus,stunturns,explodeturns;

vweapon = argument0
vstatus = argument1

stunturns = 0
explodeturns = 0

switch vweapon{
    case 0: stunturns = 0; explodeturns = 0; break;//no weapons
    case 1: stunturns = 0; explodeturns = 0; break;//crowbar
    case 2: stunturns = 0; explodeturns = 0; break;//electrobar
    case 3: stunturns = 0; explodeturns = 0; break;//cursedbar
    case 4: stunturns = 0; explodeturns = 0; break;//nail gun
    case 5: stunturns = 0; explodeturns = 0; break;//weld gun
    case 6: stunturns = 0; explodeturns = 0; break;//cursed cutter
    case 7: ; break;//medkit item
    case 8: ; break;//grenade item
    case 9: stunturns = 0; explodeturns = 0; break;//oscula weapon Big Mouth
    case 10: stunturns = 0; explodeturns = 0; break;//volatile mix, Skullplode's weapon
    case 11: stunturns = 2; explodeturns = 0; break;//spark charger, Hoverspark's weapon
    case 12: stunturns = 0; explodeturns = 0; break;//goat horns
    case 13: stunturns = 0; explodeturns = 0; break;//devil horns
    case 14: stunturns = 0; explodeturns = 0; break;//electro horns
    }
    
switch vstatus{
    case 0: return stunturns; break;
    case 1: return explodeturns; break;
    }
