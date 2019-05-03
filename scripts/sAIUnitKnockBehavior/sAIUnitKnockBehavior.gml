/// @description sAIUnitKnockBehavior(unit,tilelist)
/// @param unit
/// @param tilelist
/*this script is the default AI behavior for units. If a unit can attack at all, it will,
choosing the attack that will do the most damage regardless of its chance to hit. If attacks
are tied for damage, it will then prioritize the attack most likely to hit. If there's still
a tie, it will attack the unit with the lowest HP. If it cannot attack, the unit will move
closer to the closest player unit.

This is a variant on sAIUnitDefaultBehavior. The unit will see if any units can be knocked off a pit or high
ledge, and will attack the one it is most likely to knock. If there are no units in range that can be knocked
into a better position, then it will follow the default behavior.
*/
var vunit,vlist,vtile,vscore,vsize,ptile,pscore,i,attacktilelist,asize,j,atile,aunit,
vdamage,vhitchance,vknockchance,ascore,vgrid,gtile,klist,kdir,kdamage,ktile,willkill,jtile,kelevation,jelevation,vdiff,
vexploder,vattackingbarrel,ggrid,vnoattack,varray;

vattackingbarrel = 0//debug

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
willkill = 0
vnoattack = 1//if the unit didn't attack, regardless of if it attempted to.
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
        vnoattack = 0
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
            for(j = 0; j < asize; j += 1){//check the attack possible against each unit
                ascore = 0
                atile = ds_list_find_value(attacktilelist,j)
                aunit = atile.occupied
                if aunit.team = 1{//if it's player controlled
                    willkill = 0
                    varray = sFindAttackDamage(vunit,vtile,aunit,0)
					vdamage = varray[0]
                    /*
                    //start accounting for knocking ability
                    kdir = sTileFaceTile(vtile,atile)
                    jtile = vtile//the "previous" tile for calculating fall damage
                    if sIsKnockPossible(aunit,kdir){
                        kdamage = 0
                        klist = sMakeKnockRange(aunit,vunit.knockdist,kdir,0)
                        while ds_list_size(klist) > 0{
                            ktile = ds_list_find_value(klist,0)
                            ktile = ktile.mytile
                            ds_list_delete(klist,0)
                            if ds_grid_get(tiletypegrid,ktile.mx,ktile.my) = -1{
                                willkill = 1
                                }
                            kelevation = ktile.elevation//the tile being knocked to
                            jelevation = jtile.elevation//the tile being knocked from
                            vdiff = (jelevation - kelevation)
                            if vdiff > aunit.vertdist{
                                vdamage += sFindKnockFallDamage(vdiff,aunit.vertdist)
                                }
                            }
                        with oKnockRange{
                            instance_destroy()
                            }
                        ds_list_destroy(klist)
                        }
                    //end accounting for knocking ability
                    */
					
                    vdamage = sFindKnockDamage(aunit,vtile,vunit.knockdist)
                    if vdamage >= aunit.maxhp{
                        willkill = 1
                        }
                    if vdamage > 0{
                        vdamage *= 10
                        }
                    //ascore += vdamage
                    varray = sFindAttackHitChance(vunit,vtile,aunit,0)
					vhitchance = varray[0]
                    if vhitchance > 0{
                        vdamage *= vhitchance
                        if willkill = 1{//if the attack will knock the unit into a pit, it's worth more
                            vdamage *= 10
                            }
                        ascore += vdamage
                        }
                    ascore += 100-aunit.hp//a lower aunit hp will produce a higher score
                    
                    ascore = sAIModifyAttackScore(aunit,ascore)
                    
                    }//end checking if the unit is on the player team   
                if aunit.team = 4{//environmental 
                    ascore = ds_map_find_value(oAIControl.knockbarrelmap,string(vtile)+string(aunit))
                    if ascore = undefined{
                        ascore = -1000
                        }else{
                        if ascore > 0{//if there's nothing positive about attacking the barrel, ignore it.
                            vattackingbarrel = 1
                            }else{
                            ascore = -1000
                            }
                        }
                    }
                    
                if ascore > -1000{
                    if ascore > vscore{
                        if vattackingbarrel = 1{
                            vattackingbarrel = 1
                            }
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
        vnoattack = 1
        for (j = 0; j < howmanyplayerunits; j += 1){//loop through each player unit dmap
            vgrid = ds_list_find_value(dmaplist,j)
            ascore = 0 - ds_grid_get(vgrid,vtile.mx,vtile.my)//lower grid value means closer,
            //so we subtract that lower score from 1000 so a lower number gives a higher score
            //show_message(ascore)
            if ascore > vscore{
                vscore = ascore
                ggrid = vgrid
                }
            }
        }
    if gtile = 0{//if the unit attempted to attack but couldn't find a target, move to closest unit
        vnoattack = 1
        for (j = 0; j < howmanyplayerunits; j += 1){//loop through each player unit dmap
            vgrid = ds_list_find_value(dmaplist,j)
            ascore = 0 - ds_grid_get(vgrid,vtile.mx,vtile.my)//lower grid value means closer,
            //so we subtract that lower score from 1000 so a lower number gives a higher score
            //show_message(ascore)
            if ascore > vscore{
                vscore = ascore
                ggrid = vgrid
                }
            }
        }
        
    if vscore > pscore{
        //show_message(vscore)
        pscore = vscore
        ptile = vtile
        if atile > 0{
            bestattacktile = gtile
            }
        if vnoattack = 1{
            oAIControl.obstaclemap = ggrid
            bestattacktile = 0
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
