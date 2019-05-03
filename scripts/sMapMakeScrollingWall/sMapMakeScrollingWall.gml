/// @description sMapMakeScrollingWall(bg,x,y,bgx,bgy,speed,resheight)
/// @param bg
/// @param x
/// @param y
/// @param bgx
/// @param bgy
/// @param speed
/// @param resheight
/*This script makes one scrolling wall with the properties specified.
It assumes the wall will have "bigwall" dimensions.
*/

var vbg,vx,vy,vsx,vsy,vmspeed,vres;

vbg = argument0
vx = argument1
vy = argument2
vsx = argument3
vsy = argument4
vmspeed = argument5
vres = argument6

vwall = instance_create(vx,vy,oScrollingWall)
vwall.sbg = vbg
vwall.sx = vsx
vwall.sy = vsy
vwall.swidth = bigwallw
vwall.sheight = bigwallh
vwall.mspeed = vmspeed
vwall.resheight = vres

