/// @description sAIMakeBarrelScores()
/*This script fills in knockbarrelmap and destroybarrelmap with values that show how good
an idea it is to knock or destroy a barrel. It's repopulated each AI loop.Values in 
knockbarrelmap are a combination of the ID if the tile knocking from, and the barrel 
being knocked. They're in the format string(knocktile.id)+string(barrel.id).
*/

var dirlist,vdir,ptile,btile,bx,by,vtile,vlist,vstring,vscore,vdist,checklist,vx,vy,vrange,vscore;

ds_map_clear(knockbarrelmap)
ds_map_clear(destroybarrelmap)

dirlist = ds_list_create()//this list contains all directions a thing might be knocked from
checklist = ds_list_create()

//fill konckbarrelmap
with oExplodable{
    ds_list_clear(dirlist)
    //check each direction it might be koncked it
    if sIsKnockPossible(id,0){
        ds_list_add(dirlist,0)
        }
    if sIsKnockPossible(id,1){
        ds_list_add(dirlist,1)
        }
    if sIsKnockPossible(id,2){
        ds_list_add(dirlist,2)
        }
    if sIsKnockPossible(id,3){
        ds_list_add(dirlist,3)
        }
    //now check each direction
    while ds_list_size(dirlist) > 0{
        vdir = ds_list_find_value(dirlist,0)
        btile = 0
        switch vdir{
            case 2: bx = mytile.mx; by = mytile.my-1; break;//tile is knocked north from the south tile
            case 3: bx = mytile.mx+1; by = mytile.my; break;
            case 0: bx = mytile.mx; by = mytile.my+1; break;
            case 1: bx = mytile.mx-1; by = mytile.my; break;
            }
        if sIsTileLocationValid(bx,by){
            btile = ds_grid_get(tilegrid,bx,by)
            }
        //we now know that a barrel can be knocked in a particular direction, and that there is a
        //valid tile to knock it from.
        ds_list_delete(dirlist,0)
        if btile != 0{//if there's a valid tile to knock from
            vstring = string(btile.id)+string(id)
            vlist = sMakeKnockRange(id,2,vdir,0)
            ptile = ds_list_find_value(vlist,ds_list_size(vlist)-1)
            vtile = ptile.mytile
            vx = vtile.mx
            vy = vtile.my
            with oKnockRange{
                instance_destroy()
                }
            ds_list_destroy(vlist)
            //now we have the location that the explodable object will explode at if knocked
            ds_list_clear(checklist)
            vrange = exploderange
            with oMapTile{//add all map tiles close enough to checklist
                if (abs(vx-mx)+abs(vy-my)) <= vrange{
                    ds_list_add(checklist,id)
                    }
                }
            //checklist now contains all tiles that will be affected by the blast
            vscore = sAICheckBarrelScores(id,checklist,vtile)
            ds_map_add(oAIControl.knockbarrelmap,vstring,vscore)
            }//end if there's a valid tile
        }//end checking each valid direction
    ds_list_clear(checklist)
    vx = mx
    vy = my
    vrange = exploderange
    with oMapTile{
        if (abs(vx-mx)+abs(vy-my)) <= vrange{
            ds_list_add(checklist,id)
            }
        }
    //now checklist has all tiles surrounding the barrels current location
    vscore = sAICheckBarrelScores(id,checklist,mytile)
    ds_map_add(oAIControl.destroybarrelmap,string(id),vscore)
    }//end with explodable




ds_list_destroy(dirlist)
ds_list_destroy(checklist)

stage += 1
