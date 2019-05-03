/// @description sCameraMoveXY(vx,vy,xborder,yborder,speed)
/// @param vx
/// @param vy
/// @param xborder
/// @param yborder
/// @param speed
/*This script makes the camera start moving to a particular object. If the target's x
and/or y coordinates are greater than xborder and yborder from the center of the view,
the camera will move to center over the target at speed pixels/step.
*/

var vxborder,vyborder,bspeed,vtargetx,vtargety;
vtargetx = argument0
vtargety = argument1
vxborder = argument2
vyborder = argument3
bspeed = argument4

if (abs(vtargetx - oCamera.x) > vxborder) or (abs(vtargety - oCamera.y) > vyborder){
    oCamera.cameratargeting = 1
    oCamera.targetx = vtargetx
    oCamera.targety = vtargety
    oCamera.targetspeed = bspeed
    }
