/// @description sMapPlaceUnits()
/*This script places the player's units on the map. It makes a list of all the tiles
that are the proper "door" type, shuffles that list, then starts drawing tiles from
the top of the list. It creates the next auditor at the top of that list, and does this
for as many auditors as there are. It also creates enemies, barrels and chests.
*/

var vx,vy,vtilelist,vtile,i,vunit,vlist,etilelist,vfaderadius,vpureradius,vsound;


vx = 0
vy = 0
vtilelist = ds_list_create()
etilelist = ds_list_create()
while vy < roomheight{//make a list of all the matching door tiles
    vtile = ds_grid_get(tilegrid,vx,vy)
    if vtile.door = entrydoor{//if it's the door the player entered the room through
        ds_list_add(vtilelist,vtile)
        }
    //if vtile.door = 0{//if it's a valid tile to place an enemy on
    if ds_grid_get(tiletypegrid,vx,vy) = 0{
        ds_list_add(etilelist,vtile)
        }
        
    vx += 1
    if vx = roomwidth{
        vx = 0
        vy += 1
        }
    }
if ds_list_size(etilelist) < 26{
    show_message("Not enough tiles to put everything on!")
    game_restart()
    }
//done making list of door tiles
ds_list_shuffle(vtilelist)//mix the list up
//This may change in the future - the player may get the ability to change the
//"formation" of their units before starting the map

    
sMapPlacePlayerUnits()

ds_list_destroy(vtilelist)

var vobj;

//now place enemies on the map
ds_list_shuffle(etilelist)//mix up the eligible tiles
for (i = 0; i < ds_list_size(roomenemieslist); i += 1){//and put them all down
    vtile = ds_list_find_value(etilelist,0)
    ds_list_delete(etilelist,0)
    vlist = ds_list_find_value(roomenemieslist,i)
    vobj = ds_list_find_value(vlist,35)
    vsound = sUnitGetMoveSoundType(vobj)//use the number before it gets turned into the object index
    vobj = sPickEnemy(vobj)
    vunit = instance_create(x,y,vobj)
    //destroy data structures made on instance creation
    //relationship map shouldn't be destroyed
    with vunit{
        ds_list_destroy(inventorylist)
        ds_list_destroy(abilitieslist)
        ds_list_destroy(abilitiesusedlist)
        ds_list_destroy(abilitiescooldownlist)
        }
    vunit.unitmovesound = vsound
    vunit.x = vtile.x
    vunit.y = vtile.y
    vunit.depth = vtile.depth-5
    vunit.mx = vtile.mx
    vunit.my = vtile.my
    vunit.mytile = vtile
    vunit.nexttile = vtile
    vunit.elevation = vtile.elevation
    vtile.occupied = vunit
    ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
    vunit.myattributelist = vlist
    vunit.myattributelistpos = i
    sEnemyGetAttributes(vunit)//have them load up the proper attributes
    vunit.initialized = 1
    
    with vunit{
        sGetWeaponStats(myweapon)
        sEnemyGetStartStatus(unittype)
        }
    vunit.aiactivated = 0//de-activate the unit
    }

ds_list_destroy(roomenemieslist)
    
for (i = 0; i < 10; i += 1){//make green barrels
    vtile = ds_list_find_value(etilelist,0)
    ds_list_delete(etilelist,0)
    vobj = oGreenBarrel
    vunit = instance_create(x,y,vobj)
    vunit.x = vtile.x
    vunit.y = vtile.y
    vunit.depth = vtile.depth-5
    vunit.mx = vtile.mx
    vunit.my = vtile.my
    vunit.mytile = vtile
    vunit.nexttile = vtile
    vunit.elevation = vtile.elevation
    vtile.occupied = vunit
    ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
    with vunit{
        event_perform(ev_other,ev_user0)
        }
    }
    
for(i = 0; i < 4; i += 1){//make red chests
    vtile = ds_list_find_value(etilelist,0)
    ds_list_delete(etilelist,0)
    vobj = oRedChest
    vunit = instance_create(x,y,vobj)
    vunit.x = vtile.x
    vunit.y = vtile.y
    vunit.depth = vtile.depth-5
    vunit.mx = vtile.mx
    vunit.my = vtile.my
    vunit.mytile = vtile
    vunit.nexttile = vtile
    vunit.elevation = vtile.elevation
    vtile.occupied = vunit
    ds_grid_set(unitposgrid,vunit.mx,vunit.my,vunit)
    with vunit{
        event_perform(ev_other,ev_user0)
        }
    }

    
ds_list_destroy(etilelist)
    

with oPlayerUnitParent{
	sDrawAuditorPickSprites()
    if initialized = 0{
        event_perform(ev_other,ev_user0)//do init event for player units
        }
    sGetWeaponStats(myweapon)
    }
with oUnitParent{
    bx = x
    by = y
    movepoints = moverange
    pmovepoints = movepoints
    lasttime = mytile
    }

