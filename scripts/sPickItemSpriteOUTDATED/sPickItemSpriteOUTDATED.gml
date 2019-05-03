/// @description sPickItemSprite(myitem)
/// @param myitem
/*this script returns the sprite for the item number fed into it.
*/
var vitem,vsp;

vitem = argument0
vsp = 0

switch vitem{
    case 1: vsp = spcrowbar; break;//crowbar
    case 2: vsp = spelectrobar; break;//electrobar
    case 3: vsp = spcursedbar; break;//cursedbar
    case 4: vsp = spnailgun; break;//nailgun
    case 5: vsp = spweldgun; break;//weldgun
    case 6: vsp = spcursedcutter; break;//cursedcutter
    case 7: vsp = spmedkit; break;//modkit
    case 8: vsp = spgrenade; break;//grenade
    case 9: vsp = spbigmouth; break;//oscula mouth, no sprite
    }
    
return vsp
