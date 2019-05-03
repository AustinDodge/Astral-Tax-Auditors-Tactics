/// @description sUnitDestroyAllUnits()
/*This script doesn't destroy all units, it's the housekeeping script ran by all units
on destruction, doing things that they all need to do - maintaining data structures, that
sort of thing.
*/

var vpos,vunit;

vunit = id
with oTrickShotControl{//destroy oTrickShotControl when the unit it's attached to dies
    if myunit = vunit{
        if instance_exists(myindicator){
            with myindicator{
                instance_destroy()
                }
            }
        instance_destroy()
        }
    }
    
ds_list_destroy(climbedonlist)

if initialized = 1{//this isn't necessary for uninitialized, placeholder units

    //DATA STRUCTURE MAINTAINANCE*********************************************
    if ds_exists(myinfluencemap,ds_type_grid){
        ds_grid_destroy(myinfluencemap)
        }
    if mytile > 0{
        if unitisitem = 0{
            if mytile.occupied = id{//if the unit is actually on the tile
                ds_grid_set(unitposgrid,mx,my,-1)
                mytile.occupied = 0
                }
            }else{
            if ds_grid_get(mapitemgrid,mx,my) = id{
                ds_grid_set(mapitemgrid,mx,my,-1)
                }
            }
        }
    if instance_exists(oKnockControl){
        var vpos;
        vpos = ds_list_find_index(oKnockControl.knockedlist,id)
        if vpos > -1{
            while vpos > -1{
                ds_list_delete(oKnockControl.knockedlist,vpos)
                vpos = ds_list_find_index(oKnockControl.knockedlist,id)
                }
            }
        }
    if sunit = id{
        sunit = 0
        }
    if dunit = id{
        dunit = 0
        }
    if hp <= 0{
        //amidead = 1
        }

    
    if instance_exists(oAIControl){
        if oAIControl.aialldone = 0{
            var vpos;
            vpos = ds_list_find_index(oAIControl.unitlist,id)
            if vpos >= 0{
                ds_list_delete(oAIControl.unitlist,vpos)
                oAIControl.unitlistsize -= 1
                }
            }
        }
        
    if instance_exists(oActionControl){//
        if unitisobject = 0{
            if unitisitem = 0{
                oActionControl.unitkilled = 1
                }
            }
        }
        
    //END GLOBAL DATA DESTRUCTION****************************************************
    if mylightsource > 0{
        with mylightsource{
            instance_destroy()
            }
        }
    //END LIGHT SOURCE DESTRUCTION*****************************************************
    //START TILE SCARRING STUFF
    if unitisitem = 0{
        if mytile.object_index != oPitTile{
            //mytile.scarred = 1
            tile_add(bgtilescars,0,19*myscar,40,19,mytile.x-drawtilexadd,mytile.y-drawtileyadd,mytile.depth-2)
            //debris
            if donemakingroom = 1{
                sUnitMakeDebris(unittype)
                }
            }
        }
        
    //END TILE SCARRING***************************************************************
    }
