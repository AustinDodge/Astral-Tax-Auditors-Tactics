/// @description sUnitMoveFallDefault()
/*This script is called by all units in their step event when they're being knocked from one tile to another.
*/

var vtile,vunit,velevation,bouncefound,i,bouncelist,ntile,changedit,vteam,vsteps;

vsteps = round(tilemovespeed/3)
sunit = id
canclick = 0//dont' let the player click anything while moving
//y += round(elevheight/2)
y += 6/vsteps
walkstep += 1

if elevation < fallfadelimit{
    if fallfadestage < fallfadesteps{
        fallfadestage += 1
        }
    }

//done changing x and y values
if walkstep >= vsteps{//if the unit has completely moved to the next tile
    walkstep = 0
    vertdist -= 1
    elevation -= 1
    changedit = 0//if the unit changed to moving,walking or bouncing
    
    if vertdist <= 1{
        vtile = mytile
        if mytile.occupied > 0{//if there's a unit on the tile the unit is falling onto
            //there shouldn't be a unit in the pit, but keep this if it proves necessary in the future
            
            /*var vbounce; 
            vbounce = 1
            vunit = mytile.occupied
            if waswalking = 1{//if the unit was walking instead of bouncing
                if vunit.team = team{//and the unit it will land on is on its own team
                    
                    vbounce = 0//don't bounce
                    }
                }
            if vbounce = 1{
                elevation = mytile.elevation+vunit.myheight
                
                vunit.knockdamage += 5//placeholder squish damage
                sAddUnitToKnockedList(vunit)
                vunit.alarm[4] = 20
                bouncing = 1
                falling = 0
                walkstep = 0
                vertdist = 0
                sUnitMoveFindNextBounceTile()
                mx = mytile.mx
                my = mytile.my
                changedit = 1
                }*/
            }
        }
    //show_message(elevation)
    //if vertdist <= 0 and changedit = 0{//stay here if the unit can
    if elevation = 0{//if the unit has reached the bottom of the pit
        //again, the unit should only fall and die when they hit the bottom of the pit. Keep everything else
        //just in case you need it in the future.
        if hp < 0{//if the unit doesn't have HP, it needs at least one to be destroyed properly
            hp = 0
            }
        knockdamage = hp
        explodestatus = 0
        explodable = 0
        sUnitKillMidKnock(id)
        /*walkstep = 0
        falling = 0
        willfall = 0
        x = mytile.x
        y = mytile.y
        mx = mytile.mx
        my = mytile.my
        elevation = mytile.elevation
        
        if waswalking = 1{
            walking = 1
            walkstep = 12//reset walkstep so the unit doesn't try to move to the next tile if this is the last tile
            }
        if wasknocked = 1{
            if knockforce > 0{
                amknocked = 1
                }else{
                mytile.occupied = id
                canclick = 1
                depth = mytile.depth-5
                ds_grid_set(unitposgrid,mx,my,id)
                wasknocked = 0
                moving = 0
                alarm[4] = 20
                }
            }*/
        }//done with end of tile action
    }
