/// @description sItemMakeThrowPath(startx,starty,endx,endy)
/// @param startx
/// @param starty
/// @param endx
/// @param endy
var vx,vy,gx,gy,vpath,xmid,ymid,vpath;

vpath = path_add()
vx = argument0
vy = argument1
gx = argument2
gy = argument3
path_set_closed(vpath,0)

xmid = mean(vx,gx)
ymid = mean(vy,gy)
ymid -= 50
if ymid > vy - 40{
    ymid = vy-40
    }

path_clear_points(vpath)
path_add_point(vpath,vx,vy,100)//add the starting point
path_add_point(vpath,xmid,ymid,100)//add the mid point
path_add_point(vpath,gx,gy,100)
return vpath;

