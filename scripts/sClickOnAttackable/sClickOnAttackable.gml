/// @description sClickOnAttackable(attackingunit,defendingunit)
/// @param attackingunit
/// @param defendingunit
/*This script describes what happens when a player clicks on a unit to attack them.
*/
var aunit,defunit,adamage,ddamage,ahit,dhit,acrit,dcrit;
aunit = argument0
defunit = argument1

aunit.facing = sUnitFaceUnit(aunit,defunit)//set the attackers facing


with oKnockRange{
    instance_destroy()
    }
with oCancelMoveButton{
    instance_destroy()
    }
with oButton{
    instance_destroy()
    }
    
sCameraMoveXY(round((aunit.x+defunit.x)/2),round((aunit.y+defunit.y)/2),100,100,5)

instance_create(x,y,oAttackWindow)
with oAttackWindow{
    attacker = aunit
    defender = defunit
    event_perform(ev_other,ev_user0)//oAttackWindow figures out the combat information in this event
    }
