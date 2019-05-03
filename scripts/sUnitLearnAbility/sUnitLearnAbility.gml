/// @description sUnitLearnAbility(vunit,abilitynum)
/// @param vunit
/// @param abilitynum
/*Gives a unit a new ability. Mostly it just involves setting the ability to 1, but sometimes
there are additional things that need to happen.
*/


var vability,vunit;

vunit = argument0
vability = argument1

ds_list_replace(vunit.abilitieslist,vability,1)//give the unit the ability

switch vability{
    case 1: vunit.uprange += 1; break;//climber 1
    case 2: vunit.uprange += 1; ds_list_replace(vunit.abilitieslist,1,0); break;//climber 2
    case 3: vunit.uprange += 1; ds_list_replace(vunit.abilitieslist,2,0); break;//climber 3
    case 4: ; break;//return fire
    case 5: ; break;//kong
    case 6: ; break;// trick shot
    case 7: ; break;//rebound
    case 8: ; break;//cliffhanger 1
    case 9: ds_list_replace(vunit.abilitieslist,8,0); break;//cliffhanger 2
    case 10: ds_list_replace(vunit.abilitieslist,9,0); break;//cliffhanger 3
    case 42: ; break;//first aid 1
    case 43: ds_list_replace(vunit.abilitieslist,42,0); break;//first aid 2, remove first aid 1
    case 44: ds_list_replace(vunit.abilitieslist,43,0); break;//first aid 3, remove first aid 2
    case 52: vunit.inventoryslots += 1; break;//deep pockets 1
    case 55: ds_list_replace(vunit.abilitieslist,52,0); vunit.inventoryslots += 1; break;//deep pockets 2
    }
