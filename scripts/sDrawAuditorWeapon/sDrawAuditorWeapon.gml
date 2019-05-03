/// @description sDrawAuditorWeapon(x,y,sub)
/// @param x
/// @param y
/// @param sub
/*this script draws the auditor's weapon over its sprite. I was able to copy it directly from the
old game's code, and it assumes that the weapon is being drawn from the upper left corner
of a 32x32 sprite. It's called by the unit object.
*/

var cx,cy,nsub,scol,dsub;

cx = argument0//the x and y position of the calling unit
cy = argument1

cx -= sprite_get_xoffset(maleauditorjacketbody)//change the drawing position from the origin to the upper-left corner
cy -= sprite_get_yoffset(maleauditorjacketbody)

nsub = argument2//the subimage of the calling unit

scol = c_white//blending color, implement this when we're changing the units grey at the end of the turn
if turnover{
    scol = c_gray
    }
if fallfadestage > 0{
    scol = merge_color(c_white,c_black,fallfadestage/fallfadesteps)
    }

dsub = 0

switch facing{
    case 0: dsub = 7; break;//change the subimage to match the facing
    case 1: dsub = 8; break;
    case 2: dsub = 8; break;
    case 3: dsub = 7; break;
    }


if gender = 1{//if the unit is male
switch nsub{
    case 0: cx += 8; cy += 20; break;//standing
    case 1: cx += 20; cy += 20; break;//standing
    case 2: cx += 9; cy += 19; break;//standing
    case 3: cx += 19; cy += 19; break;//standing
    case 4: cx += 3; cy += 10; dsub = 7; break;
    case 5: cx += 25; cy += 10; dsub = 8; break;
    case 6: cx += 23; cy += 16; dsub = 8; break;
    case 7: cx += 4; cy += 16; dsub = 7; break;
    case 8: cx += 5; cy += 8; dsub = 3; break;
    case 9: cx += 23; cy += 8; dsub = 4; break;
    case 10: cx += 23; cy += 11; dsub = 5; break;
    case 11: cx += 4; cy += 11; dsub = 6; break;
    case 12: cx += 25; cy += 12; dsub = 7; break;
    case 13: cx += 3; cy += 12; dsub = 8; break;
    case 14: cx += 2; cy += 11; dsub = 8; break;
    case 15: cx += 26; cy += 11; dsub = 7; break;
    case 16: cx += 3; cy += 10; dsub = 3; break;
    case 17: cx += 25; cy += 10; dsub = 4; break;
    case 18: cx += 25; cy += 17; dsub = 5; break;
    case 19: cx += 3; cy += 17; dsub = 6; break;
    case 20: cx += 3; cy += 11; dsub = 7; break;
    case 21: cx += 25; cy += 11; dsub = 8; break;
    case 22: cx += 20; cy += 13; dsub = 8; break;
    case 23: cx += 8; cy += 13; dsub = 7; break;
    case 24: cx += 7; cy += 6; break;
    case 25: cx += 21; cy += 6; break;
    case 26: cx += 8; cy += 6; break;
    case 27: cx += 20; cy += 6; break;
    case 28: cx += 3; cy += 11; break;
    case 29: cx += 25; cy += 11; break;
    case 30: cx += 20; cy += 12; break;
    case 31: cx += 8; cy += 12; break;
    case 32: cx += 9; cy += 19; break;//walk1n
    case 33: cx += 19; cy += 19; break;//walk1e
    case 34: cx += 8; cy += 18; break;//walk1s
    case 35: cx += 20; cy += 18; break;//walk1w
    case 36: cx += 7; cy += 19; break;//walk2n
    case 37: cx += 21; cy += 19; break;//walk2e
    case 38: cx += 12; cy += 19; break;//walk2s
    case 39: cx += 16; cy += 19; break;//walk2w
    }
}else{//if the unit is female
switch nsub{
    case 0: cx += 9; cy += 20; break;////standing
    case 1: cx += 19; cy += 20; break;////standing
    case 2: cx += 9; cy += 19; break;////standing
    case 3: cx += 19; cy += 19; break;////standing
    case 4: cx += 4; cy += 11; dsub = 7; break;//
    case 5: cx += 24; cy += 11; dsub = 8; break;//
    case 6: cx += 23; cy += 16; dsub = 8; break;//
    case 7: cx += 4; cy += 16; dsub = 7; break;//
    case 8: cx += 6; cy += 9; dsub = 3; break;//
    case 9: cx += 22; cy += 9; dsub = 4; break;//
    case 10: cx += 22; cy += 11; dsub = 5; break;//
    case 11: cx += 5; cy += 11; dsub = 6; break;//
    case 12: cx += 25; cy += 13; dsub = 7; break;//
    case 13: cx += 3; cy += 13; dsub = 8; break;//
    case 14: cx += 3; cy += 11; dsub = 8; break;//
    case 15: cx += 25; cy += 11; dsub = 7; break;//
    case 16: cx += 4; cy += 10; dsub = 3; break;//
    case 17: cx += 24; cy += 10; dsub = 4;break;//
    case 18: cx += 24; cy += 17; dsub = 5; break;//
    case 19: cx += 4; cy += 17; dsub = 6; break;//
    case 20: cx += 4; cy += 11; dsub = 7; break;//
    case 21: cx += 24; cy += 11; dsub = 8; break;//
    case 22: cx += 19; cy += 13; dsub = 8; break;//
    case 23: cx += 9; cy += 13; dsub = 7; break;//
    case 24: cx += 8; cy += 7; break;//
    case 25: cx += 20; cy += 7; break;//
    case 26: cx += 9; cy += 7; break;//
    case 27: cx += 19; cy += 7; break;//
    case 28: cx += 4; cy += 11; break;//
    case 29: cx += 24; cy += 11; break;//
    case 30: cx += 19; cy += 12; break;//
    case 31: cx += 9; cy += 12; break;//
    case 32: cx += 10; cy += 19; break;////walk1n
    case 33: cx += 18; cy += 19; break;////walk1e
    case 34: cx += 8; cy += 18; break;////walk1s
    case 35: cx += 20; cy += 18; break;////walk1w
    case 36: cx += 8; cy += 19; break;////walk2n
    case 37: cx += 20; cy += 19; break;////walk2e
    case 38: cx += 12; cy += 19; break;//walk2s
    case 39: cx += 16; cy += 19; break;//walk2w
    }
}
if myweapon > 0{
    draw_sprite_ext(sGetItemInfo(myweapon,2),dsub,cx,cy,1,1,0,scol,1)
    
    }

