/// @description sUnitKillMidKnock(unit)
/// @param unit
/*This script kills a unit in the middle of a "knock turn", before all movement has stopped
and oKnockControl deals out damage.
*/
var vunit,vcontrol,vpos;
vunit = argument0

vunit.anim = 4

pausemove = 1//stop all movement while death happens
if !instance_exists(oKillControl){
    vcontrol = instance_create(vunit.x,vunit.y,oKillControl)
    }else{
    vcontrol = oKillControl
    }
if instance_exists(oKnockControl){
    vpos = ds_list_find_index(oKnockControl.knockedlist,vunit)
    if vpos > -1{
        while vpos > -1{
            ds_list_delete(oKnockControl.knockedlist,vpos)
            vpos = ds_list_find_index(oKnockControl.knockedlist,vunit)
            }
        if ds_list_size(oKnockControl.knockedlist) = 0 and ds_list_size(oKnockControl.doneknockedlist) = 0{
            with oKnockControl{
                instance_destroy()
                }
            }
        }
    }
if instance_exists(oDrawAttackHP){
    with oDrawAttackHP{
        if myunit = vunit{
            instance_destroy()
            }
        }
    }
vunit.alarm[4] = -1//turn off the alarm, if active
ds_list_add(vcontrol.victimslist,vunit)
with vcontrol{
    event_perform(ev_other,ev_user0)
    }
