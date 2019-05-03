/// @description sCheckTileElevatorNeighbor(vtile,vtop)
/// @param vtile
/// @param vtop
/*this script is ran ins sTIleElevatorChange and sTileElevatorCheck neighbor vtile to see
if that neighbor is an acceptable candidate for an elevator. It returns 1 for a candidate
and 0 for invalid
*/
var vtile,vtop,j,ctile,vlist;
vtile = argument0
vtop = argument1//the elevation the elevator will be going to
vlist = ds_list_create()
j = 0
with vtile{
    if n > 0{
        if ds_grid_get(tiletypegrid,n.mx,n.my) = 0{
            ds_list_add(vlist,n)
            }
        }
    if e > 0{
        if ds_grid_get(tiletypegrid,e.mx,e.my) = 0{
            ds_list_add(vlist,e)
            }
        }
    if s > 0{
        if ds_grid_get(tiletypegrid,s.mx,s.my) = 0{
            ds_list_add(vlist,s)
            }
        }
    if w > 0{
        if ds_grid_get(tiletypegrid,w.mx,w.my) = 0{
            ds_list_add(vlist,w)
            }
        }
    if ds_list_size(vlist) > 0{
        while ds_list_size(vlist) > 0{
            ctile = ds_list_find_value(vlist,0)
            ds_list_delete(vlist,0)
            if ctile.elevation >= vtop - 1{//an elevator needs to go to a higher tile to ensure it doesn't obscure any tiles visually
                j = 1
                }
            }
        }
    }
return j;
