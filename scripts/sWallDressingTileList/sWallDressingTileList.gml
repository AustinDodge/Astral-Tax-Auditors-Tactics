/// @description sWallDressingTileList(height,width,mingrounddist,maxgrounddist,minceildist,maxceildist,bigwallchance,tilewallchance,pitchance,southorwest,overobstacles)
/// @param height
/// @param width
/// @param mingrounddist
/// @param maxgrounddist
/// @param minceildist
/// @param maxceildist
/// @param bigwallchance
/// @param tilewallchance
/// @param pitchance
/// @param southorwest
/// @param overobstacles

/*This script generates and returns a list of all tiles that meet the eligibility arguments, including chance of being returned,
for use in placing wall set dressing. The chances to be returned are only checked against otherwise eligible tiles.
*/

var vheight,vwidth,mingrounddist,maxgrounddist,minceildist,maxceildist,bigwallchance,tilewallchance,pitchance,vx,vy,px,py,i,
bigwalllist,tilewalllist,pitwalllist,vlist,vtile,velevation,vup,vmaxelevation,southorwest,j,vgrid,piteligible,overobstacles,vcell,
gx,gy,canadd,i,c,dgrid,gcell,px,py,vobject,dlist,z,w,p;

vheight = argument0//the minimum required height(in cells)
vwidth = argument1//the minimum required width(in cells)
mingrounddist = argument2//the minimum distance from the ground tile
maxgrounddist = argument3//the maximum distance from the ground tile
minceildist = argument4//the minimum distance from the "ceiling", the height of the bigwall.
maxceildist = argument5//the maximum distance from the "ceiling"
bigwallchance = argument6//the chance that a bigwall will be eligible
tilewallchance = argument7//the chance that a tilewall will be eligible
pitchance = argument8//the chance that a wall over a pit will be eligible
southorwest = argument9//whether we should look for south-facing(0) or west-facing(1) walls
overobstacles = argument10//if the dressing can be put behind obstacles or must be in cells above them

if maxgrounddist = 0{
    maxgrounddist = 1000
    }
if maxceildist = 0{
    maxceildist = 1000
    }

bigwalllist = ds_list_create()//all eligible bigwall tiles will be added to this
tilewalllist = ds_list_create()//same with wall tiles
pitwalllist = ds_list_create()//same with pits

dlist = ds_list_create()//every tile in the previous lists will have a chance to be placed into this list, which will be returned by this script

vmaxelevation = ceil(maxelevation/4)//get the height of the bigwall
vmaxelevation += 2
vmaxelevation *= 4//convert that to regular wall units

minceildist = vmaxelevation - minceildist
maxceildist = vmaxelevation - maxceildist


vx = 0
vy = 0
if southorwest = 0{
    z = vy
    w = ds_grid_height(tilegrid)
    }else{
    z = vx
    w = ds_grid_width(tilegrid)
    }
