/// @description sMapKOAuditor(unit)
/// @param unit
/*This script destroys an auditor and replaces it with a KO'd environment object.
*/
var vunit,vKO,vpos,vlist,dunit;


dunit = argument0//the unit that's being KOd

vtile = dunit.mytile
vpos = dunit.myattributelistpos
vlist = ds_list_find_value(playerunitlist,vpos)//the attribute list


//destroy the default inventorylist, since the current one is in the list
vunit = instance_create(x,y,oKOAuditor)
with vunit{
    sClearUnitInventoryList(inventorylist)
    ds_list_destroy(inventorylist)
    ds_map_destroy(relationshipmap)
    }
vunit.isauditor = 1//if the KO unit was an auditor or an enemy
vunit.x = vtile.x
vunit.y = vtile.y
vunit.depth = vtile.depth-5
vunit.mx = vtile.mx
vunit.my = vtile.my
vunit.mytile = vtile
vunit.lasttile = mytile
vunit.nexttile = vtile
vtile.occupied = vunit
vunit.elevation = vtile.elevation
ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
vunit.myattributelist = vlist
ds_list_replace(vlist,70,1)//set amikod to 1
vunit.myattributelistpos = ds_list_find_index(playerunitlist,vlist)
sUnitMakeLightSource(vunit,10,40)

if dunit.object_index = oAuditor{
    vunit.isauditor = 1
    }

with vunit{
    if initialized = 0{
        event_perform(ev_other,ev_user0)//do init event for player units
        }
	sDrawAuditorPickSprites()
    bx = x
    by = y
    }
    

