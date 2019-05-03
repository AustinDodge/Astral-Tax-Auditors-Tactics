/// @description sMapMakeAuditorCorpse(unit)
/// @param unit
/*This script replaces a KO unit with 
*/
var vunit,vKO,vpos,vlist,dunit;


dunit = argument0//the unit that's being KOd


vtile = dunit.mytile
vpos = dunit.myattributelistpos
vlist = ds_list_find_value(playerunitlist,vpos)//the attribute list


//destroy the default inventorylist, since the current one is in the list
vunit = instance_create(x,y,oCorpseAuditor)
with vunit{
    sClearUnitInventoryList(inventorylist)
    ds_list_destroy(inventorylist)
    ds_map_destroy(relationshipmap)
    }
vunit.isauditor = 0//if the KO unit was an auditor or an enemy
vunit.x = vtile.x
vunit.y = vtile.y
vunit.depth = vtile.depth-5
vunit.mx = vtile.mx
vunit.my = vtile.my
vunit.mytile = vtile
vunit.nexttile = vtile
vtile.occupied = vunit
vunit.elevation = vtile.elevation
ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
vunit.myattributelist = vlist
vunit.myattributelistpos = ds_list_find_index(playerunitlist,vlist)
sUnitMakeLightSource(vunit,10,40)

if dunit.object_index = oKOAuditor{
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
    
if instance_exists(oKillControl){
    with vunit{
        amidead = 1
        instance_destroy()
        }
    }

