var vlight,stardensity,vx,vy,i,vstar,xmin,xmax,ymin,ymax;

x = 20
y = -60

xhalf = 0
yhalf = 0

overcolor = c_navy
overalpha = 0.15

xmin = __view_get( e__VW.XView, 0 ) - 15
xmax = __view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )+15)
ymin = __view_get( e__VW.YView, 0 ) - 15
ymax = __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )+15)

stardensity = 300//the number of start on the screen

for (i = 0; i < stardensity; i += 1){
    vx = irandom_range(xmin,xmax)
    vy = irandom_range(ymin,ymax)
    vstar = instance_create(vx,vy,oMenuPalaceBGStar)
    vstar.depth = depth+1
    }

//make light objects
vlight = instance_create(x+354,y+298,oMenuPalaceLights1)
vlight.depth = depth-1

vlight = instance_create(x+64,y+210,oMenuPalaceExhaust1)
vlight.depth = depth-1

vlight = instance_create(x+119,y+101,oMenuPalaceLights2)
vlight.depth = depth-1

vlight = instance_create(x+165,y+110,oMenuPalaceLights3)
vlight.depth = depth-1

vlight = instance_create(x+358,y+177,oMenuPalaceLights4)
vlight.depth = depth-1



rot = 0//the current degree to which its position has rotated
rot = irandom(360)

if irandom(1) = 1{
    rotspeed = -0.002//the speed at which it rotates
    }else{
    rotspeed = 0.002
    }
rotlength = 40//the distance at which it rotates

startx = x
starty = y


