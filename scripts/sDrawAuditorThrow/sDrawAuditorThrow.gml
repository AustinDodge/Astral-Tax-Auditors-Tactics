/// @description sDrawAuditorThrow(vface,vanimstep,animate?)
/// @param vface
/// @param vanimstep
/// @param animate?

/*the script describing what to draw when an auditor is throwing an item they held.
Animstep is controlled by the item the unit is holding. The unit does not draw their 
weapon when holding an item
*/
var maxstep,vx,vy,pindex,vfacing,vanimstep,vanimate;

vfacing = argument0
vanimstep = argument1
vanimate = argument2

maxstep = 0
vx = 0
vy = 0
//sDrawAuditorPickSprites()

pindex = 1//the palette index, ie which column of the palette to draw


//only one frame
image_index = 28+vfacing
vx = 0
vy = 0


    
vx += x
vy += y

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(vanimstep/8),x,y,1,1,0,c_white,0.3)
    }


if !surface_exists(mypalette){//make sure the palette exists, create it if not
    mypalette = sAuditorMakePaletteMain()
    }
if !surface_exists(headpalette){//make sure palette exists
    headpalette = sAuditorMakePaletteHead()
    }
if !surface_exists(hairpalette){//make sure palette exists
    hairpalette = sAuditorMakePaletteHair()
    }

if vfacing = 0 or vfacing = 1{//if facing away
    sDrawAuditorBackArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorHead(headpalette,pindex,vx,vy)
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorHair(hairpalette,pindex,vx,vy)
    if facialhair > 0{
        sDrawAuditorFacialHair(hairpalette,pindex,vx,vy)
        }
    sDrawAuditorGlasses(mypalette,pindex,vx,vy)
    if drawear = 1{
        sDrawAuditorEar(headpalette,pindex,vx,vy)
        }
    sDrawAuditorFrontArm(mypalette,pindex,vx,vy)
    
    //sDrawAuditorWeapon(vx,vy,image_index)
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    }else{//if facing towards
    sDrawAuditorBackArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorHead(headpalette,pindex,vx,vy)
    sDrawAuditorHair(hairpalette,pindex,vx,vy)
    if facialhair > 0{
        sDrawAuditorFacialHair(hairpalette,pindex,vx,vy)
        }
    sDrawAuditorGlasses(mypalette,pindex,vx,vy)
    if drawear = 1{
        sDrawAuditorEar(headpalette,pindex,vx,vy)
        }
    sDrawAuditorFrontArm(mypalette,pindex,vx,vy)
    
    //sDrawAuditorWeapon(vx,vy,image_index)
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    }
    
//draw_self()
//draw_sprite(sprite_index,image_index,x+vx,y+vy)






