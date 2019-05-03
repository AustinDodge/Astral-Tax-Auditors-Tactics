/// @description sAFindMapPath(starttile,endtile,changedirectioncost,noise,startdir)
/// @param starttile
/// @param endtile
/// @param changedirectioncost
/// @param noise
/// @param startdir
/*This script is ran to find a continuous path between two tiles, generally between two doors. The path is used to
make sure that all objectives and the exit door can be reached from the start door when cutting tiles away for
bottomless pits. The typical djkstra is modified to act more like a*.
*/
var openpriority,closedlist,distancemap,starttile,checklist,current,prevdist,newcost,vtile,vmove,changedirectioncost,noise,endtile,
vdir,prevdir,cdir,noisegrid,noisesize,noiseamount,vx,vy,i,h,vgrid;

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
endtile = argument1//when this tile is reached, the script is done.
changedirectioncost = argument2//how much is costs to change the direction the path is moving in
noise = argument3//if there should be a noise grid to keep the path from being perfectly straight and if so,
startdir = argument4//the direction the path will start moving in. Only applies if there is a cost to change direction.
//how intense that noise should be
noisegrid = ds_grid_create(roomwidth*2,roomheight*2)
if noise > 0{//if there should be noise
    ds_grid_clear(noisegrid,0)
    noisesize = noise//the size of square that should be put on the noisegrid
    noiseamount = mean(roomwidth,roomheight)*2//how many squares of noise to put on the grid
    while noisesize > 0{
        for(i = 0; i < noiseamount; i += 1){
            vx = irandom((roomwidth*2)-1)
            vy = irandom((roomheight*2)-1)
            if (vx+noisesize < roomwidth*2) and (vy+noisesize < roomheight*2){//if the square won't go out of grid
                ds_grid_add_region(noisegrid,vx,vy,vx+noisesize,vy+noisesize,1)
                }else{
                ds_grid_add_region(noisegrid,vx-noisesize,vy-noisesize,vx,vy,1)
                }
            }
        
        noisesize -= 1
        }
    vgrid = ds_grid_create(roomwidth,roomheight)
    vx = floor(roomwidth/2)
    vy = floor(roomheight/2)
    ds_grid_set_grid_region(vgrid,noisegrid,vx,vy,vx+roomwidth,vy+roomheight,0,0)
    ds_grid_destroy(noisegrid)
    noisegrid = vgrid
    }

if changedirectioncost > 0{
    starttile.pathdir = startdir
    }
    
openpriority = ds_priority_create()//the priority queue of tiles to consider
//in this script, this doesn't track the path distance from the starttile, but rather the path distance
//PLUS the manhattan distance from the endtile.
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
    if ds_list_size(checklist) > 0{//make sure that something was actually put on the checklist
        ds_list_shuffle(checklist)//randomize the order in which neighbors will be considered
        while ds_list_size(checklist) > 0{//consider every neighbor on the checklist
            vtile = ds_list_find_value(checklist,0)//pick the top tile
            with vtile{//and with that tile
                if ds_list_find_index(closedlist,id) = -1{//if the tile's not on the closedlist
                    newcost = sTileFindCostAMap(prevdist,current,id)//check the tile's new cost
                    if newcost > 0{//if it's a valid tile to move to
                        cdir = 0
                        if changedirectioncost > 0{
                            cdir = 0
                            if id = current.n{//find the direction that this will move the path in
                                cdir = 0
                                }
                            if id = current.e{
                                cdir = 1
                                }
                            if id = current.s{
                                cdir = 2
                                }
                            if id = current.w{
                                cdir = 3
                                }
                            if cdir != current.pathdir{
                                newcost += changedirectioncost
                                }
                            }
                        if noise > 0{//if we need to add noise to the tile to make a squiggly line
                            newcost += ds_grid_get(noisegrid,mx,my)
                            //show_message(ds_grid_get(noisegrid,mx,my))
                            }
                        h = abs(mx - endtile.mx) + abs(my - endtile.my)//get the heuristic to end tile
                        if ds_priority_find_priority(openpriority,id)=undefined{//and it's not on the list of tiles to consider
                            mydistance = newcost + h
                            parent = current
                            ds_priority_add(openpriority,id,mydistance)
                            ds_map_add(distancemap,id,mydistance)
                            cango = 1
                            pathdir = cdir
                            
                            //maybe add logic in here for checking if a unit is on the tile
                            
                            }else{//if the tile is already in openpriority
                            if newcost+h < ds_priority_find_priority(openpriority,id){
                                mydistance = newcost + h
                                parent = current
                                ds_priority_change_priority(openpriority,id,mydistance)
                                ds_map_replace(distancemap,id,mydistance)
                                pathdir = cdir
                                }
                            }
                        if id = endtile{//if we've reached the end, empty openpriority to end the algorithm
                            ds_priority_empty(openpriority)
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
ds_grid_destroy(noisegrid)














































