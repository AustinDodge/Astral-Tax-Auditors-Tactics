/// @description sFindAttackRange(unit,vtile)
/// @param unit
/// @param vtile
/*this script finds the attack range for a unit from a specified tile. It works for
both close and long range weapons. 
*/
var vunit,range,minrange,startx,starty,vtile,starttile,startelev,uprange,vdiff,xdiff,ydiff,vdist,cantgo,vtype;
vunit = argument0

range = vunit.attackrange
minrange = vunit.attackminrange
uprange = vunit.attackuprange
if uprange = -1{
    uprange = 10000
    }
cantgo = 0
    
//If you need to set canattack to 0, make sure to do it outside this script - the AI relies on being able to
//calculate multiple tiles attackranges all at the same time!

starttile = argument1
startx = starttile.mx
starty = starttile.my
startelev = starttile.elevation
vtile = 0
vdist = starttile.mydistance


//modify to account for status
if vunit.stunnedstatus > 0{
    range = 0
    }


math_set_epsilon(0.0000)
with oMapTile{
    cantgo = 0
    vtile = id
    xdiff = abs(mx - startx)
    ydiff = abs(my-starty)
    if (xdiff + ydiff <= range){//if it's close enough
    /*this is kind of a brute force way of doing it, but considering how small the maps are, this should suffice. If it seems slow,
    it won't be too much trouble to rewrite it to just fan out the difference, but I just don't want to mess with it too much right now.*/
        if (mx = startx and my = starty){
            if !instance_exists(oItemControl){//unless you're finding the range of a trap, don't consider the base tile an attackable tile
                cantgo = 1
                }
            }
        vtype = ds_grid_get(tiletypegrid,mx,my)
        switch vtype{
            case 6: cantgo = 1; break;//can't shoot obstacles
            case 7: cantgo = 1; break;//can't shoot terminals
            }
        if (xdiff >= minrange) and (ydiff >= minrange) and cantgo = 0{
            vdiff = abs(elevation - startelev)
            if vdiff <= uprange{
                var gx,gy,gz,tx,ty,tz,steps,vstep,howmanytiles,vprecision,ttile,vclear,slopex,slopey,slopez,vz,tunit,vdistance;
                vprecision = 3//how many steps to check for each tile that that's crossed. Lower precision can give greater allowances for corners
                vclear = 1//if there is a clear line of sight
                gx = starttile.mx + 0.5//the starting position of sight
                gy = starttile.my + 0.5
                gz = starttile.elevation + (vunit.myheight - 1)
                tx = mx + 0.5//where we're trying to see
                ty = my + 0.5
                tz = elevation + 2
                if occupied > 0{//if there's a unit, add that unit's height. Really big enemies should need a really big wall to take cover
                    tz = elevation + occupied.myheight
                    }
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
                while vstep < steps{
                    gx += slopex
                    gy += slopey
                    gz += slopez
                    ttile = ds_grid_get(tilegrid,floor(gx),floor(gy))
                    if ttile != vtile{
                        vz = ttile.elevation
                        tunit = ttile.occupied
                        if tunit > 0{
                            if tunit.unitisobject = 1{
                                vz += tunit.myheight
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
                    if vtile.canattack = 0{//if this is the first time this tile has been checked
                        vtile.canattack = 1
                        vtile.attackparent = starttile//its attackparent is the tile that's calling this script
                        vtile.attackdistance = vdist
                        }else{
                        if vtile.attackdistance < vdist{//check if this is a further tile to attack from
                            vtile.attackparent = starttile
                            vtile.attackdistance = vdist
                            }
                        }//end checking uprange
                    }
                }
            }
        }
    }//end with
math_set_epsilon(0.00)
