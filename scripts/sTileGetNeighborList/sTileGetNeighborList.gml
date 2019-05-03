/// @description sTileGetNeighborList(vtile)
/// @param vtile
/*This script returns a list of all a tile's neighboring tiles. It doesn't distinguish
by type, only if those neighbors exist. If the tile is on an edge or corner, it can return
a list smaller than 3. Initial order is always N,E,S,W
*/
var vtile,vlist;

vtile = argument0
vlist = ds_list_create()

if vtile.n > 0{
    ds_list_add(vlist,vtile.n)
    }
if vtile.e > 0{
    ds_list_add(vlist,vtile.e)
    }
if vtile.s > 0{
    ds_list_add(vlist,vtile.s)
    }
if vtile.w > 0{
    ds_list_add(vlist,vtile.w)
    }
    
return vlist;
