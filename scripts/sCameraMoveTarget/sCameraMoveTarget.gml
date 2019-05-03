/// @description sCameraMoveTarget(targetobject,xborder,yborder,speed)
/// @param targetobject
/// @param xborder
/// @param yborder
/// @param speed
/*This script makes the camera start moving to a particular object. If the target's x
and/or y coordinates are greater than xborder and yborder from the center of the view,
the camera will move to center over the target at speed pixels/step.
*/

var vxborder,vyborder,bspeed,vtarget;
vtarget = argument0
vxborder = argument1
vyborder = argument2
bspeed = argument3

if instance_exists(vtarget){//check that the instance exists
    if (abs(vtarget.x - oCamera.x) > vxborder) or (abs(vtarget.y - oCamera.y) > vyborder){
        oCamera.cameratargeting = 1
        oCamera.targetx = vtarget.x
        oCamera.targety = vtarget.y
        oCamera.targetspeed = bspeed
        }
    }else{
    show_message("sCameraMoveTarget target doesn't exist!")
    }
        
