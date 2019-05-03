/// @description sDrawAuditorStand(vface,vanimstep,animate?)
/// @param vface
/// @param vanimstep
/// @param animate?

/*the script describing what to draw when an auditor is idle.
Animstep goes up each step, and the maxstep is when it resets. 
*/
var maxstep,vx,vy,pindex,vsurf,gx,gy,valpha,stepvar,vstep,vfacing,vanimstep,vanimate;

vfacing = argument0
vanimstep = argument1
vanimate = argument2//if the unit is being animated in-game


maxstep = 48//Must be divisible by 4!
stepvar = maxstep/4
if amdistracting = 1 and moving = 0{
    maxstep += stepvar*3
    }
vx = 0
vy = 0
valpha = 1

//vsurf = surface_create(32,32)
if !surface_exists(vsurface32){
    vsurface32 = surface_create(32,32)
    }
vsurf = vsurface32

//sDrawAuditorPickSprites()

pindex = 1//the palette index, ie which column of the palette to draw
if fallingpit = 1{
    pindex = 1+fallfadestage
    }
if fadinginblack = 1{
    pindex = 1+(fallfadestage/fallfadesteps)
    }
if fadingoutblack = 1{
    pindex = 1+(fallfadestage/fallfadesteps)
    }

if turnover = 0{//only animate if the unit hasn't finished its turn.
    //animstep += 1
    }else{
    pindex = 1.5
    //animstep = 0
    }

if vanimstep >= 0{
    image_index = 0+vfacing
    vx = 0
    vy = 0
    }
if turnover = 0{//if the unit's turn isn't over, animate the walk
    if vanimstep >= stepvar{
        image_index = 32+vfacing
        //if moving = 0{//don't play with x and y if moving to a new tile
            vx = 0
            vy = -1
        //    }
        }
    if vanimstep >= stepvar*2{
        image_index = 0+vfacing
        vx = 0
        vy = 0
        }
    if vanimstep >= stepvar*3{
        image_index = 36+vfacing
        //if moving = 0{
            vx = 0
            vy = -1
        //    }
        }
    }
//animate the distraciton jump even if the unit's turn is over
if amdistracting = 1 and vanimate = 1{
    if vanimstep >= (stepvar*4){
        image_index = 24+vfacing
        vx = 0
        vy = 0
        }
    if vanimstep >= (stepvar*5)-6{
        image_index = 24+vfacing
        vx = 0
        vy = -3
        }
    if vanimstep >= (stepvar*6)+6{
        image_index = 24+vfacing
        vx = 0
        vy = 0
        }
    }
        
if jumping = 1{
    vx = 0
    vy = 0
    }


if moving = 0{
    vstep = floor(vanimstep/stepvar)
    if vanimstep > stepvar*4{
        if vy != 0{
            vstep = 1
            }else{
            vstep = 0
            }
        }
    draw_sprite_ext(shadowsprite,vstep,x,y,1,1,0,c_white,0.3)
    }else{
    if (falling = 1 and fallingpit = 0){
        draw_sprite_ext(shadowsprite,floor(vanimstep/stepvar),mytile.x,mytile.y,1,1,0,c_white,0.3)
        }
    if climbing = 1{
        draw_sprite_ext(shadowsprite,floor(vanimstep/stepvar),lasttile.x,lasttile.y,1,1,0,c_white,0.3)
        }
    }
    
vx += x
vy += y

vx -= sprite_get_xoffset(maleauditorjacketbody)
vy -= sprite_get_yoffset(maleauditorjacketbody)

gx = vx
gy = vy

vx = sprite_get_xoffset(maleauditorjacketbody)
vy = sprite_get_yoffset(maleauditorjacketbody)


if !surface_exists(mypalette){//make sure the palette exists, create it if not
    mypalette = sAuditorMakePaletteMain()
    }
if !surface_exists(headpalette){//make sure palette exists
    headpalette = sAuditorMakePaletteHead()
    }
if !surface_exists(hairpalette){//make sure palette exists
    hairpalette = sAuditorMakePaletteHair()
    }

surface_set_target(vsurf)
draw_clear_alpha(c_white,0)

if vfacing = 0 or vfacing = 1{//if facing away
    sDrawAuditorBackArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
    
    sDrawAuditorHead(headpalette,pindex,vx,vy)
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorFrontArm(mypalette,pindex,vx,vy)
    sDrawAuditorHair(hairpalette,pindex,vx,vy)
    if facialhair > 0{
        sDrawAuditorFacialHair(hairpalette,pindex,vx,vy)
        }
    sDrawAuditorGlasses(mypalette,pindex,vx,vy)
    if drawear = 1{
        sDrawAuditorEar(headpalette,pindex,vx,vy)
        }
    if image_index != 24+vfacing{
        sDrawAuditorWeapon(vx,vy,image_index)
        }
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    
    }else{//if facing towards
    
    sDrawAuditorBackArmBody(mypalette,pindex,vx,vy)
    sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
    sDrawAuditorNoArmBody(mypalette,pindex,vx,vy)
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
        
    if image_index != 24+vfacing{
        sDrawAuditorWeapon(vx,vy,image_index)
        }
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    }
    
surface_reset_target()
if ds_list_find_value(abilitiesusedlist,47) = 1{
    valpha = 0.75
    }
draw_surface_ext(vsurf,gx,gy,1,1,0,c_white,valpha)


if vanimate = 1{//if animating ingame, add one to animstep
	animstep += 1

	if animstep > maxstep{
	    animstep = 0
	    }
	}
    
//draw_self()
//draw_sprite(sprite_index,image_index,x+vx,y+vy)






