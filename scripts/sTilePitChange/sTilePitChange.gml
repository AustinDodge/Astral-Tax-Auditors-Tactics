/// @description sTilePitChange(vtile)
/// @param vtile
/*this script turns the selected tile into a pit tile. It's a modification of 
sTileElevatorChange and is called in sMapMakePits.
*/
var vdir,vtile,j,vlist,vtop,etile,vsize;
vtile = argument0
vtop = vtile.elevation + 1//the top elevation of all the tiles made in this script

//vtile = ds_list_find_value(vlist,j)
ds_grid_set(tiletypegrid,vtile.mx,vtile.my,-1)//set the grid position to a pit
with vtile{
    etile = instance_create(x,y,oPitTile)
    etile.depth = depth
    etile.mx = mx
    etile.my = my
    etile.elevation = elevation
    //etile.lowelevation = elevation
    //etile.topelevation = vtop
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

