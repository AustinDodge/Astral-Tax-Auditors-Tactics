/// @description sFindMoveRange(unit)
/// @param unit
/*this script finds the movement range of any unit clicked with djkstra's algorithm.
It will 
It will be up to another algorithm to determine what to do with that - whether to set
those tiles to movable in preparation for moving the unit, etc.
*/
var openpriority,closedlist,distancemap,starttile,checklist,current,prevdist,newcost,vunit,moves,vtile,vmove,findingdmap,i,
vuprange,vclimber,vertmod,vvertmod,vparkour,vvertplus,punit,j,guprange,visclimbing;

with oMapTile{
    parent = 0//clear all previous parent values
    mydistance = 0
    cango = 0
    canattack = 0
    canitem = 0
    attackable = 0
    mymoverange = -1
    }
    
sDestroyRangeTiles()

findingdmap = 0
if instance_exists(oAIControl){
    if oAIControl.stage = 0{//if AIControl is currently making dmaps
        findingdmap = 1
        }
    }

openpriority = ds_priority_create()//the priority queue of tiles to consider
closedlist = ds_list_create()//the list of tiles that have already been considered
distancemap = ds_map_create()//the map that stores the distance from the starttile
checklist = ds_list_create()//this is the list that each considered tile will put its neighbors into, so the script can be written
//just once

vunit = argument0//the unit who's move range will be found
starttile = vunit.mytile//the first tile to consider
moves = vunit.movepoints
if ds_list_find_value(vunit.abilitiesusedlist,37) = 1{
    moves *= 2
    }
if ds_list_find_value(vunit.abilitiesusedlist,30) = 1{//if the unit is using the Wait for me ability
    moves = 1000
    }

//get climber ability uprange bonus
vuprange = vunit.uprange
vclimber = 0
vertmod = 0//how much to decrease the vertical move cost by

//climbing mods
if ds_list_find_value(vunit.abilitieslist,1){
    vclimber = 1
    }
if ds_list_find_value(vunit.abilitieslist,2){
    vclimber = 2
    }
if ds_list_find_value(vunit.abilitieslist,3){
    vclimber = 3
    }
if vclimber > 0{
    switch vclimber{
        case 1: vuprange += 1; break;
        case 2: vuprange += 2; break;
        case 3: vuprange += 3; vertmod += 1 break;
        }
    }
if ds_list_find_value(vunit.abilitiesusedlist,41) = 1{//if the unit is using Leap
    vuprange *= 2
    }
    
//parkour mods
vparkour = 0
if ds_list_find_value(vunit.abilitieslist,15) = 1{
    vparkour = 1
    }
if ds_list_find_value(vunit.abilitieslist,16) = 1{
    vparkour = 2
    }
if ds_list_find_value(vunit.abilitieslist,17) = 1{
    vparkour = 3
    }



//status effects
if vunit.stunnedstatus > 0{
    moves = 0
    }

ds_priority_add(openpriority,starttile,0)//add the starttile to open priority with a distance of 0
ds_map_add(distancemap,starttile,0)//add the starttile to the distancemap with a distance of 0

starttile.distance = 0
starttile.cango = 1

current = 0//this is the tile who's neighbors are being considered
prevdist = 0//current's distance, to be added to the cost of the neighbors when they're checked
vtile = 0//this refers to whatever neighbor is currently being checked


while ds_priority_size(openpriority) > 0{//keep looping as long as there are tiles in open
    current = ds_priority_delete_min(openpriority)//find the tile closest to the start tile
    if current.mx = 5 and current.my = 1{
        i = 0//debug to check specific tiles
        }
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
                    //****************START CLIMBING STUFF
                    vvertmod = vertmod//save original vertmod
                    guprange = vuprange
                    visclimbing = 0
                    vvertplus = 0//the additional uprange from climbing assistance
                    vertmod = 0
                    
                    if current.occupied > 0{//if there's a unit on the previous tile
                        punit = current.occupied
                        if punit.team = vunit.team{
                            if punit != vunit{
                                if ds_list_find_value(punit.abilitieslist,33) = 1{//if the unit has booster
                                    if current.elevation < vtile.elevation{
                                        vvertplus += 3
                                        visclimbing = 1
                                        }
                                    }
                                }
                            }
                        }
                    if vtile.occupied > 0{//if there's a unit on the tile being considered
                        punit = vtile.occupied
                        if punit.team = vunit.team{
                            if punit != vunit{
                                if ds_list_find_value(punit.abilitieslist,34) = 1{//if the unit has lifter
                                    if current.elevation < vtile.elevation{
                                        vvertplus += 3
                                        visclimbing = 1
                                        }
                                    }
                                }
                            }
                        }
                    if visclimbing = 1{
                        j = abs(current.elevation - vtile.elevation)//the uprange cost to be negated with climbing assistance.
                        if j > vuprange{
                            j -= vuprange
                            if j > 3{
                                j = 3
                                }
                            if j > 0{
                                vertmod += j
                                }
                            }
                        }
                    guprange += vvertplus//add unit lifting bonuses to the uprange
                    //***************END CLIMBING STUFF
                    
                    newcost = sTileFindCost(findingdmap,current.elevation,prevdist,vunit,guprange,vertmod,vparkour)//check the tile's new cost
                    vertmod = vvertmod//reset to original vertmod
                    if newcost > 0{//if it's a valid tile to move to
                        if newcost < moves{//and there are enough moves left to get there
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
if findingdmap = 0{
    var valarm;
    with oMapTile{//actually make the move range
        if myobject != 0{
            cango = 0
            }
        if cango = 1{
            vmove = instance_create(x,y,oMoveRange)
            vmove.mytile = id
            vmove.visible = 0//make it invisible
            
            mymoverange = vmove
            
            valarm = floor(mydistance)
            if valarm > 0{
                vmove.alarm[0] = valarm//blooms out from player
                }else{
                vmove.alarm[0] = 2
                }
            
            
            vmove.mx = mx
            vmove.my = my
            vmove.depth = depth-1
            if occupied = 0 or occupied = vunit{
                if instance_exists(oAIControl){//if it's the AI turn
                    sFindAttackRange(vunit,id)
                    }
                }
            }
        
        }
    if instance_exists(oAIControl){//if it's the AI turn
        sMakeAttackRange(vunit.weaponhealing)//make the attack tiles found two lines up
        }
    }
    
with oIntControl{
    alarm[0] = 2//give two steps to reset the mousebuttonpressed event
    }

                                
    

















































