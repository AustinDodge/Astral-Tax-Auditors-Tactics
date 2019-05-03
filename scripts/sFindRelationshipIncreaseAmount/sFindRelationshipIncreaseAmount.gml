/// @description sFindRelationshipIncreaseAmount(vnum,unit1,unit2)
/// @param vnum
/// @param unit1
/// @param unit2
/*This script returns the amount to improve the relationship based on the two units
and their current relationship.
*/
var vstart,vunit1,vunit2,vamount,vmod;

vstart = argument0
vunit1 = argument1
vunit2 = argument2

vamount = 0
vmod = 0
if ds_list_find_value(vunit1.abilitieslist,38){//extrovert
    vmod = 1
    }
if ds_list_find_value(vunit1.abilitieslist,39){//introvert
    vmod = 2
    }
if ds_list_find_value(vunit2.abilitieslist,38){//extrovert
    vmod = 1
    }
if ds_list_find_value(vunit2.abilitieslist,39){//introvert
    vmod = 2
    }
switch vmod{
    case 0://no mod
        switch floor(vstart){
            case 0: vamount = 0.51; break;
            case 1: vamount = 0.35; break;
            case 2: vamount = 0.2; break;
            case 3: vamount = 0.1; break;
            }
        ; break;
    case 1://extrovert
        switch floor(vstart){
            case 0: vamount = 0.51; break;
            case 1: vamount = 0.5; break;
            case 2: vamount = 0.4; break;
            case 3: vamount = 0.1; break;
            }
        ; break;
    case 2://introvert
        switch floor(vstart){
            case 0: vamount = 0.51; break;
            case 1: vamount = 0.2; break;
            case 2: vamount = 0.1; break;
            case 3: vamount = 0.5; break;
            }
        ; break;
    }
    
if vstart >= 4{
    switch vmod{
        case 0: vamount = 0.02; break;
        case 1: vamount = 0.03; break;
        case 2: vamount = 0.015; break;
        }
    }
    
//vamount = 1.5
    
return vamount;
