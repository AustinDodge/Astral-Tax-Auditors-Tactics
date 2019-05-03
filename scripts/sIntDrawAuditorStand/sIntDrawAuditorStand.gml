/// @description sDrawAuditorStand(vface,vanimstep,animate?)
/// @param vface
/// @param vanimstep
/// @param animate?
/// @param drawshadow
/// @param drawweapon

/*Uses oDummyDrawer to draw an auditor using supplied variables
*/
var maxstep,vx,vy,pindex,vsurf,gx,gy,valpha,stepvar,vstep,vfacing,vanimstep,vanimate,vdrawshadow,vdrawweapon;

vfacing = argument0
vanimstep = argument1
vanimate = argument2//if the unit is being animated in-game
vdrawshadow = argument3//if the shadow should be drawn
vdrawweapon = argument4//if the unit's weapon should be drawn

facing = vfacing//set in dummy so all drawing is accurate


maxstep = 48//Must be divisible by 4!
stepvar = maxstep/4
vx = 0
vy = 0
valpha = 1

//vsurf = surface_create(32,32)
if !surface_exists(vsurface32){//vsurface32 is a global variable
    vsurface32 = surface_create(32,32)
    }
vsurf = vsurface32

//sDrawAuditorPickSprites()

pindex = 1//the palette index, ie which column of the palette to draw



if vanimstep >= 0{
    image_index = 0+vfacing
    vx = 0
    vy = 0
    }


if vdrawshadow = 1{
    vstep = floor(vanimstep/stepvar)
    if vanimstep > stepvar*4{
        if vy != 0{
            vstep = 1
            }else{
            vstep = 0
            }
        }
    draw_sprite_ext(shadowsprite,vstep,x,y,1,1,0,c_white,0.3)
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
	if !is_undefined(surfacelist){
		ds_list_add(surfacelist,mypalette)
		}		
    }
if !surface_exists(headpalette){//make sure palette exists
    headpalette = sAuditorMakePaletteHead()
	if !is_undefined(surfacelist){
		ds_list_add(surfacelist,headpalette)
		}
    }
if !surface_exists(hairpalette){//make sure palette exists
    hairpalette = sAuditorMakePaletteHair()
	if !is_undefined(surfacelist){
		ds_list_add(surfacelist,hairpalette)
		}
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
	if vdrawweapon = 1{
	    if image_index != 24+vfacing{
	        sDrawAuditorWeapon(vx,vy,image_index)
	        }
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
	if vdrawweapon = 1{
	    if image_index != 24+vfacing{
	        sDrawAuditorWeapon(vx,vy,image_index)
	        }
		}
    sDrawAuditorFrontHand(headpalette,pindex,vx,vy)
    }
    
surface_reset_target()
if ds_list_find_value(abilitiesusedlist,47) = 1{
    valpha = 0.75
    }
draw_surface_ext(vsurf,gx,gy,1,1,0,c_white,valpha)

    
//draw_self()
//draw_sprite(sprite_index,image_index,x+vx,y+vy)






