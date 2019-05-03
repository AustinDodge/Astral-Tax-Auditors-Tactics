/// @description sMapCorrectTiles

/*this script "corrects" the tiles, starting at grid position 0,<roomheight-1> and moving
back diagonally - each tile makes sure it's no more than 1 lower than the tile diagonally
ahead of it. This should ensure that each tile is visible. It then sends the changes to 
mapheightgrid. When a door tile elevation is changed, all door tiles are set to that 
elevation.
*/

var vtile,ctile,vx,vy,velev,celev,vystart,vxstart,cx,cy;

vx = 0
vy = roomheight-1
vxstart = vx
vystart = vy
while vx < roomwidth and vy >= 0{
    vtile = ds_grid_get(tilegrid,vx,vy)
    cx = vx-1
    cy = vy+1
    //vtile.atile = 1
    if cx >= 0{
        if cy < roomheight{
            ctile = ds_grid_get(tilegrid,cx,cy)
            velev = vtile.elevation
            celev = ctile.elevation
            if velev < celev-1{
                vtile.elevation = celev-1
                if vtile.object_index = oDoorTile{//if it's a door, set all doors of the same color to this elevation
                    with oDoorTile{
                        if door = vtile.door{
                            if elevation < vtile.elevation{
                                elevation = vtile.elevation
                                }else{
                                vtile.elevation = elevation
                                }
                            }
                        }
                    }
                cx = vx-1
                cy = vy
                if cx >= 0{//the next two checks modify the tile immediately to the west and south of vtile, to prevent jaggy clifs
                    ctile = ds_grid_get(tilegrid,cx,cy)
                    if ctile.elevation < celev{
                        ctile.elevation = celev-1
                        }else{
                        vtile.elevation = ctile.elevation
                        }
                    if ctile.object_index = oDoorTile{//if it's a door, set all doors of the same color to this elevation
                        with oDoorTile{
                            if door = ctile.door{
                                if elevation < ctile.elevation{
                                    elevation = ctile.elevation
                                    }else{
                                    ctile.elevation = elevation
                                    }
                                }
                            }
                        }
                    }
                cx = vx
                cy = vy + 1
                if cy < roomheight{
                    ctile = ds_grid_get(tilegrid,cx,cy)
                    if ctile.elevation < celev{
                        ctile.elevation = celev-1
                        }else{
                        vtile.elevation = ctile.elevation
                        }
                    if ctile.object_index = oDoorTile{//if it's a door, set all doors of the same color to this elevation
                        with oDoorTile{
                            if door = ctile.door{
                                if elevation < ctile.elevation{
                                    elevation = ctile.elevation
                                    }else{
                                    ctile.elevation = elevation
                                    }
                                }
                            }
                        }
                    }
                
                }
            }
        }
    vx += 1
    vy += 1
    if vy = roomheight or vx = roomwidth{//if vx,vy is out of the grid bounds
        vystart -= 1//attempt to move up one unit on the y axis 
        if vystart < 0{//if this is out of bounds, that means we should move along the x axis
            vystart = 0
            vxstart += 1
            }
        vx = vxstart
        vy = vystart
        }
    }
    
with oMapTile{//now adjust the map height grid
    ds_grid_set(mapheightgrid,mx,my,elevation)
    }
with oDoorTile{
    ds_grid_set(mapheightgrid,mx,my,elevation)
    }

