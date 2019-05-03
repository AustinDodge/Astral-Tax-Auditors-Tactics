/// @description sGetItemObjectIndex(itemnum)
/// @param itemnum
/*this script returns the object index of the item type, so that the proper item can
be made.
*/
var wnum,vitem;
wnum = argument0

switch wnum{
    case 1: vitem = oCrowbarItem; break;
    case 2: vitem = oElectrobarItem; break;
    case 3: vitem = oCursedbarItem; break;
    case 4: vitem = oNailGunItem; break;
    case 5: vitem = oWeldGunItem; break;
    case 6: vitem = oCursedCutterItem; break;
    case 7: vitem = oMedKitItem; break;
    case 8: vitem = oGrenadeItem; break;
    }

return vitem;
