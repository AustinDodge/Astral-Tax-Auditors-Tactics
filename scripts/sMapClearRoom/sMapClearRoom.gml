/// @description sMapClearRoom()
/*This script deletes all objects, tiles, units, and everything else from the room
in preparation for putting down the next one. Save anything you want to keep before calling
it!
*/
with oItemParent{
    //destroy the lists for any loose items on the map
    if ds_exists(mydata,ds_type_list){
        ds_list_destroy(mydata)
        }
    }
with oUnitParent{
    explodable = 0
    instance_destroy()
    }
with oKOAuditor{
    instance_destroy()
    }
with oCorpseAuditor{
    instance_destroy()
    }
tile_layer_delete(-100)//front tile wall depth
with oMapTile{
    tile_layer_delete(depth+1)//walls to south and west
    tile_layer_delete(depth+2)
    tile_layer_delete(depth+3)
    tile_layer_delete(depth-1)//BG tile decoration
    tile_layer_delete(depth-2)//tile scar(currently sprite in draw event)
    tile_layer_delete(depth-3)//debris
    tile_layer_delete(depth-4)
    tile_layer_delete(depth-5)
    tile_layer_delete(depth-6)//FG tile decoration
    instance_destroy()
    }
with oObstacle{
    instance_destroy()
    }
with oButton{
    instance_destroy()
    }
with oDoorTerminal{
    instance_destroy()
    }
with oRoomDecorationParent{
    instance_destroy()
    }
with oTramAnimControl{
    instance_destroy()
    }
with oTileDressing{
    instance_destroy()
    }
oTileCursor.mytile = 0
tile_layer_delete(15000)//delete the big wall tiles
