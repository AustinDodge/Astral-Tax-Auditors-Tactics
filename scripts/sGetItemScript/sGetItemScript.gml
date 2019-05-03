/// @function sGetItemScript(weaponnum)
/// @description sGetItemScript(weaponnum)
/// @param weaponnum
/*this script calls the script that the item runs on use
*/
var wnum;
wnum = argument0

switch wnum{
    case 7: sMedKitScript(); break;
    case 8: sGrenadeScript(); break;
    }

