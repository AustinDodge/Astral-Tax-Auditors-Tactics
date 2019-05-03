/// @description sTileFaceTile(facetile,facewhotile)
/// @param facetile
/// @param facewhotile
/*This script returns the direction that a hypothetical unit on one tile would need to face to face a unit on another tile.
It is a copy of sUnitFaceUnit except for line 37, which deals with a situation where two units might be on the same tile. That
situation shouldn't happen with two tiles.
*/
var facer,facewho,cann,cane,cans,canw,vdist,vcompdist,vface,facelist,whichface;


facer = argument0
facewho = argument1
vdist = 0
vcompdist = -1
facelist = ds_list_create()

if facer.occupied > 0{
    whichface = (facer.occupied).facing//start with unit's current facing by default
    }else{
    whichface = 0
    }
//whichface = 0

cann = 0//if each direction the unit can face could be said to be "toward" facewho
cane = 0
cans = 0
canw = 0

if facer.mx > facewho.mx{//if facer is east of facewho
    canw = 1
    ds_list_add(facelist,3)//add west to facelist
    }
if facer.my > facewho.my{//if facer is south of facewho
    cann = 1
    ds_list_add(facelist,0)//add north to facelist)
    }
if facer.mx < facewho.mx{//if facer is west of facewho
    cane = 1
    ds_list_add(facelist,1)//add east to facelist
    }
if facer.my < facewho.my{//if facer if north of facewho
    cans = 1
    ds_list_add(facelist,2)//add south to facelist
    }
/*if facer.mx = facewho.mx and facer.my = facewho.my{ this script doesn't need to be present as this script should never use the same tile as the facer and facee
    switch facer.facing{
        case 0: cann = 1; ds_list_add(facelist,0); break;
        case 1: cane = 1; ds_list_add(facelist,1); break;
        case 2: cans = 1; ds_list_add(facelist,2); break;
        case 3: canw = 1; ds_list_add(facelist,3); break;
        }
    }*/
    
//find the direction in which 
ds_list_shuffle(facelist)//shuffle to randomize ties
while ds_list_size(facelist) > 0{//while there's anything in facelist
    vface = ds_list_find_value(facelist,0)//pick a random possibly valid direction
    ds_list_delete(facelist,0)
    switch vface{//find how far away the unit is in that direction
        case 0: vdist = facer.my - facewho.my  ; break;
        case 1: vdist = facewho.mx - facer.mx; break;
        case 2: vdist = facewho.my - facer.my; break;
        case 3: vdist = facer.mx - facewho.mx; break;
        }
    if vdist > vcompdist{//if facer is farther away in this direction
        vcompdist = vdist
        whichface = vface
        }
    }
ds_list_destroy(facelist)

return whichface;

























    
