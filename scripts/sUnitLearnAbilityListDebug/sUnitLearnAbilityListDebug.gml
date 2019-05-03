/// @description sUnitLearnAbilityListDebug(vunit)
/// @param vunit
/*This script returns a list of abilities that the current unit is eligible to learn. Debug
version, limited to abilities that are implemented
*/

var vlist,vability,vunit,slist,i;

vunit = argument0
slist = vunit.abilitieslist
vlist = ds_list_create()

vability = -1//used to check conditionals for certain abilities

for (i = 1; i < 100; i += 1){
    vability = 0
    switch i{
        case 1: vability = 0; 
            if ds_list_find_value(slist,2) = 0 and ds_list_find_value(slist,3) = 0{
                vability = 1
                }
            ; break;//climber 1
        case 2: vability = 0;
            if ds_list_find_value(slist,1) = 1{
                vability = 1
                }
            ; break;//climber 2
        case 3: vability = 0
            if ds_list_find_value(slist,2) = 1{
                vability = 1
                }
            ; break;//climber 3
        case 4: vability = 1; break;//return fire
        case 5: vability = 1; break;//kong
        case 6: vability = 1; break;//trick shot
        case 7: vability = 1; break;//rebound
        case 8: vability = 1;
            if ds_list_find_value(slist,9) = 0 and ds_list_find_value(slist,10) = 0{
                //vability = 1
                vability = 0
                }
            ; break;//cliffhanger 1
        case 9: vability = 0
            if ds_list_find_value(slist,8) = 1{
                //vability = 1
                vability = 1
                }
            ; break;//climber 2//cliffhanger 2
        case 10:vability = 0
            if ds_list_find_value(slist,9) = 1{
                //vability = 1
                vability = 1
                }
            ; break;//cliffhanger 3
        case 11: vability = 1; break;//renaissance
        case 12: vability = 1; break;//blessed
        case 13: vability = 1; break;//tech savvy
        case 14: vability = 1; break;//solid state
        case 15: vability = 0;
            if ds_list_find_value(slist,16) = 0 and ds_list_find_value(slist,17) = 0{
                vability = 1
                }
            ; break;//parkour 1
        case 16: vability = 0
            if ds_list_find_value(slist,15) = 1{
                vability = 1
                }
            ; break;//parkour 2
        case 17: vability = 0
            if ds_list_find_value(slist,16) = 1{
                vability = 1
                }
            ; break;//parkour 3
        case 18: vability = 1; break;//shove
        case 19: vability = 0; break;//no shoving, useless for player units
        case 20: vability = 1; break;//High Ground
        case 21: vability = 1; break;//specialist
        case 22: vability = 1; break;//demolitions expert
        case 23: vability = 1; break;//hard knock
        case 24: vability = 1; break;//rage
        case 25: vability = 1; break;//inner calm
        case 26: vability = 1; break;//healing touch
        case 27: vability = 1; break;//hard to kill
        case 28: vability = 1; break;//taste for combat
        case 29: vability = 1; break;//sneaky
        case 30: vability = 1; break;//wait for me
        case 31: vability = 1; break;//bottom dweller
        case 32: vability = 1; break;//backstabber
        case 33: vability = 1; break;//booster
        case 34: vability = 1; break;//lifter
        case 35: vability = 1; break;//sure footing
        case 36: vability = 1; break;//nimble
        case 37: vability = 1; break;//sprint
        case 38: vability = 1; break;//extrovert
        case 39: vability = 1; break;//introvert
        case 40: vability = 1; break;//hurdler
        case 41: vability = 1; break;//leap
        case 42: vability = 0
            if ds_list_find_value(slist,43) = 0 and ds_list_find_value(slist,44) = 0{
                vability = 1
                }; break;//first aid
        case 43: vability = 0
            if ds_list_find_value(slist,42) = 1{
                vability = 1
                }; break;//first aid 2
        case 44: vability = 0
            if ds_list_find_value(slist,43) = 1{
                vability = 1
                }; break;//first aid 3
        case 45: vability = 0; break;//quick study
        case 46: vability = 1; break;//diversion
        case 47: vability = 1; break;//blend in
        case 48: vability = 1; break;//charmer
        case 49: vability = 0; break;//tech friend
        case 50: vability = 0; break;//eldritch friend
        case 51: vability = 0; break;//kinetic friend
        case 52: vability = 0
            if ds_list_find_value(slist,55) = 0{//if the unit doesn't already have Deep Pockets 2
                vability = 1
                }
            ; break;//deep pockets
        case 53: vability = 1; break;//reflexes
        case 54: vability = 1; break;//adrenaline
        case 55: vability = 0; 
            if ds_list_find_value(slist,52) = 1{//if the unit already has Deep Pockets 1
                vability = 1
                }
            ;break;//deep pockets 2
        case 56: vability = 1; break;//throwing arm
        case 57: vability = 0; break;
        case 58: vability = 0; break;
        case 59: vability = 0; break;
        case 60: vability = 0; break;
        case 61: vability = 0; break;
        }
    if vability = 1{
        if ds_list_find_value(slist,i) = 0{
            ds_list_add(vlist,i)
            }
        }
    }
    
return vlist;
