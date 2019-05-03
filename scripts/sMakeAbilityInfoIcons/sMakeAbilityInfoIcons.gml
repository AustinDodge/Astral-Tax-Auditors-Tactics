/// @description sMakeAbilityIcons(unit)
/// @param unit
/*Called by oUnitStatsWindow to draw any abilities that the unit has.
*/

var vx,vy,startx,starty,vicon,vability,vunit,i,vlist;

with oAbilityIcon{
    instance_destroy()
    }

vunit = argument0

startx = oUnitStatsWindow.x+5
starty = oUnitStatsWindow.y+107

vx = startx
vy = starty

vlist = vunit.abilitieslist

for (i = 1; i < 300; i += 1){
    vability = ds_list_find_value(vlist,i)
    if vability = 1{
        vicon = instance_create(vx,vy,oAbilityIcon)
        vicon.abilitynum = i
        vx += 20
        if vx > 130{
            vx = startx
            vy += 20
            }
        }
    }

with oAbilityIcon{
    event_perform(ev_other,ev_user0)
    }
