/// @description sAuditorFindHairSprite(unit)
/// @param unit
/*this script returns the index for the specified auditor's hair sprite.
*/
var vunit,vhair,v;

vunit = argument0
if vunit.gender = 0{//female
    switch vunit.hairtype{
        case 0: vhair = femaleauditorhair1; break;
        case 1: vhair = femaleauditorhair2; drawear = 0; break;
        case 2: vhair = femaleauditorhair3; drawear = 0; break;
        case 3: vhair = femaleauditorhair4; break;
		case 4: vhair = femaleauditorhair5; break;
        }
    }else{//male
    switch vunit.hairtype{
        case 0: vhair = maleauditorhair1; break;
        case 1: vhair = maleauditorhair2; break;
        case 2: vhair = maleauditorhair3; break;
        case 3: vhair = maleauditorhair4; break;
		case 4: vhair = maleauditorhair5; break;
        }
    }
return vhair;
