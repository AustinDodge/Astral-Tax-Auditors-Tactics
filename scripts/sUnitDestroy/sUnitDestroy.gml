/// @description sUnitDestroy(destroydata)
/// @param destroydata
/*Ran in the destruction event of EVERY unit that gets destroyed.
*/

var destroydata;
destroydata = argument0

if explodable = 1{
    sUnitDestroyExplosion()
    }

sUnitDestroyAllUnits()//the default actions for all units

sUnitPickDestructionScript(object_index,destroydata)


