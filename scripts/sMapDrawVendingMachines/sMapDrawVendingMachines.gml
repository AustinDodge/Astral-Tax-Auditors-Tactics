/// @description sMapDrawVendingMachines()
/*This script takes the previously located door terminals and puts them on the map.
*/
var vs,vw,vdir,vmachine,vtile,vheight;
with oMapTile{
    if ds_grid_get(tiletypegrid,mx,my) = 8{//all vending machine terminals
        vs = 0
        vw = 0
        vheight = ds_grid_get(mapheightgrid,mx,my)
        if sIsTileLocationValid(mx,my-1) = 0{//if there is no north tile, the north wall is the big wall, face south
            vs  = 1
            }else{
            if ds_grid_get(mapheightgrid,mx,my-1) - vheight >= 3{//if the tile behind is at least 3 verts higher, face south
                vs = 1
                }
            }
        if sIsTileLocationValid(mx+1,my) = 0{//if there is no east tiles, east wall is big wall, face west
            vw = 1
            }else{
            if ds_grid_get(mapheightgrid,mx+1,my) - vheight >= 3{//if the tile behing is at least 3 verts higher, face west
                vw= 1
                }
            }
        if vs = 1{
            vdir = 2
            }
        if vw = 1{
            vdir = 3
            }
        if vs = 1 and vw = 1{//if both south and west are valid
            switch irandom(1){
                case 0: vdir = 2; break;
                case 1: vdir = 3; break;
                }
            }
        //we now have the proper direction for the vending machine to face
        if vdir > 0{//make sure nothing went wrong!
            vtile = id
            vmachine = instance_create(vtile.x,vtile.y,oVendingMachine)
            vmachine.depth = vtile.depth-4
            switch vdir{
                case 2: vmachine.sprite_index = spvendor1s; break;
                case 3: vmachine.sprite_index = spvendor1w; break;
                }
            //vterminal.depth = -10000
            vmachine.mytile = vtile
            vmachine.mx = vtile.mx
            vmachine.my = vtile.my
            vmachine.inventorylist = sVendorMakeInventoryList(levelnumber,0)
            //vtile.elevation += vterminal.obstacleheight
            vtile.myobject = vmachine
            //ds_grid_set(mapheightgrid,vtile.mx,vtile.my,vtile.elevation)
            }
        }
    }
