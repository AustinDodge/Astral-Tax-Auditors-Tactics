/// @description sAbilityReboundCheck(caller)
/// @param caller
/*Called by a unit on it's knock event to see if there are any units adjacent to the new
tile that can "rebound" it, i.e. have that unit face it and change its knock direction.
A unit can only "rebound" once per knock event, and if there is a tie (two units can both
rebound a thing that's knocked past them), then the unit with the highest str will rebound.
*/

var vunit,vtile,dunit,dtile,vlist,dlist,dstr,cunit,vdiff;

vunit = argument0//the unit checking if it should change knock direction
vtile = vunit.mytile//the tile that the checking unit is on
dlist = ds_list_create()//a list of units that can "rebound" this tile
dunit = -1//the unit that will rebound

vlist = sTileGetNeighborList(vtile)
while ds_list_size(vlist) > 0{
    dtile = ds_list_find_value(vlist,0)
    ds_list_delete(vlist,0)
    vdiff = abs(vtile.elevation - dtile.elevation)
    if dtile.occupied > 0{
        dunit = dtile.occupied
        if dunit.team != vunit.team{//don't rebound same team units
            if ds_list_find_value(dunit.abilitieslist,7) = 1{//if the unit can rebound
                if vdiff <= 2{
                    if ds_list_find_value(dunit.abilitiesusedlist,7) = 0{//if the unit hasn't rebounded this action
                        ds_list_add(dlist,dunit)
                        }
                    }
                }
            }
        }
    }
//now we have a list of units that can rebound the unit being knocked.
dunit = -1
dstr = -1
if ds_list_size(dlist) > 0{
    sDrawAbilityUsed(7,vunit.x,vunit.y)
    //find the strongest unit that can rebound
    while ds_list_size(dlist) > 0{
        cunit = ds_list_find_value(dlist,0)
        ds_list_delete(dlist,0)
        if cunit.strength > dstr{
            dunit = cunit
            dstr = dunit.strength
            }
        }
    //now we have the strongest unit that can rebound.
    ds_list_replace(dunit.abilitiesusedlist,7,1)//unit has used the rebound ability, oActionControl will reset it on destruction
    dunit.facing = sUnitFaceUnit(dunit,vunit)//make rebounder face knocked unit
    dunit.anim = 5
    sUnitSetShudder(dunit,1)
    dunit.alarm[7] = 20//unit gets throw animation, like it's pushing the thing, and alarm[7] is set to change it back
    if vunit.knockaxis > 0{//if vunit has a knock axis, switch it to correspond with the knock direction
        switch dunit.facing{
            case 0: vunit.knockaxis = 1; break;//north
            case 1: vunit.knockaxis = 2; break;//east
            case 2: vunit.knockaxis = 1; break;//south
            case 3: vunit.knockaxis = 2; break;//west
            }
        }
    vunit.facing = sUnitFaceUnit(vunit,dunit)//make knocked unit face rebounder
    if dunit.knockaxis > 0{
        vunit.knockforce += 1000
        }else{
        vunit.knockforce += 2//knocked unit always gets extra knock force
        }
    vunit.knockdir = dunit.facing//change knock direction
    }




ds_list_destroy(dlist)
ds_list_destroy(vlist)

