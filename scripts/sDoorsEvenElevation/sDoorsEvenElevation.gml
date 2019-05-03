/// @description sDoorsEvenElevation()
/*This script evens the elevation between doors of the same color. First they
check if there is any elevation that more tiles share than another - if so, all tiles are
set to that elevation. If not, the tiles randomly get the highest, lowest, or average
elevation. If the doors aren't at the same elevation at the end, 
*/

var redelev,yellowelev,greenelev,blueelev,vmap,vval,tval,setelev,rednewe,yellownewe,greennewe,bluenewe,vlist,
redlist,yellowlist,greenlist,bluelist,vlist,vrand,velev;
redelev = ds_map_create()
yellowelev = ds_map_create()
greenelev = ds_map_create()
blueelev = ds_map_create()
rednewe = -1//new elevation of all door tiles of that color
yellownewe = -1
greennewe = -1
bluenewe = -1
redlist = ds_list_create()
yellowlist = ds_list_create()
greenlist = ds_list_create()
bluelist = ds_list_create()


with oDoorTile{
    switch door{
        case 1: vmap = redelev; break;
        case 2: vmap = yellowelev; break;
        case 3: vmap = greenelev; break;
        case 4: vmap = blueelev; break;
        }
    ds_map_add(vmap,elevation,1)
    }

with oDoorTile{
    switch door{
        case 1: vmap = redelev; break;
        case 2: vmap = yellowelev; break;
        case 3: vmap = greenelev; break;
        case 4: vmap = blueelev; break;
        }
    vval = 1
    if door = 1{
        tval = ds_map_find_value(vmap,elevation)
        if tval > vval{
            vval = tval
            rednewe = elevation
            }
        }
    vval = 1
    if door = 2{
        tval = ds_map_find_value(vmap,elevation)
        if tval > vval{
            vval = tval
            yellownewe = elevation
            }
        }
    vval = 1
    if door = 3{
        tval = ds_map_find_value(vmap,elevation)
        if tval > vval{
            vval = tval
            greennewe = elevation
            }
        }
    vval = 1
    if door = 4{
        tval = ds_map_find_value(vmap,elevation)
        if tval > vval{
            vval = tval
            bluenewe = elevation
            }
        }
    }
if reddoor = 0{
    rednewe = -2//if the door doesn't exist, make sure there's no attempt to correct it
    }
if yellowdoor = 0{
    yellownewe = -2
    }
if greendoor = 0{
    greennewe = -2
    }
if bluedoor = 0{
    bluenewe = -2
    }

with oDoorTile{
    if door = 1{
        if rednewe = -1{
            ds_list_add(redlist,elevation)
            }
        }
    if door = 2{
        if yellownewe = -1{
            ds_list_add(yellowlist,elevation)
            }
        }
    if door = 3{
        if greennewe = -1{
            ds_list_add(greenlist,elevation)
            }
        }
    if door = 4{
        if bluenewe = -1{
            ds_list_add(bluelist,elevation)
            }
        }
    }
velev = 0
var v1,v2,v3,v4,v5,v6;


if rednewe = -1{//if a majority elevation hasn't been found, move on to other methods
    vlist = redlist
    ds_list_sort(vlist,0)
    vrand = irandom(2)
    if vrand = 0{
        velev = ds_list_find_value(vlist,0)
        }
    if vrand = 1{
        velev = ds_list_find_value(vlist,ds_list_size(vlist)-1)
        }
    if vrand = 2{
        v1 = ds_list_find_value(vlist,0)
        v2 = ds_list_find_value(vlist,1)
        v3 = ds_list_find_value(vlist,2)
        v4 = ds_list_find_value(vlist,3)
        v5 = ds_list_find_value(vlist,4)
        v6 = ds_list_find_value(vlist,5)
        velev = round(mean(v1,v2,v3,v4,v5,v6))
        }
    rednewe = velev
    }
if yellownewe = -1{
    vlist = yellowlist
    ds_list_sort(vlist,0)
    vrand = irandom(2)
    if vrand = 0{
        velev = ds_list_find_value(vlist,0)
        }
    if vrand = 1{
        velev = ds_list_find_value(vlist,ds_list_size(vlist)-1)
        }
    if vrand = 2{
        v1 = ds_list_find_value(vlist,0)
        v2 = ds_list_find_value(vlist,1)
        v3 = ds_list_find_value(vlist,2)
        v4 = ds_list_find_value(vlist,3)
        v5 = ds_list_find_value(vlist,4)
        v6 = ds_list_find_value(vlist,5)
        velev = round(mean(v1,v2,v3,v4,v5,v6))
        }
    yellownewe = velev
    }
if greennewe = -1{
    vlist = greenlist
    ds_list_sort(vlist,0)
    vrand = irandom(2)
    if vrand = 0{
        velev = ds_list_find_value(vlist,0)
        }
    if vrand = 1{
        velev = ds_list_find_value(vlist,ds_list_size(vlist)-1)
        }
    if vrand = 2{
        v1 = ds_list_find_value(vlist,0)
        v2 = ds_list_find_value(vlist,1)
        v3 = ds_list_find_value(vlist,2)
        v4 = ds_list_find_value(vlist,3)
        v5 = ds_list_find_value(vlist,4)
        v6 = ds_list_find_value(vlist,5)
        velev = round(mean(v1,v2,v3,v4,v5,v6))
        }
    greennewe = velev
    }
if bluenewe = -1{
    vlist = bluelist
    ds_list_sort(vlist,0)
    vrand = irandom(2)
    if vrand = 0{
        velev = ds_list_find_value(vlist,0)
        }
    if vrand = 1{
        velev = ds_list_find_value(vlist,ds_list_size(vlist)-1)
        }
    if vrand = 2{
        v1 = ds_list_find_value(vlist,0)
        v2 = ds_list_find_value(vlist,1)
        v3 = ds_list_find_value(vlist,2)
        v4 = ds_list_find_value(vlist,3)
        v5 = ds_list_find_value(vlist,4)
        v6 = ds_list_find_value(vlist,5)
        velev = round(mean(v1,v2,v3,v4,v5,v6))
        }
    bluenewe = velev
    }
    
with oDoorTile{//give all doors their new elevation
    switch door{
        case 1: elevation = rednewe; break;
        case 2: elevation = yellownewe; break;
        case 3: elevation = greennewe; break;
        case 4: elevation = bluenewe; break;
        }
    ds_grid_set(mapheightgrid,mx,my,elevation)
    }

ds_map_destroy(redelev)//destroy all data structures made
ds_map_destroy(yellowelev)
ds_map_destroy(greenelev)
ds_map_destroy(blueelev)
ds_list_destroy(redlist)
ds_list_destroy(yellowlist)
ds_list_destroy(greenlist)
ds_list_destroy(bluelist)

