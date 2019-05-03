globalvar mapheightgrid,mapitemgrid,unitposgrid,tiletypegrid,roomwidth,roomheight,divratio,divratiolist,divgeneration,
bigwallh,bigwallw,tilewallh,tilewallw,nbigwallgridh,nbigwallgridw,ebigwalleridh,ebigwallgridw,nbigwallgrid,ebigwallgrid,elevheight,
mapdrawingstartx,mapdrawingstarty,tilegrid,tilewallslist,tilewallwlist,reddoor,bluedoor,greendoor,bluedoor,howmanydoors,drawaxislines,
entrydoor,exitdoor,roomenemieslist,howmanyenemies,allenemieskilled,mapobjectgrid,drawtilexadd,drawtileyadd,exitlocked,keytilelist,savetilegrid,
maptype,maptheme,donemakingroom,tilewallsetslist,tilewallsetwlist,levelnumber,howmanydoorterminals,mapitemlist,inelevator,nextelevator;

//variables that affect room difficulty

globalvar mapenemytypelist,mapdifficulty;

donemakingroom = 0

maptype = 0
drawaxislines = 1//whether or not to draw cursor axis lines on map tiles

drawtilexadd = 20//original 18
drawtileyadd = 10//original 9

tilewallh = 15//previous 15
tilewallw = 20//original 18

bigwallh = 33
bigwallw = 20

elevheight = 6//the height in pixels of one unit of elevation
wallslope = 10//original 9 the distance in vertical pixels from one side of a wall sprite to the other
exitlocked = 1//if the exit door is open and can be left through

maxelevation = 0//the elevation of the highest tile.

mapissolvable = 0//if this is 1 after the creation of a new map, create a new map.
makenewmap = 0//if this is one, make a new map at the being step event
makestep = 0//the current step of sMapMakeRoom that's being performed. Controlled by
//oMapCreatorControl.
//it's set to 1 at the end of this create event

inelevator = 0//if the map is an elevator interstitial
nextelevator = 0//if the next map will be an elevator map




/*
We've defined all the constants for making rooms, now we call the script to actually make the thing
*/

mapheightgrid = -1
mapitemgrid = -1
mapobjectgrid = -1
unitposgrid = -1
tilegrid = -1
tiletypegrid = -1
tileindexgrid = -1
savetilegrid = -1
walltilegrid = -1
divratiolist = -1
keytilelist = -1
mapitemlist = -1

levelnumber = -1//the number of maps that have been played through
howmanydoorterminals = 1//how many door lock terminals are in the room


//sMapCreateInit()
makenewmap = 1



/*//previously that code was kept here. Keep it here for reference, although this is out of date.

entrydoor = 1//which door the player entered the room through. 1 = n, 2 = e, etc
exitdoor = 3//which door the player will need to leave the room through, same as above


roomwidth = irandom_range(8,14)
roomheight = irandom_range(8,14)



howmanyenemies = 8
allenemieskilled = 0
roomenemieslist = 0//this will be made later


reddoor = 1//1 if this room has this door, 0 if not. howmanydoors is the total number of doors in the room.
yellowdoor = 0
greendoor = 1
bluedoor = 0
howmanydoors = reddoor + yellowdoor + greendoor + bluedoor

mapdrawingstartx = 300
mapdrawingstarty = 100//the x and y position of the north-east corner, shown on the screen as the top most corner of the unelevated grid,
//where all map drawing starts from

mapheightgrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(mapheightgrid,0)
mapitemgrid = ds_grid_create(roomwidth,roomheight)//holds position of items that are on the map
ds_grid_clear(mapitemgrid,-1)
mapobjectgrid = ds_grid_create(roomwidth,roomheight)//holds the position of room "objects"
ds_grid_clear(mapobjectgrid,-1)
unitposgrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(unitposgrid,-1)
tilegrid = ds_grid_create(roomwidth,roomheight)//holds the IDs of the tile objects
ds_grid_clear(tilegrid,-1)
tiletypegrid = ds_grid_create(roomwidth,roomheight)
ds_grid_clear(tiletypegrid,0)
tileindexgrid = ds_grid_create(roomwidth,roomheight)//the image index that non-special tiles will draw from
ds_grid_clear(tileindexgrid,0)
//make the grids, clear height grid as 0 as is references no objects, other grids are -1 to prevent object confusion
//tiletypegrid is cleared to 0, default tile type
savetilegrid = ds_grid_create(roomwidth,roomheight)//used for modifying the map. All tiles that must be saved
//to guarantee a path to the important parts of the room are stored here as 1, all other tiles are 0.
ds_grid_clear(savetilegrid,0)

divratio = 50
//divratio is the likelyhood that a height cell will divide along the horizontal or vertical axis. Lower is horizontal

divratiolist = ds_list_create()
for(i = 0; i < 100; i += 1){//each time you divide a cell except the first time, shuffle this list then check the top value
    if i < divratio{
        ds_list_add(divratiolist,0)
        }else{
        ds_list_add(divratiolist,1)
        }
    }
    

    
divgeneration = 0//the generation of cuts to make

sMapMakeRoom()
//sMapMakeRoomInit()


/* */
/*  */
