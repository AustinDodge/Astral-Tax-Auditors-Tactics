var vy,vx,vtile,gx,gtile,vdepth,velev,vunit;
vx = 100000
gx = 100000
vy = 100000
vtile = oDoorTile
vdepth = 100000

if tramanimin = 1{
    with oDoorTile{
        if door = entrydoor{
            ds_list_add(oTramAnimControl.xstartlist,x)
            ds_list_add(oTramAnimControl.ystartlist,y)
            ds_list_add(oTramAnimControl.tilelist,id)
            vtile = id
            if occupied > 0{
                ds_list_add(oTramAnimControl.unitlist,occupied)
                }
            }
        }
    velev = vtile.elevation
    fy = (velev-3)*elevheight//the y position that the fade from black will start
    dy = velev*elevheight//the start y position
    for(i = 0; i < ds_list_size(tilelist); i += 1){//now set them to the start elevation
        vtile = ds_list_find_value(tilelist,i)
        vtile.y += dy
        vtile.depth += 2
        vtile.fallfadestage = 6
        vunit = vtile.occupied
        
        if vunit > 0{
            vunit.y += dy
            vunit.depth = vtile.depth-2
            vunit.fallfadestage = 6
            vunit.fadinginblack = 1
            
            //vunit.depth += 2
            }
        }
    myfadestage = 6
    }
    

if tramanimout = 1{
    with oDoorTile{
        if door = exitdoor{
            ds_list_add(oTramAnimControl.xstartlist,id)
            ds_list_add(oTramAnimControl.ystartlist,id)
            ds_list_add(oTramAnimControl.tilelist,id)
            vtile = id
            vtile.depth += 2
            if occupied > 0{
                //occupied.depth = depth-1
                ds_list_add(oTramAnimControl.unitlist,occupied)
                }
            dy = vtile.y
            }
        }
    for (i = 0; i < ds_list_size(tilelist); i += 1){
        vtile = ds_list_find_value(tilelist,i)
        vunit = vtile.occupied
        vtile.fallfadestage = 0
        if vunit > 0{
            vunit.fallfadestage = 0
            vunit.fadingoutblack = 1
            vunit.depth += 2
            }
        }
    targety = dy-160
    fy = dy-30
    myfadestage = 0
    //all units and doors start at the correct position for exiting the room
    }

