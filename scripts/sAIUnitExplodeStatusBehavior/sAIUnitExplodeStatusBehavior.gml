/// @description sAIUnitExplodeStatusBehavior(unit,tilelist)
/// @param unit
/// @param tilelist
/*this script is the default AI behavior for units. If a unit can attack at all, it will,
choosing the attack that will do the most damage regardless of its chance to hit. If attacks
are tied for damage, it will then prioritize the attack most likely to hit. If there's still
a tie, it will attack the unit with the lowest HP. If it cannot attack, the unit will move
closer to the closest player unit.
*/
var vunit,vlist,vtile,vscore,vsize,ptile,pscore,i,attacktilelist,asize,j,atile,aunit,
vdamage,vhitchance,vknockchance,ascore,vgrid,gtile,vx,vy,friendlykilltile,tilenogood,
varray;
vunit = argument0
vlist = argument1
ptile = ds_list_find_value(vlist,0)//the tile the unit will move to
pscore = -1000//the highest scored tile that the unit has found
vscore = -500//the score of the current tile
vtile = ptile
vsize = ds_list_size(vlist)
attacktilelist = ds_list_create()
asize = 0
ascore = 0
vgrid = 0
atile = 0
sunit = vunit
gtile = 0//the best tile to attack of all considered possible attack targets
friendlykilltilelist = ds_list_create()//a list of tiles that will cause damage to friendlies if attacked from
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
    tilenogood = 0
    if currentunitcanattack = 1{//follow this if the unti can attack
        //show_message("ranking an attack!")
        ds_list_clear(attacktilelist)
        sDestroyRangeTiles()
        vx = vtile.mx
        vy = vtile.my
        if vx - 1 >= 0{
            atile = ds_grid_get(tilegrid,vx-1,vy)
            if atile.occupied > 0{
                ds_list_add(attacktilelist,atile)
                }
            }
        if vx +1 < roomwidth{
            atile = ds_grid_get(tilegrid,vx+1,vy)
            if atile.occupied > 0{
                ds_list_add(attacktilelist,atile)
                }
            }
        if vy - 1 >= 0{
            atile = ds_grid_get(tilegrid,vx,vy-1)
            if atile.occupied > 0{
                ds_list_add(attacktilelist,atile)
                }
            }
        if vy + 1 < roomheight{
            atile = ds_grid_get(tilegrid,vx,vy+1)
            if atile.occupied > 0{
                ds_list_add(attacktilelist,atile)
                }
            }
        asize = ds_list_size(attacktilelist)
        if asize > 0{
            ascore = 0
            for(j = 0; j < asize; j += 1){//check the attack possible against each unit
                atile = ds_list_find_value(attacktilelist,j)
                if abs(atile.elevation - vtile.elevation) <= vunit.attackuprange{
                    aunit = atile.occupied
                    if aunit.team = 1{//if it's player controlled
						
                        varray = sFindAttackDamage(vunit,vtile,aunit,0)
						vdamage = varray[0]
                        if vdamage > aunit.hp{
                            vdamage *= 2
                            }
                        if vdamage > 0{
                            vdamage *= 200
                            }
                        ascore += vdamage
                        gtile = atile
                        ascore += 100-aunit.hp//a lower aunit hp will produce a higher score
                        ascore = sAIModifyAttackScore(aunit,ascore)
                        }else{//if it's not on the enemy team
                        if aunit != vunit{//make sure it's not thinking about itself
                            if aunit.team = vunit.team{//don't remove points for destroying barrels, containers, etc
                                varray = sFindAttackDamage(vunit,vtile,aunit,0)
								vdamage = varray[0]
                                if vdamage > aunit.hp{
                                    vdamage *= 2
                                    }
                                if vdamage > 0{
                                    vdamage *= 10
                                    }
                                ascore -= vdamage
                                ascore -=  1000
                                ds_list_add(friendlykilltilelist,vtile)
                                }
                            }
                        }
                    }
                //show_message("ascore is "+string(ascore))
                //show_message("vscore is "+string(vscore))
                }//end for loop
            vscore = ascore
            }
        //since we don't want the unit to stay still, add this in so that non-attack tiles are considered if there are no valid attack tiles.
        for (j = 0; j < howmanyplayerunits; j += 1){//loop through each player unit dmap
            vgrid = ds_list_find_value(dmaplist,j)
            ascore = 0 - ds_grid_get(vgrid,vtile.mx,vtile.my)//lower grid value means closer,
            //so we subtract that lower score from 1000 so a lower number gives a higher score
            //ascore SHOULD be a negative number
            vscore -= ascore
            
            //show_message(ascore)
            //if ascore > vscore{
            //    vscore += ascore
            //    }
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
    if vscore > pscore{//if the tile currently considered by the loop is a better tile than any other considered so far
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
ds_list_destroy(friendlykilltilelist)
