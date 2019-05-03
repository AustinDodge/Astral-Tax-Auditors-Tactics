/// @description sDrawAuditorPortraitDead(vx,vy,vunit,flipped?)
/// @param vx
/// @param vy
/// @param vunit
/// @param flipped?
/*This script draws the deadauditor portrait at the specified x/y coordinates.
*/
var vx,vy,vunit,vflipped,vscale,pindex,drawhairbg,drawears;
vx = argument0
vy = argument1
vunit = argument2
vflipped = argument3

pindex = 1//palette index
drawhairbg = 0
drawears = 1

vscale = 1
if vflipped = 1{
    vscale = -1
    }
if vunit.gender = 0{
    switch vunit.hairtype{
        case 0: drawhairbg = 1; break;
        case 1: drawhairbg = 1; break;
        case 2: drawhairbg = 1; drawears = 0; break;
        }
    }

with vunit{
    if !surface_exists(mypalette){//make sure the palette exists, create it if not
        mypalette = sAuditorMakePaletteMain()
        }
    if !surface_exists(headpalette){//make sure palette exists
        headpalette = sAuditorMakePaletteHead()
        }
    if !surface_exists(hairpalette){//make sure palette exists
        hairpalette = sAuditorMakePaletteHair()
        }
        
    
    if drawhairbg = 1{
        sDrawAuditorPortraitHairBackground(hairpalette,pindex,vx,vy,vflipped)
        }
    sDrawAuditorPortraitBody(mypalette,pindex,vx,vy,vflipped)
    sDrawAuditorPortraitHead(headpalette,pindex,vx,vy,vflipped)
    sDrawAuditorPortraitNose(headpalette,pindex,vx,vy,vflipped)
    
    //sDrawAuditorPortraitEyes(headpalette,pindex,vx,vy,vflipped)
    sDrawAuditorPortraitEyebrows(hairpalette,pindex,vx,vy,vflipped)
    if drawears = 0{
        sDrawAuditorPortraitGlasses(mypalette,pindex,vx,vy,vflipped)
        }
    
    sDrawAuditorPortraitHair(hairpalette,pindex,vx,vy,vflipped)
    if mouthunder = 1{
        sDrawAuditorPortraitMouth(headpalette,pindex,vx,vy,vflipped)
        }
    if facialhair > 0{
        sDrawAuditorPortraitFacialHair(hairpalette,pindex,vx,vy,vflipped)
        }
    if mouthunder = 0{
        sDrawAuditorPortraitMouth(headpalette,pindex,vx,vy,vflipped)
        }
    if drawears = 1{
        sDrawAuditorPortraitGlasses(mypalette,pindex,vx,vy,vflipped)
        sDrawAuditorPortraitEars(headpalette,pindex,vx,vy,vflipped)
        }
    sDrawAuditorPortraitXEyes(headpalette,pindex,vx,vy,vflipped)
    }
    
    
