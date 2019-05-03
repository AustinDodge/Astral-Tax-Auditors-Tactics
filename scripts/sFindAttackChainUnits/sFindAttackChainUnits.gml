/// @description sFindAttackChainUnits(chainlength,attacker,defender)
/// @param chainlength
/// @param attacker
/// @param defender
/*This script returns a list of all units that will be affected by a chain attack.
The attacker is not affected by chained attacks, and the defender is not on the list.
*/

var vlist,vunit,vattacker,vlength,plength,lengthmap,current,chainlength,vdefender,checklist,templist,
parentmap,openpriority,closedlist,vdist,vtile,vdiff,newdist;
vlist = ds_list_create()//the list that will be returned, contains all units affected by the chain
closedlist = ds_list_create()
checklist = ds_list_create()
openpriority = ds_priority_create()
distancemap = ds_map_create()
//parentmap = ds_map_create()
chainlength = argument0
vattacker = argument1
vdefender = argument2

//ds_list_add(vlist,vdefender)//add the attacked to the list automatically

ds_priority_add(openpriority,vdefender,1)
ds_map_add(distancemap,vdefender,1)
while ds_priority_size(openpriority) > 0{
    current = ds_priority_delete_min(openpriority)
    ds_list_add(closedlist,current)
    vdist = ds_map_find_value(distancemap,current)
    if is_undefined(vdist){//if there's no previous distance found, set it to impossible high
        vdist = 1000
        }
    ds_list_clear(checklist)
    if sIsTileLocationValid(current.mx,current.my-1){//n
        vunit = ds_grid_get(unitposgrid,current.mx,current.my-1)
        if vunit > 0{
            if vunit != vattacker{
                ds_list_add(checklist,vunit)
                }
            }
        }
    if sIsTileLocationValid(current.mx+1,current.my){//e
        vunit = ds_grid_get(unitposgrid,current.mx+1,current.my)
        if vunit > 0{
            if vunit != vattacker{
                ds_list_add(checklist,vunit)
                }
            }
        }
    if sIsTileLocationValid(current.mx,current.my+1){//s
        vunit = ds_grid_get(unitposgrid,current.mx,current.my+1)
        if vunit > 0{
            if vunit != vattacker{
                ds_list_add(checklist,vunit)
                }
            }
        }
    if sIsTileLocationValid(current.mx-1,current.my){//w
        vunit = ds_grid_get(unitposgrid,current.mx-1,current.my)
        if vunit > 0{
            if vunit != vattacker{
                ds_list_add(checklist,vunit)
                }
            }
        }
        
    if ds_list_size(checklist) > 0{
        ds_list_shuffle(checklist)
        while ds_list_size(checklist) > 0{
            vunit = ds_list_find_value(checklist,0)
            ds_list_delete(checklist,0)
            if ds_list_find_index(closedlist,vunit) < 0{
            vdiff = abs(vunit.elevation - current.elevation)
                if vdiff < vattacker.attackuprange{//make sure the height distance isn't too great
                    newdist = vdist + 1
                    if newdist <= chainlength{
                        if ds_priority_find_priority(openpriority,vunit) = undefined{//if the unit hasn't been considered yet
                        
                            ds_priority_add(openpriority,vunit,newdist)
                            ds_map_add(distancemap,vunit,newdist)
                            if ds_list_find_index(vlist,vunit) < 0{//if the unit isn't on vlist
                                ds_list_add(vlist,vunit)
                                }
                            }else{//if it's in openpriority
                            
                            if newdist < ds_map_find_value(distancemap,vunit){
                                ds_priority_change_priority(openpriority,vunit,newdist)
                                ds_map_replace(distancemap,vunit,newdist)
                                }
                            }//end priority check
                        }//end if newdist < chainlength
                    }//end attackuprange check
                }//end closedlist check
            }
        }
    }
                    
     
ds_list_destroy(closedlist)
ds_list_destroy(checklist)
ds_priority_destroy(openpriority)
ds_map_destroy(distancemap)

return vlist;



































    
    
