unitlist = ds_list_create()//the list of units that the AI can move
doneunitlist = ds_list_create()//the list of units that the AI has already moved
inactiveunitlist = ds_list_create()//all units that are "inactive", used to check if they can be activated
unitmovepriority = ds_priority_create()//the priority units will add themselves to
//when they consider their best move
stage = 0//the stage of the AI, the current action it will perform this step
kdamagegrid = ds_grid_create(roomwidth,roomheight)//the grid containing all tiles
//the player can do kinetic damage to
edamagegrid = ds_grid_create(roomwidth,roomheight)//same but for energy
sdamagegrid = ds_grid_create(roomwidth,roomheight)//same but for spooky
roompathgrid = ds_grid_create(roomwidth,roomheight)//the grid that units will save
//their djkstra map of the room to when they consider their move
activategrid = ds_grid_create(roomwidth,roomheight)//the grid the units will access to see if they should be activated
knockbarrelmap = ds_map_create()//a map showing how good an idea it is to knock a barrel from any particular direction.
//the values have the format string(knocktile.id)+string(barrel.id). 
destroybarrelmap = ds_map_create()//a map showing how good an idea it is to blow up a barrel without knocking it
obstacleunitslist = ds_list_create()//a list of units that have obstacles blocking their path that they need to destroy
obstacleunitmap = ds_map_create()//shows the obstacle that the unit needs to destroy. unit is key, obstacle is value.

obstaclemap = -1//the grid structure that the current unit used to determine its current move, if it used one.
obstacletile = -1//the tile that contains the obstacle the current unit needs to destroy
gtile = 0


movingcamera = 0//if the camera is moving to cover the next active unit
ds_grid_clear(activategrid,0)

ds_grid_clear(kdamagegrid,0)
ds_grid_clear(edamagegrid,0)
ds_grid_clear(sdamagegrid,0)
ds_grid_clear(roompathgrid,0)

drawaiscorelist = 0//debug
drawaidmap = 0

dmaplist = ds_list_create()//contains djkstra maps for all player units, showing
//the path to that unit
dmapindexlist = ds_list_create()//each player unit will be in this list in the same
//position as their dmap is on dmaplist, so this functions as an index to see what unit
//you're looking at
dmapinitlistpos = 0//the position currently considered on dmapindexlist
unitlistpos = 0//the position on the active unit list

currentunit = 0//the unit whose move is currently being considered, or who is currently
//being moved. The unit that the AI is thinking about right now, basically
currentunitcanattack = 0//if the currentunit can attack this round
bestmovetile = 0
bestattacktile = 0
movingaunit = 0//if a unit is currently being moved
playerunitchanged = 0//if a player unit was knocked or killed, it might affect the 
//dmaps. This variable tells oAIControl to re-calculate dmaps.

howmanyplayerunits = 0//how many auditors there are
with oUnitParent{
    if team = 1{
        oAIControl.howmanyplayerunits += 1
        ds_list_add(oAIControl.dmapindexlist,id)
        }
    if team = 2{//if it's on the enemy AI team
        if aiactivated = 1{
            ds_list_add(oAIControl.unitlist,id)
            }else{
            ds_list_add(oAIControl.inactiveunitlist,id)
            }
        }
    }

unitlistsize = ds_list_size(unitlist)
    
var i,vroom;
for (i = 0; i < howmanyplayerunits; i += 1){//add as many grids to dmaplist as there are enemies
    vroom = ds_grid_create(roomwidth,roomheight)
    ds_grid_clear(vroom,0)
    ds_list_add(dmaplist,vroom)
    }

if globalnoaimode = 1{
    instance_destroy()
    }
    
aialldone = 0



