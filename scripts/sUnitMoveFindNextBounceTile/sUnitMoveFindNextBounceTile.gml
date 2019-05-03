/// @description sUnitMoveFindNextBounceTile()
/*This script finds the next tile the unit can bounce to and changes the units
knockdir and mytile values to reflect that. If no suitable bounce tile is found, the unit's
knockdir will be set to -1 and the unit will continue bouncing on that tile. It must be called
by the unit that is bouncing.
*/
var bouncefound,ntile,i,velevation,vunit,celevation,canstopbounce,bouncelist,endbouncelist,vx,vy,vcheckelevation;
bouncefound = 0
ntile = 0
lasttile = mytile
switch knockdir{//find the next tile it will be knocked to
    case 0: 
        if mytile.my > 0{
            ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my-1); 
            }else{
            ntile = 0
            }
        ;break;
    case 1: 
        if mytile.mx < roomwidth-1{
            ntile = ds_grid_get(tilegrid,mytile.mx+1,mytile.my); 
            }else{
            ntile = 0
            }
        ;break;
    case 2: 
        if mytile.my < roomheight-1{
            ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my+1); 
            }else{
            ntile = 0
            }
        ;break;
    case 3: 
        if mytile.mx > 0{
            ntile = ds_grid_get(tilegrid,mytile.mx-1,mytile.my); 
            }else{
            ntile = 0
            }
        ;break;
    }//done finding next prospective tile
if ntile > 0{//if the next tile exists
    //velevation = ntile.elevation
    velevation = ds_grid_get(mapheightgrid,ntile.mx,ntile.my)
    if ntile.occupied > 0{
        velevation += (ntile.occupied).myheight
        }
    //if velevation <= mytile.elevation + (mytile.occupied).myheight{
    //add in a check since a unit can bounce off a door tile
    vcheckelevation = ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
    if mytile.occupied > 0{
        vcheckelevation += (mytile.occupied).myheight
        }else{
        vcheckelevation = mytile.elevation
        }
    //if velevation <= ds_grid_get(mapheightgrid,mytile.mx,mytile.my) + (mytile.occupied).myheight{
    if velevation <= vcheckelevation{
        mytile = ntile
        bouncefound = 1
        if ntile.occupied = 0{//if the next tile isn't occupied
            canstopbounce = 1
            }
        }
    nexttile = ntile
    }
if bouncefound = 0{//if the unit did not find an appropriate tile to bounce to
    bouncelist = ds_list_create()
    endbouncelist = ds_list_create()
    for (i = 0; i <= 3; i += 1){
        switch i{
            case 0: 
                if mytile.my > 0{
                    ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my-1); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 1: 
                if mytile.mx < roomwidth-1{
                    ntile = ds_grid_get(tilegrid,mytile.mx+1,mytile.my); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 2: 
                if mytile.my < roomheight-1{
                    ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my+1); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 3: 
                if mytile.mx > 0{
                    ntile = ds_grid_get(tilegrid,mytile.mx-1,mytile.my); 
                    }else{
                    ntile = 0
                    }
                ;break;
            }
        if ntile > 0{//if the next tile exists
            //velevation = ntile.elevation
            velevation = ds_grid_get(mapheightgrid,ntile.mx,ntile.my)
            if ntile.occupied > 0{
                velevation += (ntile.occupied).myheight
                }
            //celevation = mytile.elevation
            celevation = ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
            if mytile.occupied > 0{
                celevation += (mytile.occupied).myheight
                }
            if velevation <= celevation{//if it's a valid tile to bounce to
                ds_list_add(bouncelist,i)//add that bounce direction to the bouncelist
                if ntile.occupied = 0{//if that tile isn't occupied,
                    ds_list_add(endbouncelist,i)//add that direction to the endbouncelist
                    }
                }
            nexttile = ntile
            }
        }//end for loop
    if ds_list_size(bouncelist) > 0{//if there's any possible direction
        ds_list_shuffle(bouncelist)
        knockdir = ds_list_find_value(bouncelist,0)
        switch knockdir{
            case 0: ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my-1); break;
            case 1: ntile = ds_grid_get(tilegrid,mytile.mx+1,mytile.my); break;
            case 2: ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my+1); break;
            case 3: ntile = ds_grid_get(tilegrid,mytile.mx-1,mytile.my); break;
            }
        mytile = ntile
        }else{//if there was no valid bounce direction
        knockdir = -1
        }
    if ds_list_size(endbouncelist) > 0{//next found the endbouncetile, if it exists
        ds_list_shuffle(endbouncelist)
        mytile = lasttile
        knockdir = ds_list_find_value(endbouncelist,0)
        switch knockdir{
            case 0: ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my-1); break;
            case 1: ntile = ds_grid_get(tilegrid,mytile.mx+1,mytile.my); break;
            case 2: ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my+1); break;
            case 3: ntile = ds_grid_get(tilegrid,mytile.mx-1,mytile.my); break;
            }
        mytile = ntile//and go to that tile
        }else{//if there is still no valid bouncetile,
        if ds_list_size(bouncelist) = 0{//and there was never a valid bouncetile in the first place
            knockdir = -1//just bounce in place
            }
        }
    ds_list_destroy(bouncelist)
    ds_list_destroy(endbouncelist)
    }//done finding next prospective tile
if knockaxis > 0{//if the unit is an object that needs to roll along an axis
    //knockdir = -1
    if knockaxis = 1{//if it moves along n-s axis
        if knockdir = 1 or knockdir = 3{
            knockforce = 1
            }else{
            knockforce = 1000
            }
        }
    if knockaxis = 2{//if it mvoes along e-w axis
        if knockdir = 0 or knockdir = 2{
            knockforce = 1
            }else{
            knockforce = 1000
            }
        }
    }
if mytile = undefined{
    show_message("Messed up finding bouncetile!")
    }
if lasttile.depth < mytile.depth{
    depth = lasttile.depth-6
    }else{
    depth = mytile.depth-6
    }
