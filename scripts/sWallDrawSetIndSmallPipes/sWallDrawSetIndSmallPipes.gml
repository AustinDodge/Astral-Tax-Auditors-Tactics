/// @description sWallIndBigPipes()
/*This script places the big pipes on the walls in the level.
*/

var vheight,vwidth,mingrounddist,maxgrounddist,minceildist,maxceildist,bigwallchance,tilewallchance,pitchance,vx,vy,px,py,i,
bigwalllist,tilewalllist,pitwalllist,vlist,vtile,velevation,vup,vmaxelevation,southorwest,j,vgrid,piteligible,overobstacles,vcell,
gx,gy,canadd,i,c,dgrid,gcell,px,py,vobject,howmanytimes,omaxgrounddist,omaxceildist,ominceildist,dx,dy,w,z,ylist,ay;

vheight = 1//the minimum required height(in cells)
vwidth = 1//the minimum required width(in cells)
mingrounddist = 0//the minimum distance from the ground tile
maxgrounddist = 0//the maximum distance from the ground tile
minceildist = 2//the minimum distance from the "ceiling", the height of the bigwall.
maxceildist = 0//the maximum distance from the "ceiling"
bigwallchance = 10//the chance that a bigwall will be eligible
tilewallchance = 20//the chance that a tilewall will be eligible
pitchance = 10//the chance that a wall over a pit will be eligible
overobstacles = 0//if the dressing can be put behind obstacles or must be in cells above them

omaxgrounddist = maxgrounddist
omaxceildist = maxceildist
ominceildist = minceildist






    
howmanytimes = 0

southorwest = irandom(1)
ylist = ds_list_create()



while howmanytimes < 2{
    
    maxgrounddist = omaxgrounddist
    maxceildist = omaxceildist
    minceildist = ominceildist
    
    vlist = sWallDressingTileList(vheight,vwidth,mingrounddist,maxgrounddist,minceildist,maxceildist,bigwallchance,tilewallchance,pitchance,southorwest,overobstacles)
    
    
    
    if maxgrounddist = 0{
        maxgrounddist = 1000
        }
    if maxceildist = 0{
        maxceildist = 1000
        }
    
    vmaxelevation = ceil(maxelevation/4)//get the height of the bigwall
    vmaxelevation += 2
    vmaxelevation *= 4//convert that to regular wall units
    
    minceildist = vmaxelevation - minceildist
    maxceildist = vmaxelevation - maxceildist
        
    
    
    vx = 0
    vy = 0
    var vsize;
    vsize = ds_list_size(vlist)
    while ds_list_size(vlist) > 0{
        vtile = ds_list_find_value(vlist,0)
        ds_list_delete(vlist,0)
        vx = vtile.mx
        vy = vtile.my
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
        ds_list_clear(ylist)
        //now go up the grid and see if there are eligible spaces on the wall
        while py < ds_grid_height(vgrid){
            if southorwest = 0{
                gx = vx//on south facing walls, the tile's mx is equal to its wall grid's gx
                gy = py
                }else{
                gx = vy//on west facing walls, it's the tile's my that's the wall's gy
                gy = py
                }
            vcell = ds_grid_get(vgrid,gx,gy)
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
                        //we've confirmed that the wall cell fits all distance and size eligibilities, save the position
                        ds_list_add(ylist,py)
                                                
                        //py = ds_grid_height(vgrid)
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
        //we now have a list of each cell on the wall that can have a set dressing tile placed on it. Pick one at random and
        //put the set on it.
        
        if ds_list_size(ylist) > 0{
            ds_list_shuffle(ylist)
            ay = ds_list_find_value(ylist,0)
            ds_list_clear(ylist)
            //run the script using the determined starting tile
            
            sDrawIndSmallPipeScript(vgrid,vtile,southorwest,gx,ay)
            
            //now set the wall grid to show that the cells are now occupied
            for (i = 0; i < vheight; i += 1){
                ds_grid_set(vgrid,gx,ay-i,2)
                }
            }
        //we've done a single column in a single grid. Just a few hundred more to go!
        }//end ds_list_size > 0
        
    howmanytimes += 1
    if southorwest = 0{//do the other side of the walls
        southorwest = 1
        }else{
        southorwest = 0
        }
    ds_list_destroy(vlist)
    }

ds_list_destroy(ylist)
