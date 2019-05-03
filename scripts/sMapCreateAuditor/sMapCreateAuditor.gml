/// @description sMapCreateAuditor(tile,attributelist)
/// @param tile
/// @param attributelist
/*This script creates a player auditor unit on the specified tile with the specified
data.*/

var vunit,vlist,vtile,vko;

vtile = argument0
vlist = argument1
//destroy the default inventorylist, since the current one is in the list


vunit = instance_create(x,y,oAuditor)
    
with vunit{
    sClearUnitInventoryList(inventorylist)
    ds_list_destroy(inventorylist)
    ds_list_destroy(abilitieslist)
    ds_list_destroy(abilitiesusedlist)
    ds_list_destroy(abilitiescooldownlist)
    
    ds_map_destroy(relationshipmap)
    }
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

with vunit{
    if initialized = 0{
        event_perform(ev_other,ev_user0)//do init event for player units
        }
    sGetWeaponStats(myweapon)
    bx = x
    by = y
	sDrawAuditorPickSprites()
    }
    
vko = ds_list_find_value(vlist,70)
if vko = 1{//if making a KOd unit
    //sMapKOAuditor(vunit)
    with vunit{
        amikod = 1
        instance_destroy()
        }
    }
