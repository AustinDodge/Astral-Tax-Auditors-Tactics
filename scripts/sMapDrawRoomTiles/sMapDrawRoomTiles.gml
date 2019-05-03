/// @description sMapDrawRoomTiles()

//this script creates the actual tiles on the screen and places the tile IDS on the tilegrid

var vx,vy,xgrid,ygrid,vval,vtile,startx,starty,xadd,yadd,vtype,i;

with oMapTestGridTile{
    instance_destroy()
    }
    
xadd = drawtilexadd
yadd = drawtileyadd
    
ds_grid_clear(mapheightgrid,0)

with oMapHeightCell{
    ds_grid_add_region(mapheightgrid,xpos,ypos,(xpos+width),(ypos+height),elevation)
    }
    
startx = mapdrawingstartx
starty = mapdrawingstarty

/*Start at the north-east corner of the room, the corner farthest from the camera. X and Y positions on the
data grid are roomwidth,0.Draw the tiles moving down along the x axis, moving (visually) down and right-to-left.
*/

vx = startx
vy = starty
xgrid = ds_grid_width(mapheightgrid)-1
ygrid = 0
while ygrid < ds_grid_height(mapheightgrid){
    vval = ds_grid_get(mapheightgrid,xgrid,ygrid)//get the height for the tile
    vtype = ds_grid_get(tiletypegrid,xgrid,ygrid)
    if vtype = -1{//temporarily treat pits as regular tiles. THey will later be changed to pits
        vtype = 0
        }
    switch vtype{
        case 0: vtile = instance_create(vx,vy,oMapTile); break;
        case 1: vtile = instance_create(vx,vy,oDoorTile); break;
        case 2: vtile = instance_create(vx,vy,oDoorTile); break;
        case 3: vtile = instance_create(vx,vy,oDoorTile); break;
        case 4: vtile = instance_create(vx,vy,oDoorTile); break;
        }
    switch maptheme{
        case 0: vtile.sprite_index = metaltile1; vtile.bordersprite = metaltileborder; break;
        case 1: vtile.sprite_index = grasstile1; vtile.bordersprite = grasstileborder; break;
        }
    //vtile.depth = 0-vtile.y
    vtile.elevation = vval
    vtile.mx = xgrid
    vtile.my = ygrid
    if vtype = 0{//if it's a regular tile
        vtile.image_index = ds_grid_get(tileindexgrid,xgrid,ygrid)
        }
    ds_grid_set(tilegrid,xgrid,ygrid,vtile)
    vx -= xadd
    vy += yadd
    xgrid -= 1
    if xgrid < 0{
        xgrid = ds_grid_width(mapheightgrid)-1
        ygrid += 1
        vx = startx + (xadd*ygrid)
        vy = starty + (yadd*ygrid)
        }
    }
    
with oMapTile{//perform the tile init code
    event_perform(ev_other,ev_user0)
    }

var startlist,endlist,vtile;//add one entry door tile and one exit tile to keytilelist
startlist = ds_list_create()
endlist = ds_list_create()
with oDoorTile{
    if door = entrydoor{
        ds_list_add(startlist,id)
        }
    if door = exitdoor{
        ds_list_add(endlist,id)
        }
    }
ds_list_shuffle(startlist)
ds_list_shuffle(endlist)
vtile = ds_list_find_value(startlist,0)
ds_list_add(keytilelist,vtile)
vtile = ds_list_find_value(endlist,0)
ds_list_add(keytilelist,vtile)
ds_list_destroy(startlist)
ds_list_destroy(endlist)





