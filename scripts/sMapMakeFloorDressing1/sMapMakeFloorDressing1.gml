/// @description sMapMakeFloorDressing1()
/*This script creates floor dressings that cover a single tile.
*/
var vlist,vtile,obstacle1frequency,i,vsize,vdressing,vgrid;


vlist = ds_list_create()
obstacle1frequency = 10//one out of frequency is the chance of dressing on that tile
vgrid = floordressinggrid

with oMapTile{
    if ds_grid_get(vgrid,mx,my) = 0{
        ds_list_add(vlist,id)
        }
    }
//vlist now contains all standard tiles with no obstacles on it
//if maptheme = 0{//debug floor decoration for now
for(i = 0; i < ds_list_size(vlist); i += 1){
    vtile = ds_list_find_value(vlist,i)
    if irandom(obstacle1frequency) = 1{
        //add dressing and remove the tile from eligible list
        vdressing = instance_create(vtile.x,vtile.y,oTileDressing)
        //set the sprite
        switch maptheme{
            case 0: vdressing.sprite_index = sindtiledressing1; break//industrial
            case 1: vdressing.sprite_index = sparktiledressing1; break;//park
            }
        vdressing.image_index = irandom(sprite_get_number(vdressing.sprite_index)-1)
        vtile.mydressing = vdressing
        ds_list_delete(vlist,i)
        i -= 1
        }
    }
//    }




ds_list_destroy(vlist)
