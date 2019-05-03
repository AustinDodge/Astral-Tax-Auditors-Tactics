/// @description sMapActivateAIUnits()
/*This script finds the sight range for all AI units and activates any that can currently
see the player.
*/
var vunit,vturn,iunit,vrange,vlist,i;
vturn = playerturn
iunit = 0
with oAuditor{
    iunit = id
    }
if iunit = 0{//if there is no auditor to be iunit
    with oUnitParent{
        if team = 1{
            iunit = id
            }
        }
    }
if iunit = 0{//if there is no player unit, use any unit just to not crash
    iunit = instance_nearest(x,y,oUnitParent)
    }


//Make the sight maps for all inactive AI units and activate any that can see the player
sDestroyRangeTiles()
playerturn = 1
with oUnitParent{//now make the influence maps for any units that don't start activated
    if team = 2{
        facing = irandom(3)
        if aiactivated = 0{
            vrange = moverange
            moverange = visionrange
            myinfluencemap = ds_grid_create(roomwidth,roomheight)
            vunit = id
            sunit = id
            ds_grid_clear(myinfluencemap,0)
            //sFindMoveRange(id)
            with oMapTile{
                //cango = 0
                vdist = abs(mx - vunit.mx) + abs(my - vunit.my)
                if vdist < vunit.moverange{//not including the unit's attack range for now
                    if sCheckLineOfSight(vunit.mytile,id,vunit,iunit) = 1{
                        //cango = 1
                        ds_grid_set(vunit.myinfluencemap,mx,my,1)
                        }
                    }
                }
            moverange = vrange
            }
        }
    }
vlist = ds_list_create()
with oUnitParent{
    if team = 1{
        ds_list_add(vlist,id)
        }
    }
with oUnitParent{
    if team = 2{
        if aiactivated = 0{
            for(i = 0; i < ds_list_size(vlist); i += 1){
                vunit = ds_list_find_value(vlist,i)
                if ds_grid_get(myinfluencemap,vunit.mx,vunit.my) = 1{
                    facing = sUnitFaceUnit(id,iunit)
                    aiactivated = 1
                    sUnitMakeLightSource(id,10,40)
                    }
                }
            }
        }
    }

sDestroyRangeTiles()
ds_list_destroy(vlist)
if donemakingroom = 1{
    playerturn = vturn
    }
    
