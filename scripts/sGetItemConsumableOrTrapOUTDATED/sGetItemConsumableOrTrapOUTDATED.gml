/// @description sGetItemConsumableOrTrap(itemnum)
/// @param itemnum
/*this script returns if the item is a consumable or a trap, which determines what
the buttons for the item do. Consumables are used on units, traps are used on tiles.
Returns 0 for consumable and 1 for trap, 2 for weapon and 3 for armor.
*/
var vnum, vistrap;
vnum = argument0

vistrap = 1

switch vnum{
    case 1: vistrap = 2; break;//crowbar
    case 2: vistrap = 2; break;//crowbar
    case 3: vistrap = 2; break;//crowbar
    case 4: vistrap = 2; break;//crowbar
    case 5: vistrap = 2; break;//crowbar
    case 6: vistrap = 2; break;//crowbar
    case 7: vistrap = 0; break;//medkit
    case 8: vistrap = 1; break;//grenade
    case 9: vistrap = 2; break;//big mouth
    }
    
return vistrap;
