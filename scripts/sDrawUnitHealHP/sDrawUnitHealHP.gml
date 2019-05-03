/// @description sDrawUnitHealHP(vunit,healamount)
/// @param vunit
/// @param healamount
/*this script create the oHealAttackHP object to animate a units gain of hit points
*/

var vunit,vheap,vhp;

vunit = argument0
vheal = argument1

//sUnitSetShudder(vunit,3)

if vunit.hp >= 0{//negative value means the unit can't heal
    if vunit.object_index = oKOAuditor{//if it's being used on a KO unit, revive it
        vheal = floor(vheal/4)
        if vheal < 1{
            vheal = 1
            }
        sMapReviveAuditor(vunit,vheal)
        }else{
        vhp = instance_create(vunit.x,vunit.y,oDrawHealHP)
        vhp.myunit = vunit
        vhp.heal = vheal
        with vhp{
            event_perform(ev_other,ev_user0)
            }
        }
    }

