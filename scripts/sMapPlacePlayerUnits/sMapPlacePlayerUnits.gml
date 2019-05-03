/// @description sMapPlacePlayerUnits()
/*This script places the player's units on the map. It makes a list of all the tiles
that are the proper "door" type, shuffles that list, then starts drawing tiles from
the top of the list. It creates the next auditor at the top of that list, and does this
for as many auditors as there are.

Only creates player units, split from sMapPlaceUnits.
*/

var vx,vy,vtilelist,vtile,i,vunit,vlist,etilelist,vfaderadius,vpureradius,vsound;


vtilelist = ds_list_create()
    
with oDoorTile{
    if door = entrydoor{
        ds_list_add(vtilelist,id)
        }
    }

//done making list of door tiles
ds_list_shuffle(vtilelist)//mix the list up
//This may change in the future - the player may get the ability to change the
//"formation" of their units before starting the map
sAuditorListVerifyOrder()
for (i = 0; i < ds_list_size(playerunitlist); i += 1){
    vlist = ds_list_find_value(playerunitlist,i)
    if ds_list_find_value(vlist,33) = 0{//if the auditor isn't dead
        vtile = ds_list_find_value(vtilelist,0)
        ds_list_delete(vtilelist,0)
        sMapCreateAuditor(vtile,vlist)
        
        }
    }

ds_list_destroy(vtilelist)

    

with oPlayerUnitParent{
    sAbilitiesUsedRoomStart(id)
	sDrawAuditorPickSprites()
    }
