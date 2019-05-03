/// @description sMapChangeTileCatwalk()
/*This script changes all tiles with an image index 4 to a catwalk-type tile. Catwalks draw much differently
from regular map tiles.
*/

var vtile,nneighbor,eneighbor,sneighbor,wneighbor,nstring;
with oMapTile{
    if object_index != oElevatorTile{
        if ds_grid_get(oMapControl.tileindexgrid,mx,my) >= 3{
            etile = instance_create(x,y,oCatwalkTile)
            etile.depth = depth
            etile.mx = mx
            etile.my = my
            etile.elevation = elevation
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
            instance_destroy()
            }
        }
    }

with oCatwalkTile{
    switch maptheme{
        case 0: sprite_index = smetalcatwalk1; break;
        case 1: sprite_index = swoodcatwalk1; break;
        }
    nneighbor = 0
    eneighbor = 0
    sneighbor = 0
    wneighbor = 0
    if n > 0{
        if n.object_index = oCatwalkTile{
            nneighbor = 1
            }
        //if n.object_index = oMapTile or n.object_index = oDoorTile or n.object_index = oElevatorTile{
        if n.object_index != oCatwalkTile and n.object_index != oPitTile{
            shadown = 1
            }
        }else{//cast a shadow on the big wall
        shadown = 1
        }
    if e > 0{
        if e.object_index = oCatwalkTile{
            eneighbor = 1
            }
        //if e.object_index = oMapTile or e.object_index = oDoorTile or e.object_index = oElevatorTile{
        if e.object_index != oCatwalkTile and e.object_index != oPitTile{
            shadowe = 1
            }
        }else{
        shadowe = 1
        }
    if s > 0{
        if s.object_index = oCatwalkTile{
            sneighbor = 1
            }
        }
    if w > 0{
        if w.object_index = oCatwalkTile{
            wneighbor = 1
            }
        }
    image_index = 2
    nstring = string(nneighbor) + string(eneighbor) + string(sneighbor) + string(wneighbor)
    if nstring = "1010" or nstring = "1000" or nstring = "0010"{
        image_index = 1
        }
    if nstring = "0101" or nstring = "0100" or nstring = "0001"{
        image_index = 0
        }
    }







































