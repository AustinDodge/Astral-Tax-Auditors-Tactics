/// @description sMapMakeElevatorScrollingWalls()
/*This script makes the downward-scrolling elevator walls for the elevator interstitials.
*/
var vreps,vx,vy,startx,starty,i,vwall,vres;

vreps = 0;
vy = 0
//find out how many walls need to be drawn to 
while vy < __view_get( e__VW.HView, 0 )+bigwallh{
    vy += (bigwallh-wallslope)
    vreps += 1
    }
    
vres = vy
vres -= (bigwallh)
    
//now make the walls
startx = (mapdrawingstartx-(bigwallh*2))+6
starty = __view_get( e__VW.YView, 0 )-(bigwallh*1)
for (i = 0; i < vreps; i += 1){
    vx = startx
    vy = starty
    vy += (bigwallh-wallslope)*i
    //1st
    sMapMakeScrollingWall(elevatorwallbg,vx,vy,bigwallw*1,bigwallh*2,2,vres)
    
    vx += bigwallw
    vy -= wallslope
    //2nd
    sMapMakeScrollingWall(elevatorwallbg,vx,vy,bigwallw*1,bigwallh*1,2,vres)
    vx += bigwallw
    vy -= wallslope
    //3rd
    sMapMakeScrollingWall(elevatorwallbg,vx,vy,bigwallw*1,bigwallh*0,2,vres)
    //4th
    vx += bigwallw
    sMapMakeScrollingWall(elevatorwallbg,vx,vy,bigwallw*0,bigwallh*3,2,vres)
    vx += bigwallw
    vy += wallslope
    sMapMakeScrollingWall(elevatorwallbg,vx,vy,bigwallw*0,bigwallh*3,2,vres)
    }

with oScrollingWall{
    depth = 10000
    }




























