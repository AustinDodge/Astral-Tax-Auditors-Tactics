/// @description sDrawAuditorAttack(vface,vanimstep,animate?)
/// @param vface
/// @param vanimstep
/// @param animate?

/*the script describing what to draw when an auditor is  attacking.
Animstep is controlled by oAttackControl
*/
var maxstep,vx,vy,pindex,vshove,vfacing,vanimstep,vanimate;

vfacing = argument0
vanimstep = argument1
vanimate = argument2//if the unit is being animated in-game

maxstep = 1
vx = 0
vy = 0
//sDrawAuditorPickSprites()

pindex = 1//the palette index, ie which column of the palette to draw
vshove = 0

if attackanimtype = 0{//if it's short-range attack animation
    if vanimstep = 0{
        image_index = 12+vfacing
        vx = 0
        vy = 0
        }
    if vanimstep = 1{
        image_index = 16+vfacing
        vx = 0
        vy = -1
        }
    }else{//if it's long-range attack animation
    if vanimstep = 0{
        image_index = 4+vfacing
        vx = 0
        vy = 0
        }
    if vanimstep = 1{
        image_index = 8+vfacing
        vx = 0
        vy = -1
        }
    }
    
if instance_exists(oSpecialAttackControl){
    if oSpecialAttackControl.shove = 1{
        vshove = 1
        //special instructions for drawing the "shove" animation
        if vanimstep = 0{
            image_index = vfacing
            vx = 0
            vy = 0
            }
        if vanimstep = 1{
            image_index = 28+vfacing
            vx = 0
            vy = 0
            }
        }
    }
            

    
vx += x
vy += y

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(vanimstep/8),vx,vy,1,1,0,c_white,0.3)
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
    if gender = 1{
        switch vfacing{//head correction
            case 1: vx -= 1; break;
            case 0: vx += 1; break;
            }
        }
    sDrawAuditorHead(headpalette,pindex,vx,vy)
    if gender = 1{
        switch vfacing{//head correction
            case 1: vx += 1; break;
            case 0: vx -= 1; break;
            }
        }
    
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
    
    
    
    sDrawAuditorFrontArm(mypalette,pindex,vx,vy)
    if gender = 1{
        switch vfacing{//head correction
            case 1: vx -= 1; break;
            case 0: vx += 1; break;
            }
        }
    sDrawAuditorHair(hairpalette,pindex,vx,vy)
    if facialhair > 0{
        sDrawAuditorFacialHair(hairpalette,pindex,vx,vy)
        }
    sDrawAuditorGlasses(mypalette,pindex,vx,vy)
    if drawear = 1{
        sDrawAuditorEar(headpalette,pindex,vx,vy)
        }
    if gender = 1{
        switch vfacing{//head correction
            case 1: vx += 1; break;
            case 0: vx -= 1; break;
            }
        }
    if vshove = 0{
        sDrawAuditorWeapon(vx,vy,image_index)
        }
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    }else{//if facing towards
    sDrawAuditorBackArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
    
    if gender = 1{
        switch vfacing{//head correction
            case 2: vx -= 1; break;
            case 3: vx += 1; break;
            }
        }
    sDrawAuditorHead(headpalette,pindex,vx,vy)
    
    sDrawAuditorFrontArm(mypalette,pindex,vx,vy)
    sDrawAuditorHair(hairpalette,pindex,vx,vy)
    if facialhair > 0{
        sDrawAuditorFacialHair(hairpalette,pindex,vx,vy)
        }
    sDrawAuditorGlasses(mypalette,pindex,vx,vy)
    if drawear = 1{
        sDrawAuditorEar(headpalette,pindex,vx,vy)
        }
    if gender = 1{
        switch vfacing{//head correction
            case 2: vx += 1; break;
            case 3: vx -= 1; break;
            }
        }
    if vshove = 0{
        sDrawAuditorWeapon(vx,vy,image_index)
        }
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    }

    
//draw_self()
//draw_sprite(sprite_index,image_index,x+vx,y+vy)






