/// @description sMapActivateAIUnits()
/*This script finds the sight range for all AI units and activates any that can currently
see the player.
*/
var vgrid,vunit,vturn,iunit,vrange;
vgrid = ds_grid_create(roomwidth,roomheight)
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

ds_grid_clear(vgrid,0)
with oUnitParent{
    sDestroyRangeTiles()
    if team = 1{
        sunit = id
        vunit = id
        sFindMoveRange(id)
        
        with oMapTile{
            if cango = 1{
                if occupied = 0 or occupied = vunit{
                    sFindAttackRange(vunit,id)
                    sMakeAttackRange(vunit.weaponhealing)
                    }
                }
            if canattack = 1{
                ds_grid_set(vgrid,mx,my,1)
                }
            if cango = 1{
                ds_grid_set(vgrid,mx,my,1)
                }
            }
        }
    }

with oUnitParent{//any AI units that can be attacked by the player is activated
    if team != 1{
        if ds_grid_get(vgrid,mx,my) = 1{
            aiactivated = 1
            }
        }
    }

ds_grid_destroy(vgrid)
sDestroyRangeTiles()

