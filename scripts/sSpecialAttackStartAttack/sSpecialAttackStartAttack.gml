/// @description sSpecialAttackStartAttack(vunit,vtarget,hit,dam,knock,crit,caller,shove)
/// @param vunit
/// @param vtarget
/// @param hit
/// @param dam
/// @param knock
/// @param crit
/// @param caller
/// @param shove
/*Creates oSpecialAttackControl to do a special attack. If hit, dam, knock, or crit
are set to -1, they will use the base stats that the unit would normally use. Caller
is the instance that initiated the attack, it is destroyed when oSpecialAttackControl
is destroyed and is optional, set to 0 for nothing.
Shove is whether the special attack is a shove, using the shove animation stuff.
*/

var vattacker,vdefender,vhit,vdam,vknock,vcrit,vcontrol,vcaller,vshove;
vattacker = argument0
vdefender = argument1
vhit = argument2
vdam = argument3
vknock = argument4
vcrit = argument5
vcaller = argument6
vshove = argument7

vcontrol = instance_create(x,y,oSpecialAttackControl)

vcontrol.shove = vshove
if vshove = 1{
    vcontrol.astriketime = 1
    }

vcontrol.endturnunit = vattacker
ds_list_add(vcontrol.attackerlist,vattacker)
ds_map_add(vcontrol.targetmap,vattacker,vdefender)
ds_map_add(vcontrol.targetmap,vdefender,vattacker)

if vhit != -1{
    vcontrol.ahit = vhit
    }
if vdam != -1{
    vcontrol.adam = vdam
    }
if vknock != -1{
    vcontrol.aknock = vknock
    }
if vcrit != -1{
    vcontrol.acrit = vcrit
    }
vcontrol.mycaller = vcaller

sDestroyRangeTiles()
with oButton{
    instance_destroy()
    }



