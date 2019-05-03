/// @description sDrawUnitAttackHP(vunit,damage)
/// @param vunit
/// @param damage
/*this script create the oDrawAttackHP object to animate a units loss of hit points
*/

var vunit,vdam,vhp;

vunit = argument0
vdam = argument1

if vunit.unitisitem = 0{
    sUnitSetShudder(vunit,3)
    }
if vunit.explodestatus = 1{
    //audio_play_sound(soundBubbles1,2,0)
    sSoundPlayEffect(soundBubbles1,1,0,1)
    vdam = vunit.hp
    vunit.explodable = 1
    sUnitSetShudder(vunit,10)
    }

if vunit.hp >= 0{//a negative value means the unit can't take damage
    vhp = instance_create(vunit.x,vunit.y,oDrawAttackHP)
    vhp.myunit = vunit
    vhp.damage = vdam
    with vhp{
        event_perform(ev_other,ev_user0)
        }
    }

