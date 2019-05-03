/// @description sAIMakeDMapLoop()
/*This script is ran by the AI do make the influence maps the AI uses in its movement decisions.
*/
var vunit,vmoverange,vmovepoints,vgrid,vdamtype;
vunit = ds_list_find_value(dmapindexlist,dmapinitlistpos)
vgrid = ds_list_find_value(dmaplist,dmapinitlistpos)
sunit = vunit
dmapinitlistpos += 1
vmoverange = vunit.moverange
vmovepoints = vunit.movepoints
vunit.moverange = 200//set the moverange high, then reset at the end
vunit.movepoints = 200
sFindMoveRange(vunit)//find the moverange under the new conditions, making the dmap

with oMapTile{
    ds_grid_set(vgrid,mx,my,mydistance)
    }
with oMapTile{
    parent = 0//clear all values
    mydistance = 0
    cango = 0
    canattack = 0
    }
sDestroyRangeTiles()
vunit.moverange = vmoverange//reset the unit's moverange
vunit.movepoints = vmovepoints
vdamtype = vunit.damagetype
switch vdamtype{//set the appropriate damage grid
    case 0: vgrid = kdamagegrid; break;
    case 1: vgrid = edamagegrid; break;
    case 2: vgrid = sdamagegrid; break;
    }
stage = -1//set stage so sFindMoveRange finds the units actual move range, not a path to it
sFindMoveRange(vunit)
stage = 0
with oMapTile{
    if canattack = 1{
        ds_grid_add(vgrid,mx,my,vunit.attackstrength)
        ds_grid_set(oAIControl.activategrid,mx,my,1)
        }
    if cango = 1{
        ds_grid_set(oAIControl.activategrid,mx,my,1)
        }
    }
with oMapTile{
    parent = 0//clear all values
    mydistance = 0
    cango = 0
    canattack = 0
    }
sDestroyRangeTiles()

if dmapinitlistpos = ds_list_size(dmapindexlist){

    //all AI unit activation is now handled by oAIActivationControl and is based on
    //line of sight as well as distance.
    
    /*with oUnitParent{
        if team = 2{//with AI units
            if aiactivated = 0{
                if ds_grid_get(oAIControl.activategrid,mx,my) = 1{
                    aiactivated = 1
                    ds_list_add(oAIControl.unitlist,id)
                    }
                }
            }
        }//end with oUnitParent*/
        
        
    
    ds_grid_destroy(activategrid)
    unitlistsize = ds_list_size(unitlist)
    stage += 1//we're done, move to the next stage
    }


