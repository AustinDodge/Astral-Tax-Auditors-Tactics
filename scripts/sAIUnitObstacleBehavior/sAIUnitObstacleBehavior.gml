/// @description sAIUnitObstacleBehavior(unit,tilelist)
/// @param unit
/// @param tilelist
/*When a unit is attempting to move towards the player but there's an obstacle blocking its way,
it executes this script to find the proper tile to move to to destroy the obstacle. Based off
sAIUnitDefaultBehavior.
*/
var vunit,vlist,vtile,vscore,vsize,ptile,pscore,i,attacktilelist,asize,j,atile,aunit,
vdamage,vhitchance,vknockchance,ascore,vgrid,gtile,gunit,glist,vx,vy,vrange,poccupied;
vunit = argument0
vlist = argument1
ptile = ds_list_find_value(vlist,0)//the tile the unit will move to
pscore = -1000//the highest scored tile that the unit has found
vscore = -1000
vtile = ptile
vsize = ds_list_size(vlist)
attacktilelist = ds_list_create()
asize = 0
ascore = 0
vgrid = 0
atile = 0
sunit = vunit
gtile = 0//the best tile to attack of all considered possible attack targets
if currentunitcanattack = 1{
    if stage = 2{
        //show_message("should be attacking")
        }
    }else{
    //show_message("moving closer")
    }
for (i = 0; i < vsize; i += 1){
    //loop for every tile the unit can move to
    vtile = ds_list_find_value(vlist,i)
    vscore = -1000
    atile = 0
    gtile = 0
    if currentunitcanattack = 1{//follow this if the unti can attack
        //show_message("ranking an attack!")
        ds_list_clear(attacktilelist)
        sDestroyRangeTiles()
        sFindAttackRange(vunit,vtile)
        sMakeAttackRange(vunit.weaponhealing)
        with oAttackRange{
            if parent.attackable = 1{
                ds_list_add(attacktilelist,parent)
                }
            }
            /*if active = 1{//if units can be attacked from here
                ds_list_add(attacktilelist,parent)//add it to the list
                show_message(
                }
            }*/
        asize = ds_list_size(attacktilelist)
        if asize > 0{
            //evaluate each tile that can be attacked
            for(j = 0; j < asize; j += 1){//check the attack possible against each unit
                ascore = 0
                atile = ds_list_find_value(attacktilelist,j)
                aunit = atile.occupied
                //if atile = obstacletile{//if this is the tile that has the offending obstacle{
                if aunit.team > 2{//if it's an obstacle
                    if aunit.explodable = 1{
                        if vunit.knockdist > 0{//if the unit can knock
                            ascore = ds_map_find_value(knockbarrelmap,string(vtile)+string(aunit))
                            if ascore = undefined{
                                ascore = 0
                                }
                            if atile = obstacletile{
                                ascore += 150
                                }
                            }else{
                            if vtile != vunit.mytile{//if the unit is checking a tile it's not standing on, don't include itself 
                            //reconsider the barrel explosion as though the unit was in the new location
                                (vunit.mytile).occupied = 0
                                poccupied = vtile.occupied
                                vtile.occupied = 0
                                glist = ds_list_create()
                                vx = atile.mx
                                vy = atile.my
                                vrange = aunit.exploderange
                                with oMapTile{
                                    if (abs(vx-mx)+abs(vy-my)) <= vrange{
                                        ds_list_add(glist,id)
                                        }
                                    }
                                ascore = sAICheckBarrelScores(aunit,glist,atile)
                                ascore += 10//compensate for a possible 0 score
                                (vunit.mytile).occupied = vunit
                                vtile.occupied = poccupied
                                }else{
                                ascore = ds_map_find_value(destroybarrelmap,string(aunit))
                                }
                            if atile = obstacletile{
                                ascore += 99
                                }
                            if abs(atile.mx-vtile.my)+(atile.my-vtile.my) <= aunit.knockdist+1{
                                ascore -= 50
                                }
                            
                                }
                            }else{//if the obstacle can't be blown up, no need to check the cost of destroying it.
                            ascore = 1
                            }
                        if atile = obstacletile{
                            ascore += 150
                        }
                    if ascore > vscore{
                        vscore = ascore
                        //bestattacktile = atile
                        gtile = atile
                        }
                    }
                //show_message("ascore is "+string(ascore))
                //show_message("vscore is "+string(vscore))
                }//end for loop
            }
        }else{//if the unit can't attack, move closer to the closest unit
        
        for (j = 0; j < howmanyplayerunits; j += 1){//loop through each player unit dmap
            vgrid = ds_list_find_value(dmaplist,j)
            ascore = 0 - ds_grid_get(vgrid,vtile.mx,vtile.my)//lower grid value means closer,
            //so we subtract that lower score from 1000 so a lower number gives a higher score
            //show_message(ascore)
            
            if ascore > vscore{
                vscore = ascore
                }
            }
        }
    //now that the score for the tile has been found, 
    if vscore > pscore{
        //show_message(vscore)
        pscore = vscore
        ptile = vtile
        if atile > 0{
            bestattacktile = gtile
            }
        }
    vtile.myaiscore = vscore
    }//end for loop

    
ds_priority_add(unitmovepriority,vunit,pscore)
bestmovetile = ptile
if bestattacktile = 0{//if the unit will not attack, deactivate currentunitcanattack
    currentunitcanattack = 0
    }

ds_list_destroy(attacktilelist)

//show_message("Using the obstacle behavior!")
