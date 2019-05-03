/// @description sCheckLineOfSight(starttile,endtile,vunit,cunit)
/// @param starttile
/// @param endtile
/// @param vunit
/// @param cunit
/*this script checks if there's an uninterrupted line of sight between two tiles. If there is a unit on the endtile, the end
height is the tile elevation plus the height of occupied -1. Vunit is the unit running the check, and the height of the unit is
used to determine the starting height of the loop. It can be left at 0 and will check from a height of 2 as the most common unit
eye level. It returns 1 if endtile has a line of sight to starttile, 0 if not.
*/
var vunit,range,minrange,startx,starty,vtile,starttile,startelev,uprange,vdiff,xdiff,ydiff,vdist,cantgo,vtype,endtile,cunit,i;

starttile = argument0
endtile = argument1

vunit = argument2
cunit = argument3

i = 0

    
//If you need to set canattack to 0, make sure to do it outside this script - the AI relies on being able to
//calculate multiple tiles attackranges all at the same time!

startx = starttile.mx
starty = starttile.my
startelev = starttile.elevation
vtile = 0
vdist = starttile.mydistance


math_set_epsilon(0.0000)
with endtile{
    vtile = id
    /*this is kind of a brute force way of doing it, but considering how small the maps are, this should suffice. If it seems slow,
    it won't be too much trouble to rewrite it to just fan out the difference, but I just don't want to mess with it too much right now.*/

    var gx,gy,gz,tx,ty,tz,steps,vstep,howmanytiles,vprecision,ttile,vclear,slopex,slopey,slopez,vz,tunit,vdistance;
    vprecision = 3//how many steps to check for each tile that that's crossed. Lower precision can give greater allowances for corners
    vclear = 1//if there is a clear line of sight
    gx = starttile.mx + 0.5//the starting position of sight
    gy = starttile.my + 0.5
    gz = starttile.elevation
    if vunit > 0{
        gz += (vunit.myheight - 1)
        }else{
        gz += 2
        }
    tx = mx + 0.5//where we're trying to see
    ty = my + 0.5
    tz = elevation + 1
    //if occupied > 0{//if there's a unit, add that unit's height. Really big enemies should need a really big wall to take cover
        //tz = elevation + occupied.myheight
        //}else{
    tz = elevation + cunit.myheight
        //}
    vdistance = point_distance(gx,gy,tx,ty)
    howmanytiles = round(vdistance)
    steps = howmanytiles*vprecision
    slopex = tx - gx//add this to gx each step 
    slopex /= steps
    slopey = ty - gy//add to gy
    slopey /= steps
    slopez = tz - gz//add to gz
    slopez /= steps
    vstep = 0
    
    //show_message(math_get_epsilon())
    
    while vstep < steps{//this is the loop that actually finds line of sight
        gx += slopex
        gy += slopey
        gz += slopez
        ttile = ds_grid_get(tilegrid,floor(gx),floor(gy))
        if ttile != vtile{
            vz = ttile.elevation
            tunit = ttile.occupied
            if tunit > 0{
                if tunit.unitisobject = 1{
                    //vz += tunit.myheight
                    //un-comment this if you want barrels, etc to block line of sight.
                    }
                }
            if gz <= vz{
                vclear = 0
                vstep = steps
                }
            }else{//if we've reached the target tile, assume a clear line of sight
            vstep = steps
            }
        vstep += 1
        }
    if vclear = 1{//if there's a line of sight,
        i = 1
        }
        
    }//end with
math_set_epsilon(0.00)

return i;
