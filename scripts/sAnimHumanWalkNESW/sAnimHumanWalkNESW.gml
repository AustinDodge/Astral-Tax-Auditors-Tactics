/// @description sAnimMoveNESW(animstep)
/// @param animstep
/*this script describes the x and y movements of a humanoid unit moving north, south,
east, or west. It does not return x or y values for moving up or down an elevation. It works
because the unit will follow the same diagonal line, just in a different direction. The
step event of the unit decides whether to add or subtract the returned value from the unit's
x and y values.
*/

var varg,i,vdiv;

varg = argument0
vdiv = varg/2
if floor(vdiv) = vdiv{//if the number is even or odd
    i = 20/tilemovespeed
    }else{
    i = 11/tilemovespeed
    }
    
return i;

/*
switch argument0{
    case 0: return 3; break;//x
    case 1: return 2; break;//y
    case 2: return 3; break;//x
    case 3: return 2; break;//y
    case 4: return 4; break;//x
    case 5: return 1; break;//y
    case 6: return 3; break;//x
    case 7: return 2; break;//y
    case 8: return 4; break;//x
    case 9: return 2; break;//y
    case 10: return 3; break;//x
    case 11: return 2; break;//y
    }
