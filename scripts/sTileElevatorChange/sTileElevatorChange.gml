/// @description sTileElevatorChange(vtile)
/// @param vtile
/*this script turns the selected tile and any neighbors that can be changed into an
elevator tile. It's a modification of sTileElevatorCheck and is ran by sMapPlaceElevators
*/
var vdir,vtile,j,ctile,vlist,vtop,etile,vsize,clist;
vtile = argument0
vlist = ds_list_create()
j = 1
vtop = vtile.elevation + 1//the top elevation of all the tiles made in this script
ds_list_add(vlist,vtile)
with vtile{

    vdir = 0//the direction to check for adjacent tiles in. 0 is e-w, 1 is n-s
    
    if elevatordirection = 0{//if there was no direction set by sMapPlaceElevators
        if n > 0{
            if n.elevation > vtop{
                vtop = n.elevation
                vdir = 0
                }
            }
        if e > 0{
            if e.elevation > vtop{
                vtop = e.elevation
                vdir = 1
                }
            }
        if s > 0{
            if s.elevation > vtop{
                vtop = s.elevation
                vdir = 0
                }
            }
        if w > 0{
            if w.elevation > vtop{
                vtop = w.elevation
                vdir = 1
                }
            }
        }else{
        switch elevatordirection{
            case 1: vtop = n.elevation; vdir = 0; break;
            case 2: vtop = e.elevation; vdir = 1; break;
            case 3: vtop = s.elevation; vdir = 0; break;
            case 4: vtop = w.elevation; vdir = 1; break;
            }
        }
    if vdir = 0{//if checking e/w
        if e > 0{
            ctile = e
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,vtop) = 1{
                        if irandom(1) = 0{
                            ds_list_add(vlist,ctile)
                            }
                        }
                    }
                }
            }
        if w > 0{
            ctile = w
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,vtop) = 1{
                        if irandom(1) = 0{
                            ds_list_add(vlist,ctile)
                            }
                        }
                    }
                }
            }
        }else{//if checking n/s
        if n > 0{
            ctile = n
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,vtop) = 1{
                        if irandom(1) = 0{
                            ds_list_add(vlist,ctile)
                            }
                        }
                    }
                }
            }
        if s > 0{
            ctile = s
            if ctile.elevation = elevation{
                if ds_grid_get(tiletypegrid,ctile.mx,ctile.my) = 0{
                    if sCheckTileElevatorNeighbor(ctile,vtop) = 1{
                        if irandom(1) = 0{
                            ds_list_add(vlist,ctile)
                            }
                        }
                    }
                }
            }
        }
    }
vsize = ds_list_size(vlist)
if ds_list_size(vlist) > 0{
    for(j = 0 ; j < ds_list_size(vlist); j += 1){
        ctile = ds_list_find_value(vlist,j)
        ds_grid_set(tiletypegrid,ctile.mx,ctile.my,5)//set the grid position to an elevator
        with ctile{
            etile = instance_create(x,y,oElevatorTile)
            etile.depth = depth
            etile.mx = mx
            etile.my = my
            etile.elevation = elevation
            etile.lowelevation = elevation
            etile.topelevation = vtop
            etile.n = n//set the neighbor tiles
            if n > 0{
                n.s = etile
                }
            etile.e = e
            if e > 0{
                e.w = etile
                }
            etile.s = s
            if s > 0{
                s.n = etile
                }
            etile.w = w
            if w > 0{
                w.e = etile
                }
            ds_grid_set(tilegrid,mx,my,etile)
            //correct in case this tile was the starttile
            if oMapControl.vstarttile = id{
                oMapControl.vstarttile = etile
                }
            instance_destroy()
            }
        }
    sTileFindNeighbors()
    }
ds_list_destroy(vlist)
