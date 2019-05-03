/// @description sMakeKnockRange(knockunit,howfar,dir,destroyrange)
/// @param knockunit
/// @param howfar
/// @param dir
/// @param destroyrange
/*This script creates the knock tiles for a unit, to be used for information and picking
a tile to knock to while picking combat. It returns a list of all the tiles made.
*/

var vunit,vdist,vdir,vtile,vrange,ntile,vlist,destroyrange,onknock;

vunit = argument0

vdist = argument1
if ds_list_find_value(vunit.abilitieslist,23) = 1{
    vdist += 1
    }
vdir = argument2
destroyrange = argument3//if oKnockRange should be destroyed afterwards
ntile = 0
onknock = 0//if the unit is being knocked on tis knock axis, keep the knock going forever.
vlist = ds_list_create()//the list of all the knockrange tiles

vtile = vunit.mytile

switch vdir{//the first tile should always be valid - if not, sIsKnockPossible is broken
    case 0: vtile = ds_grid_get(tilegrid,vtile.mx,vtile.my-1); break;
    case 1: vtile = ds_grid_get(tilegrid,vtile.mx+1,vtile.my); break;
    case 2: vtile = ds_grid_get(tilegrid,vtile.mx,vtile.my+1); break;
    case 3: vtile = ds_grid_get(tilegrid,vtile.mx-1,vtile.my); break;
    }
vrange = instance_create(vtile.x,vtile.y,oKnockRange)
vrange.mytile = vtile
vrange.mx = vtile.mx
vrange.my = vtile.my
vrange.depth = vtile.depth-1
vrange.myunit = vunit
vrange.dir = vdir
vrange.dist = vdist
vrange.image_index = vrange.dir
ds_list_add(vlist,vrange)

//don't calculate knocks past a pit tile
if ds_grid_get(tiletypegrid,vtile.mx,vtile.my) = -1{
    vdist = 0
    }
//end the knock if it will run into a unit
if ds_grid_get(unitposgrid,vtile.mx,vtile.my) > 0{
    vdist = 0
    }
if vunit.knockaxis != 0{
    if vunit.knockaxis = 1{//1 is n/s, 2 is e/w
        switch vdir{
            case 0: onknock = 1; break;
            case 1: vdist = 0; break;
            case 2: onknock = 1; break;
            case 3: vdist = 0; break;
            }
        }else{
        switch vdir{
            case 0: vdist = 0; break;
            case 1: onknock = 1; break;
            case 2: vdist = 0; break;
            case 3: onknock = 1; break;
            }
        }
    }
if onknock = 0{
    vdist -= 1
    }

if vdist > 0{//if there's more than one range to make
    while vdist > 0{
        switch vdir{
            case 0: 
                if vtile.my > 0{
                    ntile = ds_grid_get(tilegrid,vtile.mx,vtile.my-1); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 1: 
                if vtile.mx < roomwidth-1{
                    ntile = ds_grid_get(tilegrid,vtile.mx+1,vtile.my); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 2: 
                if vtile.my < roomheight-1{
                    ntile = ds_grid_get(tilegrid,vtile.mx,vtile.my+1); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 3: 
                if vtile.mx > 0{
                    ntile = ds_grid_get(tilegrid,vtile.mx-1,vtile.my); 
                    }else{
                    ntile = 0
                    }
                ;break;
            }
        if ntile > 0{
            if ntile.elevation <= vtile.elevation+1{//if it's not too high
                if ds_grid_get(unitposgrid,ntile.mx,ntile.my) <= 0{
                    vtile = ntile
                    vrange = instance_create(vtile.x,vtile.y,oKnockRange)
                    vrange.mytile = vtile
                    vrange.mx = vtile.mx
                    vrange.my = vtile.my
                    vrange.depth = vtile.depth-1
                    vrange.myunit = vunit
                    vrange.dir = vdir
                    vrange.image_index = vdir
                    vrange.dist = vdist
                    ds_list_add(vlist,vrange)
                    if onknock = 0{
                        vdist -= 1
                        }
                    if ds_grid_get(tiletypegrid,vtile.mx,vtile.my) = -1{
                        vdist = 0
                        }
                    }else{
                    vdist = 0
                    }
                //end the knock if it will run into a unit
                //if ds_grid_get(unitposgrid,vtile.mx,vtile.my) > 0{
                    //vdist = 0
                    //}
                }else{//if it's too high, it's invalid
                vdist = 0
                }
            }else{//if the next tile is invalid for a knock
                vdist = 0
            }
        }
    }
    
vrange.image_index = 4//the farthest knockable tile is the presumed chosed end-point
if destroyrange = 1{
    with oKnockRange{
        instance_destroy()
        }
    }

return vlist;


























