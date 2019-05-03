/// @description sDestroyRangeTiles()
/*This script destroys all the "range" tiles - movement, attack, and knock.
*/

with oMapTile{
    parent = 0//clear all previous parent values
    mydistance = 0
    cango = 0
    canattack = 0
    attackable = 0
    canitem = 0
    
    }

with oMoveRange{
    instance_destroy()
    }
with oAttackRange{
    instance_destroy()
    }
with oAttackIcon{
    instance_destroy()
    }
with oHealIcon{
    instance_destroy()
    }
with oKnockRange{
    instance_destroy()
    }
with oItemRange{
    instance_destroy()
    }

