/// @description sAbilityCliffHanger()
/*The unit checks if it has the cliffhanger ability, how many times it's been used this
room, and if the unit has uses left, reverses the knock direction. Returns 1 if the unit
used the ability.
*/

var vcount,vused,vhasability,vdir,vnum,vpos,i;

vhasability = 0//if the unit has a Cliffhanger ability
vcount = 0//the number of times the unit can use the ability per room
vused = 0//the number of times that the unit has used the ability this room
i = 0//if the unit used the ability this turn
if ds_list_find_value(abilitieslist,8) = 1{
    //cliffhanger 1
    vhasability = 1
    vcount = 1
    vused = ds_list_find_value(abilitiesusedlist,8)
    vpos = 8//the position on the abilitiesusedlist to update
    }
if ds_list_find_value(abilitieslist,9) = 1{
    //cliffhanger 2
    vhasability = 1
    vcount = 3
    vused = ds_list_find_value(abilitiesusedlist,9)
    vpos = 9
    }
if ds_list_find_value(abilitieslist,10) = 1{
    //cliffhanger 3
    vhasability = 1
    vcount = 5
    vused = ds_list_find_value(abilitiesusedlist,10)
    vpos = 10
    }
if vhasability = 1{//if the unit has Cliffhanger in some form
    if vused < vcount{
        sDrawAbilityUsed(vpos,x,y)
        //if the unit hasn't maxed uses yet
        i = 1
        willfall = 0
        willfallpit = 0
        switch knockdir{
            case 0: vdir = 2; break;
            case 1: vdir = 3; break;
            case 2: vdir = 0; break;
            case 3: vdir = 1; break;
            }
        knockdir = vdir
        knockforce = 1
        vused += 1
        ds_list_replace(abilitiesusedlist,vpos,vused)
        ds_list_replace(abilitiescooldownlist,8,1)//use cooldown to check for the remainder of this knock if the unit is using cliffhanger
        }
    }
            
return i;
































    
