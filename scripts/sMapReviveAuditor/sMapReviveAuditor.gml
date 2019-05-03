/// @description sMapReviveAuditor(unit,healamount)
/// @param unit
/// @param healamount
/*This script revives a KOd auditor, replacing it with an oAuditor and healing it
by the armount of argument1.
*/
var vunit,vKO,vpos,vlist,dunit,vheal,vcontrol;


dunit = argument0//the KOd unit that's being revived
vheal = argument1//the amount that the unit will be healed to start

vtile = dunit.mytile
vpos = dunit.myattributelistpos
vlist = ds_list_find_value(playerunitlist,vpos)//the attribute list


//destroy the default inventorylist, since the current one is in the list
vunit = instance_create(x,y,oAuditor)
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
ds_list_replace(vlist,70,0)//unit is no longer KOd
sUnitMakeLightSource(vunit,10,40)
vunit.isauditor = 1


with vunit{
    if initialized = 0{
        event_perform(ev_other,ev_user0)//do init event for player units
        }
	sDrawAuditorPickSprites()
    bx = x
    by = y
    }
vunit.hp = 0
sDrawUnitHealHP(vunit,vheal)

vcontrol = instance_create(x,y,oRevivalControl)
vcontrol.myunit = vunit
//vunit.turnover = 1
//vunit.cancancelmove = 0

with dunit{
    instance_destroy()
    }