while z < w{
    vtile = ds_grid_get(tilegrid,vx,vy)
    vup = 0
    if vtile.object_index != oPitTile{
        velevation = vtile.elevation
        }else{
        velevation = 1
        }
    py = velevation
    if southorwest = 0{
        vgrid = ds_list_find_value(tilewallsetslist,vy)
        }else{
        vgrid = ds_list_find_value(tilewallsetwlist,vx)
        }
    j = 0
    //now go up the grid and see if there are eligible spaces on the wall
    while py < ds_grid_height(vgrid){
        if southorwest = 0{
            gx = vx//on south facing walls, the tile's mx is equal to its wall grid's gx
            gy = py
            }else{
            gx = vy//on west facing walls, it's the tile's my that's the wall's gy
            gy = py
            }
        if gx >=  ds_grid_width(vgrid) or gy >= ds_grid_height(vgrid){
            p = 0//stopping point for grid out-of-bounds to see what's going on
            }
        vcell = ds_grid_get(vgrid,gx,gy)
        if gx >=  ds_grid_width(vgrid) or gy >= ds_grid_height(vgrid){
            p = 0//stopping point for grid out-of-bounds to see what's going on
            }
        canadd = 0
        j += 1
        if vcell = 1{//if the cell is unoccupied
            if j >= vheight{//if the cell has enough free space around it
                if vup-vheight >= mingrounddist{//if the cell is at or above the minimum distance from the ground
                    if vup-vheight <= maxgrounddist{//if the cell is at or below the maximum distance from the ground
                        if gy >= maxceildist{//if the cell is higher than the minimum ceiling distance
                            if gy < minceildist{//if the cell is lower than the minimum ceiling distance
                                canadd = 1
                                }
                            }
                        }
                    }
                }
            //still in vcell if statement
            if vtile.object_index = oElevatorTile{
                canadd = 0
                }
            if canadd = 1{
                if vwidth > 1{//if the tile requires width, check that here
                    i = 0
                    if southorwest = 0{
                        if gx < ds_grid_width(vgrid)+vwidth{//if there are enough cells left to put the tile down
                            for (i = 0; i < vwidth; i += 1){
                                py = 0
                                while py < vheight{
                                    gcell = ds_grid_get(vgrid,gx+i,gy-py)
                                    if gcell != 1{
                                        canadd = 0
                                        }
                                    py += 1
                                    }
                                }
                            }else{//if there aren't enough tiles left, it's not eligible
                            canadd = 0
                            }                            
                        }
                    }//end vwidth if statement
                if overobstacles = 1{//if the dressing must be put above obstacles
                    if vtile.myobject > 0{
                        vobject = vtile.myobject
                        if vup-vheight <= vobject.obstacleheight{
                            canadd = 0
                            j = 0
                            }
                        }
                    }
                
                    
                if canadd = 1{//double-check canadd since it might have changed
                    j = 0
                    //we now know that the wall cells fit all distance eligibilities, add it to the appropriate list
                    vlist = tilewalllist
                    if southorwest = 0{
                        if vy = 0{
                            vlist = bigwalllist
                            }
                        }else{
                        if vx = ds_grid_width(tilegrid)-1{
                            vlist = bigwalllist
                            }
                        }
                    if vtile.object_index = oPitTile{
                        vlist = pitwalllist
                        }
                    ds_list_add(vlist,vtile)
                    }
                }//end canadd = 1
            }else{//end if vcell = 1
            j = 0
            }
        //if vcell = -1{//-1 means there are no more walls above it, abort operations
        //    py = ds_grid_height(vgrid)
        //    }
        py += 1
        vup += 1
        }//end while py < grid height
    //we've gone up a single column in a single grid. Just a few hundred more to go!
    switch southorwest{
        case 0:
            vx += 1
            if vx = ds_grid_width(tilegrid){
                vx = 0
                vy += 1
                }
            z = vy
            w = ds_grid_height(tilegrid)
            ; break;
        case 1:
            vy += 1
            if vy = ds_grid_height(tilegrid){
                vy = 0
                vx += 1
                }
            z = vx
            w = ds_grid_width(tilegrid)
            ; break;
        }
    }//end major loop
    
//now every eligible tile has been added to the appropriate sub-list, shuffle the lists and add to the main list based on the probability
ds_list_shuffle(tilewalllist)
ds_list_shuffle(bigwalllist)
ds_list_shuffle(pitwalllist)
for(i = 0; i < ds_list_size(pitwalllist); i += 1){
    c = ds_list_find_value(pitwalllist,i)
    j = irandom(100)
    if j < pitchance{
        ds_list_add(dlist,c)
        }
    }
for(i = 0; i < ds_list_size(tilewalllist); i += 1){
    c = ds_list_find_value(tilewalllist,i)
    j = irandom(100)
    if j < tilewallchance{
        ds_list_add(dlist,c)
        }
    }
for(i = 0; i < ds_list_size(bigwalllist); i += 1){
    c = ds_list_find_value(bigwalllist,i)
    j = irandom(100)
    if j < bigwallchance{
        ds_list_add(dlist,c)
        }
    }
var vsize;
vsize = ds_list_size(dlist)
    
ds_list_destroy(bigwalllist)
ds_list_destroy(tilewalllist)
ds_list_destroy(pitwalllist)

return dlist;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

