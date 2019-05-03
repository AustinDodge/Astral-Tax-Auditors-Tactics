/// @description sDFindMapContinuity(starttile)
/// @param starttile
/*This script is used to find if every part of the map has a path from every other part of the map.
It runs djkstra's algorithm on the corner of the map closest to the camera and goes until it can't go
anymore. We can then use this to check if there are any areas that can't be reached or are unreasonably
difficult to get to. 
*/
var openpriority,closedlist,distancemap,starttile,checklist,current,prevdist,newcost,vtile,vmove,b;

with oMapTile{
    parent = 0//clear all previous parent values
    mydistance = 0
    cango = 0
    canattack = 0
    canitem = 0
    attackable = 0
    }
    
sDestroyRangeTiles()

//starttile = ds_grid_get(tilegrid,0,roomheight-1)
starttile = argument0

openpriority = ds_priority_create()//the priority queue of tiles to consider
closedlist = ds_list_create()//the list of tiles that have already been considered
distancemap = ds_map_create()//the map that stores the distance from the starttile
checklist = ds_list_create()//this is the list that each considered tile will put its neighbors into, so the script can be written
//just once

ds_priority_add(openpriority,starttile,0)//add the starttile to open priority with a distance of 0
ds_map_add(distancemap,starttile,0)//add the starttile to the distancemap with a distance of 0

starttile.distance = 0
starttile.cango = 1

current = 0//this is the tile who's neighbors are being considered
prevdist = 0//current's distance, to be added to the cost of the neighbors when they're checked
vtile = 0//this refers to whatever neighbor is currently being checked


while ds_priority_size(openpriority) > 0{//keep looping as long as there are tiles in open
    current = ds_priority_delete_min(openpriority)//find the tile closest to the start tile
    ds_list_add(closedlist,current)//add this tile to the closed list so it's only checked once
    prevdist = ds_map_find_value(distancemap,current)//find current's saved distance to add on to the neighbors
    ds_list_clear(checklist)//ensure there's nothing already on the checklist
    
    if current.n > 0{//add all the current tile's neighbors to checklist
        ds_list_add(checklist,current.n)
        }
    if current.e > 0{
        ds_list_add(checklist,current.e)
        }
    if current.s > 0{
        ds_list_add(checklist,current.s)
        }
    if current.w > 0{
        ds_list_add(checklist,current.w)
        }
    if current.mx = 0 and current.my = 1{
        b = 0//debug
        }
    if ds_list_size(checklist) > 0{//make sure that something was actually put on the checklist
        ds_list_shuffle(checklist)//randomize the order in which neighbors will be considered
        while ds_list_size(checklist) > 0{//consider every neighbor on the checklist
            vtile = ds_list_find_value(checklist,0)//pick the top tile
            with vtile{//and with that tile
                if ds_list_find_index(closedlist,id) = -1{//if the tile's not on the closedlist
                    newcost = sTileFindCostContinuity(prevdist,current)//check the tile's new cost
                    if newcost > 0{//if it's a valid tile to move to
                        if ds_priority_find_priority(openpriority,id)=undefined{//and it's not on the list of tiles to consider
                            
                            mydistance = newcost
                            parent = current
                            ds_priority_add(openpriority,id,mydistance)
                            ds_map_add(distancemap,id,mydistance)
                            cango = 1
                            
                            //maybe add logic in here for checking if a unit is on the tile
                            
                            }else{//if the tile is already in openpriority
                            if newcost < ds_priority_find_priority(openpriority,id){
                                mydistance = newcost
                                parent = current
                                ds_priority_change_priority(openpriority,id,mydistance)
                                ds_map_replace(distancemap,id,mydistance)
                                }
                            }
                        }
                    }
                }//exit with statement
            ds_list_delete(checklist,0)//done with this tile, so delete it from checklist
            }//done with checklist
        ds_list_clear(checklist)
        }
    }
    
//now destroy the data structures made
ds_list_destroy(closedlist)
ds_list_destroy(checklist)
ds_priority_destroy(openpriority)
ds_map_destroy(distancemap)














































