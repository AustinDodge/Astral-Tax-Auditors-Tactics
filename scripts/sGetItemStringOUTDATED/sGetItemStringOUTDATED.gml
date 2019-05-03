/// @description sGetItemScript(weaponnum)
/// @param weaponnum
/*this script returns the name of an item in a string
*/
var wnum,vstring;
wnum = argument0

switch wnum{
    case 1: vstring = "Crowbar"; break;
    case 2: vstring = "ElectroBar"; break;
    case 3: vstring = "CursedBar"; break;
    case 4: vstring = "Nail Gun"; break;
    case 5: vstring = "Weld Gun"; break;
    case 6: vstring = "Cursed Cutter"; break;
    case 7: vstring = "Medkit"; break;
    case 8: vstring = "Grenade"; break;
    case 9: vstring = "Big Mouth"; break;
    }

return vstring;
