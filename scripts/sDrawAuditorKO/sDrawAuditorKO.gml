/// @description sDrawAuditorKO(vface,vanimstep,animate?)
/// @param vface
/// @param vanimstep
/// @param animate?

/*the script describing what to draw when an auditor is dead or knocked out. 
*/
var maxstep,vx,vy,pindex,vsurf,dsurf,vfacing,vanimstep,vanimate;

vfacing = argument0
vanimstep = argument1
vanimate = argument2//if the unit is being animated in-game

maxstep = 32
vx = 0
vy = 0

if !surface_exists(vsurface32){
    vsurface32 = surface_create(32,32)
    }
vsurf = vsurface32
if !surface_exists(dsurface32){
    dsurface32 = surface_create(32,32)
    }
dsurf = dsurface32


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

if moving = 0{
    draw_sprite_ext(shadowsprite,floor(animstep/8),x,y,1,1,0,c_white,0.3)
    }else{
    if (falling = 1 and fallingpit = 0){
        draw_sprite_ext(shadowsprite,floor(animstep/8),mytile.x,mytile.y,1,1,0,c_white,0.3)
        }
    if climbing = 1{
        draw_sprite_ext(shadowsprite,floor(animstep/8),lasttile.x,lasttile.y,1,1,0,c_white,0.3)
        }
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
    
vx = 0
vy = 0

image_index = 40//KO sprite for the body

//clear the surfaces
surface_set_target(vsurf)
draw_clear_alpha(c_white,0)
surface_reset_target()
surface_set_target(vsurf)
draw_clear_alpha(c_white,0)
surface_reset_target()

vx += sprite_get_xoffset(maleauditorjacketbody)//all auditor parts have the same offset
vy += sprite_get_yoffset(maleauditorjacketbody)


facing = 0//set facing to draw the head with proper shadows
surface_set_target(dsurf)
draw_clear_alpha(c_white,0)
sDrawAuditorHead(headpalette,pindex,vx,vy)
sDrawAuditorHair(hairpalette,pindex,vx,vy)
sDrawAuditorFacialHair(hairpalette,pindex,vx,vy)
sDrawAuditorGlasses(mypalette,pindex,vx,vy)
sDrawAuditorEar(headpalette,pindex,vx,vy)
//the head is drawn, facing N and upright
//draw this to vsurf flipped

surface_reset_target()

surface_set_target(vsurf)
draw_surface_ext(dsurf,0+sprite_get_width(maleauditorjacketbody),0,-1,1,0,c_white,1)

//now draw the body and leg sprites regular ways to vsurf

sDrawAuditorLowerBody(mypalette,pindex,vx,vy)
sDrawAuditorBackArmBody(mypalette,pindex,vx,vy)

surface_reset_target()
//now draw vsurf to the game surface rotated 90 degrees
vx = x
vy = y
vx += sprite_get_xoffset(maleauditorjacketbody)//all auditor parts have the same offset
vy -= sprite_get_yoffset(maleauditorjacketbody)
vy += 5

draw_surface_ext(vsurf,vx,vy,1,1,270,c_white,1)


    
//draw_self()
//draw_sprite(sprite_index,image_index,x+vx,y+vy)






