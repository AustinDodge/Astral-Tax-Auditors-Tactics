/// @description sUnitLearnAbilityList(vunit)
/// @param vunit
/*This script returns a list of abilities that the current unit is eligible to learn
*/

var vlist,vability,vunit,slist,i;

vunit = argument0
slist = vunit.abilitieslist
vlist = ds_list_create()

vability = -1//used to check conditionals for certain abilities

if ds_list_find_value(slist,1) = 0{//can get climber 1 if doesn't have it
    ds_list_add(vlist,1)
    }else{
    if ds_list_find_value(slist,2) = 0{
        ds_list_add(vlist,2)
        }else{
        if ds_list_find_value(slist,3) = 0{
            ds_list_add(vlist,3)
            }
        }
    }
for (i = 4; i < 8; i += 1){//4-7 can get if they don't have it
    if ds_list_find_value(slist,i) = 0{
        ds_list_add(vlist,i)
        }
    }
if ds_list_find_value(slist,8) = 0{//cliffhanger ability
    ds_list_add(vlist,8)
    }else{
    if ds_list_find_value(slist,9) = 0{
        ds_list_add(vlist,9)
        }else{
        if ds_list_find_value(slist,10) = 0{
            ds_list_add(vlist,10)
            }
        }
    }
for (i = 11; i < 15; i += 1){
    if ds_list_find_value(slist,i) = 0{
        ds_list_add(vlist,i)
        }
    }

if ds_list_find_value(slist,15) = 0{//parkour ability
    ds_list_add(vlist,15)
    }else{
    if ds_list_find_value(slist,16) = 0{
        ds_list_add(vlist,16)
        }else{
        if ds_list_find_value(slist,17) = 0{
            ds_list_add(vlist,17)
            }
        }
    }

for (i = 18; i < 42; i += 1){
    if ds_list_find_value(vlist,i) = 0{
        ds_list_add(vlist,i)
        }
    }

if ds_list_find_value(slist,42) = 0{//cliffhanger ability
    ds_list_add(vlist,42)
    }else{
    if ds_list_find_value(slist,43) = 0{
        ds_list_add(vlist,43)
        }else{
        if ds_list_find_value(slist,44) = 0{
            ds_list_add(vlist,44)
            }
        }
    }

for (i = 45; i < 56; i += 1){
    if ds_list_find_value(vlist,i) = 0{
        ds_list_add(vlist,i)
        }
    }


