var vitem;

if animating = 1{
    vitem = 0
    if ds_grid_get(mapitemgrid,mx,my) > 0{
        vitem = ds_grid_get(mapitemgrid,mx,my)
        }
    if goingup = 1{//if the elevator is currently animating raising
        y -= 1
        animstep += 1
        if occupied > 0{//if there's a unit on the elevator, move it too
            occupied.y -= 1
            }
        if vitem > 0{
            vitem.y -= 1
            }
        if animstep = elevheight{//gone up one elevation
            elevation += 1
            animstep = 0
            if elevation = topelevation{
                donemoving = 1
                goingup = 0
                animating = 0
                ds_grid_set(mapheightgrid,mx,my,elevation)
                if occupied > 0{
                    occupied.y = y
                    occupied.x = x
                    occupied.elevation = elevation
                    }
                if vitem > 0{
                    vitem.y = y-3
                    vitem.x = x
                    vitem.elevation = elevation
                    }
                }
            }
        }
    if goingdown = 1{//same thing but in reverse
        y += 1
        animstep += 1
        if occupied > 0{
            occupied.y += 1
            }
        if vitem > 0{
            vitem.y += 1
            }
        if animstep = elevheight{//gone down one elevation
            elevation -= 1
            animstep = 0
            if elevation = lowelevation{
                donemoving = 1
                goingdown = 0
                animating = 0
                ds_grid_set(mapheightgrid,mx,my,elevation)
                if occupied > 0{
                    occupied.y = y
                    occupied.x = x
                    occupied.elevation = elevation
                    }
                if vitem > 0{
                    vitem.y = y-3
                    vitem.x = x
                    vitem.elevation = elevation
                    }
                }
            }
        }
    if donemoving = 1{//if the animation is done
        var vpos;
        vpos = ds_list_find_index(oPlayerControl.elevatorlist,id)
        if vpos >= 0{
            ds_list_delete(oPlayerControl.elevatorlist,vpos)
            }
        }
    }

