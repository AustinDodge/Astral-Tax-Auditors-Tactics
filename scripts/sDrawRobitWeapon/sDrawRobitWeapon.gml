/// @description sDrawRobitWeapon(x,y,sub,scol)
/// @param x
/// @param y
/// @param sub
/// @param scol
/*this is another script that was copied pretty much wholesale from the previous
version. It's mostly identical to the auditor version, and works the same way.It 
should be mostly drag-and-drop!
*/

var cx,cy,nsub,scol,dsub;

cx = argument0//the x and y position of the calling unit
cy = argument1

cx -= sprite_get_xoffset(robot1complete)//change the drawing position from the origin to the upper-left corner
cy -= sprite_get_yoffset(robot1complete)

nsub = argument2//the subimage of the calling unit
scol = argument3

/*scol = c_white blending color, but don't bother with this until you're turning units gray at turn end
if totesdone{
    scol = c_gray
    }
*/
dsub = 0//the subimage that the weapon will be drawn at


switch facing{
    case 0: dsub = 7; break;
    case 1: dsub = 8; break;
    case 2: dsub = 8; break;
    case 3: dsub = 7; break;
    }



switch nsub{
    case 0: cx += 8; cy += 19; break;
    case 1: cx += 19; cy += 19; break;
    case 2: cx += 8; cy += 20; break;
    case 3: cx += 19; cy += 20; break;
    case 4: cx += 2; cy += 14; dsub = 7; break;
    case 5: cx += 24; cy += 14; dsub = 8; break;
    case 6: cx += 16; cy += 19; dsub = 8; break;
    case 7: cx += 1; cy += 19; dsub = 7; break;
    case 8: cx += 2; cy += 12; dsub = 3; break;
    case 9: cx += 25; cy += 12; dsub = 4; break;
    case 10: cx += 26; cy += 16; dsub = 5; break;
    case 11: cx += 1; cy += 16; dsub = 6; break;
    case 12: cx += 24; cy += 14; dsub = 7; break;
    case 13: cx += 3; cy += 14; dsub = 8; break;
    case 14: cx += 4; cy += 15; dsub = 8; break;
    case 15: cx += 23; cy += 15; dsub = 7; break;
    case 16: cx += 0; cy += 15; dsub = 3;  break;
    case 17: cx += 27; cy += 15; dsub = 4; break;
    case 18: cx += 24; cy += 20; dsub = 5; break;
    case 19: cx += 3; cy += 20; dsub = 6; break;
    case 20: cx += 3; cy += 16; dsub = 7; break;
    case 21: cx += 24; cy += 16; dsub = 8; break;
    case 22: cx += 14; cy += 17; dsub = 8; break;
    case 23: cx += 13; cy += 17; dsub = 7; break;

    case 24: cx += 11; cy += 20; break;
    case 25: cx += 16; cy += 20; break;
    case 26: cx += 6; cy += 19; break;
    case 27: cx += 21; cy += 19; break;
    case 28: cx += 6; cy += 19; break;
    case 29: cx += 21; cy += 19; break;
    case 30: cx += 11; cy += 20; break;
    case 31: cx += 16; cy += 20; break;
    }

if myweapon > 0{
    draw_sprite_ext(sGetItemInfo(myweapon,2),dsub,cx,cy,1,1,0,scol,1)
    }
//draw_sprite_ext(ds_grid_get(myweapons,4,equippedwep),dsub,cx,cy,1,1,0,scol,1)

