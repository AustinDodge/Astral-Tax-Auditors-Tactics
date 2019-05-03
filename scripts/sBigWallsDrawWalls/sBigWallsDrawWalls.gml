/// @description sBigWallsDrawWalls()

//this script draws the big walls from their grids to the screen. MAKE THE GRIDS FIRST!

var vx,vy,px,py,startx,starty,gridheight,vval,startpx,vbg;



//start drawing the north big wall
gridheight = ds_grid_height(nbigwallgrid)
startx = mapdrawingstartx-bigwallw
starty = (mapdrawingstarty-(gridheight*(bigwallh-wallslope)))-wallslope


vx = startx
vy = starty
px = ds_grid_width(nbigwallgrid)-1
startpx = px
py = 0

while py < gridheight{
    vval = ds_grid_get(nbigwallgrid,px,py)
    switch maptheme{
        case 0: vbg = industrialbg1; break;
        case 1: vbg = parkbg1; break;
        }
    if px = 0{
        switch maptheme{
            case 0: vbg = industrialbgborderleft; break;
            case 1: vbg = parkbgborderleft; break;
            }
        }
    if px = ds_grid_width(nbigwallgrid)-1{
        switch maptheme{
            case 0: vbg = industrialbgborderright; break;
            case 1: vbg = parkbgborderright; break;
            }
        }
    if vval < 10{
        tile_add(vbg,bigwallw*1,vval*bigwallh,bigwallw,bigwallh,vx,vy,15000)//placeholder depth, expect to change it later
        }else{
        vbg = elevatorwallbg
        vval -= 10
        tile_add(vbg,bigwallw*1,vval*bigwallh,bigwallw,bigwallh,vx,vy,15000)
        }
    vx -= bigwallw
    vy += wallslope
    px -= 1
    if px < 0{
        px = startpx
        py += 1
        vx = startx
        vy = starty+((bigwallh-wallslope)*py)
        }
    }
    
//start drawing the east big wall

startx = mapdrawingstartx
starty = (mapdrawingstarty-(gridheight*(bigwallh-wallslope)))-wallslope

vx = startx
vy = starty
//px = ds_grid_width(ebigwallgrid)-1
px = 0
py = 0

while py < gridheight{
    vval = ds_grid_get(ebigwallgrid,px,py)
    //show_message(vval)
    switch maptheme{
        case 0: vbg = industrialbg1; break;
        case 1: vbg = parkbg1; break;
        }
    if px = 0{
        switch maptheme{
            case 0: vbg = industrialbgborderleft; break;
            case 1: vbg = parkbgborderleft; break;
            }
        }
    if px = ds_grid_width(nbigwallgrid)-1{
        switch maptheme{
            case 0: vbg = industrialbgborderright; break;
            case 1: vbg = parkbgborderright; break;
            }
        }
    if vval < 10{
        tile_add(vbg,bigwallw*0,vval*bigwallh,bigwallw,bigwallh,vx,vy,15000)//placeholder depth, expect to change it later
        }else{
        vbg = elevatorwallbg
        vval -= 10
        tile_add(vbg,bigwallw*0,vval*bigwallh,bigwallw,bigwallh,vx,vy,15000)
        }
    vx += bigwallw
    vy += wallslope
    px += 1
    if px >= ds_grid_width(ebigwallgrid){
        px = 0
        py += 1
        vx = startx
        vy = starty+((bigwallh-wallslope)*py)
        }
    }
    
ds_grid_destroy(ebigwallgrid)
ds_grid_destroy(nbigwallgrid)
