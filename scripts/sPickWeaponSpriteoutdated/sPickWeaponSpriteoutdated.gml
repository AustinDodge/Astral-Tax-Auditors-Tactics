/// @description sPickWeaponSprite(myweapon)
/// @param myweapon
/*this script returns the sprite for the weapon number fed into it.
*/
var vwep,vsp;

vwep = argument0
vsp = 0

switch vwep{
    case 1: vsp = spcrowbar; break;
    case 2: vsp = spelectrobar; break;
    case 3: vsp = spcursedbar; break;
    case 4: vsp = spnailgun; break;
    case 5: vsp = spweldgun; break;
    case 6: vsp = spcursedcutter; break;
    }
    
return vsp
