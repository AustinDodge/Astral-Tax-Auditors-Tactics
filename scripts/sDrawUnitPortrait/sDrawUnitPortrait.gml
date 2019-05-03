/// @description sDrawUnitPortrait(vunit,dx,dy,flipped?)
/// @param vunit
/// @param dx
/// @param dy
/// @param flipped?
/*This script is called by oUnitWindow and other things that need to draw portraits.
It either draws the portrait sprite of the unit or executes the script that draws the
portrait.
*/
var vx,vy,vunit,vflipped,vscale,vdone,dx,dy;

vunit = argument0
//the actual x/y coordinates to draw the portrait at
dx = argument1
dy = argument2
vflipped = argument3
vdone = 0

//since it's drawing to a surface, draw to the middle of that surface
vx = 0
vy = 22

vscale = 1
if vflipped = 1{
    vscale = -1
    vx += 48//the width of all portraits, change if necessary
    }
	
//	

	
if !surface_exists(portraitsurface){
	portraitsurface = surface_create(48,83)
	}
	
surface_set_target(portraitsurface)

draw_clear_alpha(c_white,0)
    
switch vunit.object_index{
    case oAuditor: sDrawAuditorPortrait(vx,vy,vunit,vflipped); vdone = 1; break;
    case oKOAuditor: sDrawAuditorPortrait(vx,vy,vunit,vflipped); vdone = 1; break;
    case oCorpseAuditor: sDrawAuditorPortraitDead(vx,vy,vunit,vflipped); vdone = 1; break;
    case oKineticRobit: draw_sprite_ext(sEnemyPortraitMaintBot,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oSpookyRobit: draw_sprite_ext(sEnemyPortraitMaintBot,1,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oElectRobit: draw_sprite_ext(sEnemyPortraitMaintBot,2,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oGreenBarrel: draw_sprite_ext(sUnitPortraitBarrell,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oRedChest: draw_sprite_ext(sunitportraitredcrate,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oOsculaNemesis: draw_sprite_ext(spnemesisportraitoscula,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oSkullsplode: draw_sprite_ext(senemyportraitskullsplode,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oHoverSpark: draw_sprite_ext(senemyportraithoverspark,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oCabra: draw_sprite_ext(senemyportraitcabras,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oDecabra: draw_sprite_ext(senemyportraitcabras,1,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oCabracitor: draw_sprite_ext(senemyportraitcabras,2,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    case oSawbot: draw_sprite_ext(spenemyportraitsawbot,0,vx,vy,vscale,1,0,c_white,1); vdone = 1; break;
    }
    
if vdone = 0{//if no portrait was drawn, draw the standin
    draw_sprite_ext(spunitportraitstandin,0,vx,vy,vscale,1,0,c_white,1)
    }
	
surface_reset_target()
draw_surface(portraitsurface,dx,dy)
