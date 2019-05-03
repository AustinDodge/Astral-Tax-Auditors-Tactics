/// @description sMapCreateInit()
/*This script is called to make a new map. It destroys the currently existing map and 
associated data structures and creates a new one in their place. It is always ran by
oMapControl.
*/
donemakingroom = 0
sMapClearRoom()//delete everything that was in the room

var perimetermin,perimetermax,doorlist,i;


oMapControl.mapissolvable = 1//if this is 0 at the end of map creation, then we need to make a new map.

if nextelevator = 1{
    inelevator = 1
    }else{
    inelevator = 0
    }
//inelevator = 1//debug


/*If we're past the first level, potentially add another door terminal. Don't add more than three terminals.
*/
if levelnumber >= 1{
    if howmanydoorterminals < 3{
        if irandom(2) = 1{
            howmanydoorterminals += 1
            }
        }
    }
    
mapdifficulty = 300+(60*levelnumber)

maptype = irandom(1)
//maptype = 1//debug force
/*
0 = cavern
1 = catwalk
*/

maptheme = irandom(1)
//maptheme = 1//debug force
/*
0 = industrial
1 = park
*/

switch maptype{
    case 0: perimetermin = 15; perimetermax = 20; break;
    case 1: perimetermin = 19; perimetermax = 24; break;
    }
    
doorlist = ds_list_create()
for(i = 1; i < 5; i += 1){
    ds_list_add(doorlist,i)
    }

ds_list_shuffle(doorlist)
entrydoor = ds_list_find_value(doorlist,0)//which door the player entered the room through. 1 = n, 2 = e, etc

entrydoor = irandom_range(3,4)//debug

//entrydoor = 1//which door the player entered the room through. 1 = n, 2 = e, etc
ds_list_delete(doorlist,0)
//exitdoor = ds_list_find_value(doorlist,0)//which door the player will need to leave the room through, same as above


exitdoor = irandom_range(1,2)//debug


//exitdoor = 3//which door the player will need to leave the room through, same as above
ds_list_destroy(doorlist)
//exitlocked = 1
exitlocked = 1//debug door open

//entrydoor = 1
//exitdoor = 3

reddoor = 0//1 if this room has this door, 0 if not. howmanydoors is the total number of doors in the room.
yellowdoor = 0
greendoor = 0
bluedoor = 0

switch entrydoor{
    case 1: reddoor = 1; break;
    case 2: yellowdoor = 1; break;
    case 3: greendoor = 1; break;
    case 4: bluedoor = 1; break;
    }
switch exitdoor{
    case 1: reddoor = 1; break;
    case 2: yellowdoor = 1; break;
    case 3: greendoor = 1; break;
    case 4: bluedoor = 1; break;
    }

howmanydoors = reddoor + yellowdoor + greendoor + bluedoor



roomwidth = irandom_range(9,16)
roomheight = irandom_range(9,16)



while (roomwidth + roomheight) < perimetermin{
    roomwidth = irandom_range(8,16)
    roomheight = irandom_range(8,16)
    }
    
if inelevator = 1{
    roomwidth = 3
    roomheight = 2
    }



//howmanyenemies = 8
howmanyenemies = 8
allenemieskilled = 0
roomenemieslist = 0//this will be made later



mapdrawingstartx = 300
mapdrawingstarty = 100//the x and y position of the north-east corner, shown on the screen as the top most corner of the unelevated grid,
//where all map drawing starts from

if ds_exists(mapheightgrid,ds_type_grid){
    ds_grid_destroy(mapheightgrid)
    }
mapheightgrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(mapheightgrid,0)

if ds_exists(mapitemgrid,ds_type_grid){
    ds_grid_destroy(mapitemgrid)
    }
mapitemgrid = ds_grid_create(roomwidth,roomheight)//holds position of items that are on the map
ds_grid_clear(mapitemgrid,-1)

if ds_exists(mapobjectgrid,ds_type_grid){
    ds_grid_destroy(mapobjectgrid)
    }
mapobjectgrid = ds_grid_create(roomwidth,roomheight)//holds the position of room "objects"
ds_grid_clear(mapobjectgrid,-1)

if ds_exists(unitposgrid,ds_type_grid){
    ds_grid_destroy(unitposgrid)
    }
unitposgrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(unitposgrid,-1)

if ds_exists(tilegrid,ds_type_grid){
    ds_grid_destroy(tilegrid)
    }
tilegrid = ds_grid_create(roomwidth,roomheight)//holds the IDs of the tile objects
ds_grid_clear(tilegrid,-1)

if ds_exists(tiletypegrid,ds_type_grid){
    ds_grid_destroy(tiletypegrid)
    }
tiletypegrid = ds_grid_create(roomwidth,roomheight)//the type of tile, described in sTileTypeKey
ds_grid_clear(tiletypegrid,0)


if ds_exists(tileindexgrid,ds_type_grid){
    ds_grid_destroy(tileindexgrid)
    }
tileindexgrid = ds_grid_create(roomwidth,roomheight)//the image index that non-special tiles will draw from
ds_grid_clear(tileindexgrid,0)

//make the grids, clear height grid as 0 as is references no objects, other grids are -1 to prevent object confusion
//tiletypegrid is cleared to 0, default tile type
if ds_exists(savetilegrid,ds_type_grid){
    ds_grid_destroy(savetilegrid)
    }
savetilegrid = ds_grid_create(roomwidth,roomheight)//used for modifying the map. All tiles that must be saved
//to guarantee a path to the important parts of the room are stored here as 1, all other tiles are 0.
ds_grid_clear(savetilegrid,0)


if ds_exists(walltilegrid,ds_type_grid){//used for making walls, only contains tiles that should have walls drawn
    ds_grid_destroy(walltilegrid)
    }
walltilegrid = ds_grid_create(roomwidth,roomheight)

divratio = 50
//divratio is the likelyhood that a height cell will divide along the horizontal or vertical axis. Lower is horizontal

if ds_exists(keytilelist,ds_type_list){
    ds_list_destroy(keytilelist)
    }
keytilelist = ds_list_create()//the list of tiles that need to be accessable

if ds_exists(divratiolist,ds_type_list){
    ds_list_destroy(divratiolist)
    }
    
    
if ds_exists(mapitemlist,ds_type_list){
    sClearMapItemList()
    ds_list_destroy(mapitemlist)
    }
mapitemlist = ds_list_create()

divratiolist = ds_list_create()
for(i = 0; i < 100; i += 1){//each time you divide a cell except the first time, shuffle this list then check the top value
    if i < divratio{
        ds_list_add(divratiolist,0)
        }else{
        ds_list_add(divratiolist,1)
        }
    }
    

    
divgeneration = 0//the generation of cuts to make

/*********MAP TYPE INIT STUFF*************/
switch maptype{//different grid inits for different map types
    case 0: ds_grid_clear(tiletypegrid,0); break;//init to regular tile for cavern map
    case 1: ds_grid_clear(tiletypegrid,0); break;//init to pit for catwalk map
    }

//sMapMakeRoom()
instance_create(x,y,oMapCreatorControl)
//sMapMakeRoomInit()

