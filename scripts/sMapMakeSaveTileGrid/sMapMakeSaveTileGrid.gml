/// @description sMapMakeSaveTileGrid(howmanypaths)
/// @param howmanypaths
/*This script makes a path that includes all tiles on keytilelist, although not in any
particular order. That path is saved on savetilelist and is used to guarantee that the key
parts of the level can be accessed. A random tile on keytilelist is picked and a path is
found from that tile to every other key tile, with existing paths being easier to traverse.
We do this howmanypaths number of times, allowing for webs of paths in catwalk type maps
*/
var howmanypaths,donelist,starttile,endtile,vtile,i,startdir;
howmanypaths = argument0

//ds_grid_clear(savetilegrid,0)//clear to 0, set save tiles to 1 so they won't be deleted
with oDoorTile{
    ds_grid_set(savetilegrid,mx,my,1)
    }

if howmanypaths > ds_list_size(keytilelist){
    howmanypaths = ds_list_size(keytilelist)
    }
donelist = ds_list_create()//the tiles we've already used as a path starter
ds_list_shuffle(keytilelist)
starttile = ds_list_find_value(keytilelist,0)
while howmanypaths > 0{
    howmanypaths -= 1
    while ds_list_find_index(donelist,starttile) >= 0{//look for a starttile until we get one that hasn't already been used
        ds_list_shuffle(keytilelist)
        starttile = ds_list_find_value(keytilelist,0)
        }
    ds_list_add(donelist,starttile)
    for(i = 0; i < ds_list_size(keytilelist); i += 1){
        vtile = ds_list_find_value(keytilelist,i)
        if !object_is_ancestor(vtile.object_index,oAllMapTiles){
            show_message("!!!!!!!vtile isn't a tile! Room seed is "+string(worldseed))
            }
        if vtile != starttile{
            //find the startdir
            startdir = irandom(3)
            if vtile = entrydoor{
                switch entrydoor{
                    case 1: startdir = 2; break;//start at the north door, startdoor is 1, start direction is south
                    case 2: startdir = 3; break;//start at east door, startdoor is 2, startdirection is west
                    case 3: startdir = 0; break;//start at south door, startdoor is 3, startdirection is north
                    case 4: startdir = 1; break;//start at west door, startdoor is 4, startdirection is east
                    }
                }
            if vtile = exitdoor{
                switch exitdoor{
                    case 1: startdir = 2; break;//start at the north door, exitdoor is 1, start direction is south
                    case 2: startdir = 3; break;//start at east door, exitdoor is 2, startdirection is west
                    case 3: startdir = 0; break;//start at south door, exitdoor is 3, startdirection is north
                    case 4: startdir = 1; break;//start at west door, exitdoor is 4, startdirection is east
                    }
                }
            sAFindMapPath(starttile,vtile,0,10,startdir)
            endtile = vtile
            while vtile != starttile{
                with vtile{
                    ds_grid_set(savetilegrid,mx,my,1)
                    if maptype = 1{//if it's a catwalk map, paths are catwalks
                        if vtile.door = 0{
                            ds_grid_set(oMapControl.tileindexgrid,mx,my,3)
                            }
                        }
                    }
                vtile = vtile.parent
                if vtile = 0{
                    show_message("Vtile is 0! Uh oh!")
                    vtile = starttile
                    }
                }
            }//don't do any of this if vtile and starttile are the same
        }//end for loop
    }
                
ds_list_destroy(donelist)







