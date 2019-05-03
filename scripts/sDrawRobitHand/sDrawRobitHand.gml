/// @description sDrawRobitHand(x,y,sub,scol)
/// @param x
/// @param y
/// @param sub
/// @param scol
/*This one was also ripped from the old version, but there's a crucial difference
between it and the version used by the auditors - if draws a single hand sprite
at the specified x/y position. The auditor version uses a 32x32 script that 
has the single hand sprite drawn at all necessary positions. I'll use this for
now but it may be better to change it later on.
*/

var cx, cy, nsub, nsprite,subs,scol;

cx = argument0//the x and y position of the calling unit
cy = argument1

cx -= sprite_get_xoffset(robot1complete)//change the drawing position from the origin to the upper-left corner
cy -= sprite_get_yoffset(robot1complete)
cy += 4


nsub = argument2//the subimage of the main sprite
scol = argument3
switch unittype{//the hand sprite
    case 1: nsprite = robot1hand; break;
    case 2: nsprite = electrobot1hand; break;
    case 3: nsprite = spookybot1hand; break;
    }

switch nsub{
    case 0: cx += 8; cy += 14; break;
    case 1: cx += 19; cy += 14; break;
    case 2: cx += 8; cy += 15; break;
    case 3: cx += 19; cy += 15; break;
    case 4: cx += 2; cy += 9; break;
    case 5: cx += 24; cy += 9; break;
    case 6: cx += 16; cy += 14; break;
    case 7: cx += 1; cy += 14; break;
    case 8: cx += 2; cy += 7; break;
    case 9: cx += 25; cy += 7; break;
    case 10: cx += 26; cy += 11; break;
    case 11: cx += 1; cy += 11; break;
    case 12: cx += 24; cy += 9; break;
    case 13: cx += 3; cy += 9; break;
    case 14: cx += 4; cy += 10; break;
    case 15: cx += 23; cy += 10; break;
    case 16: cx += 0; cy += 8; break;
    case 17: cx += 27; cy += 8;break;
    case 18: cx += 24; cy += 15; break;
    case 19: cx += 3; cy += 15; break;
    case 20: cx += 3; cy += 11; break;
    case 21: cx += 24; cy += 11; break;
    case 22: cx += 14; cy += 12; break;
    case 23: cx += 13; cy += 12; break;

    case 24: cx += 11; cy += 15; break;
    case 25: cx += 16; cy += 15; break;
    case 26: cx += 6; cy += 14; break;
    case 27: cx += 21; cy += 14; break;
    case 28: cx += 6; cy += 14; break;
    case 29: cx += 21; cy += 14; break;
    case 30: cx += 11; cy += 15; break;
    case 31: cx += 16; cy += 15; break;
    }


draw_sprite_ext(nsprite,0,cx,cy,1,1,0,scol,1)
//draw_sprite_ext(nsprite,0,cx,cy,1,1,0,c_white,1)

//draw_sprite(nsprite,sub+(subs*3),nx,ny)


