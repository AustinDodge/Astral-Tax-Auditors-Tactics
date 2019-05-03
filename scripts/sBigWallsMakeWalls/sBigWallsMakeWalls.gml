/// @description sBigWallsMakeWalls(vmaxelevation)
/// @param vmaxelevation

//This script makes the grids for the big walls, but doesn't draw them.

/*Wall grid key:
0 is the high wall border
1 is wall variant 1
2 is wall variant 2
etc
*/
var vmaxelevation,vx,vy,px,py,vval;

vmaxelevation = argument0

nbigwallgridh = ceil(vmaxelevation/4)
nbigwallgridh += 2
ebigwallgridh = nbigwallgridh

nbigwallgridw = roomwidth
ebigwallgridw = roomheight

nbigwallgrid = ds_grid_create(nbigwallgridw,nbigwallgridh)
ebigwallgrid = ds_grid_create(ebigwallgridw,ebigwallgridh)

vx = 0
vy = 0

while vy < nbigwallgridh{//set the values of the north big wall
    if vy = 0{
        vval = 0
        }else{
        vval = irandom_range(1,3)
        }
    var vstr,v1,v2,v3;
    v2 = ds_grid_get(tiletypegrid,vx,0)
    if v2 > 0 and v2 < 5{//if it's a door tile
        v1 = ds_grid_get(tiletypegrid,vx-1,0)//west of the tile
        v3 = ds_grid_get(tiletypegrid,vx+1,0)//east of the tile
        if v1 = v2{
            v1 = 1
            }else{
            v1 = 0
            }
        if v3 = v2{
            v3 = 1
            }else{
            v3 = 0
            }
        v2 = 1
        vstr = string(v1)+string(v2)+string(v3)
        switch vstr{
            case "110": vval = 10; break;
            case "111": vval = 11; break;
            case "011": vval = 12; break;
            }
        }
        
    ds_grid_set(nbigwallgrid,vx,vy,vval)
    vx += 1
    if vx = nbigwallgridw{
        vx = 0
        vy += 1
        }
    }

vx = 0
vy = 0

while vy < ebigwallgridh{//set the values of the east big wall
    if vy = 0{
        vval = 0
        }else{
        vval = irandom_range(1,3)
        }
    var vstr,v1,v2,v3;
    v2 = ds_grid_get(tiletypegrid,roomwidth-1,vx)
    if v2 > 0 and v2 < 5{//if it's a door tile
        v1 = ds_grid_get(tiletypegrid,roomwidth-1,vx+1)//south of the tile
        v3 = ds_grid_get(tiletypegrid,roomwidth-1,vx-1)//north of the tile
        if v1 = v2{
            v1 = 1
            }else{
            v1 = 0
            }
        if v3 = v2{
            v3 = 1
            }else{
            v3 = 0
            }
        v2 = 1
        vstr = string(v1)+string(v2)+string(v3)
        switch vstr{
            case "110": vval = 10; break;
            case "111": vval = 11; break;
            case "011": vval = 12; break;
            }
        }
    ds_grid_set(ebigwallgrid,vx,vy,vval)
    vx += 1
    if vx = ebigwallgridw{
        vx = 0
        vy += 1
        }
    }


















