/// @description sUnitMoveTiles()
/*This script is called by all units in their step event when they're being knocked from one tile to another.
*/
var ntile,noknock,willgo,vunit,willbounce,willknock,bouncedirlist,vunittype,killedhere;
sunit = id
canclick = 0//dont' let the player click anything while moving
if knockdir >= 0{//if the unit is bouncing in a direction
    switch knockdir{//move the units x/y position based on the unit's facing value
        case 0://knocked n
            x -= sAnimWalk(walkstep)
            walkstep += 1
            y -= sAnimWalk(walkstep)
            walkstep += 1
            ; break;
        case 1://knocked e
            x += sAnimWalk(walkstep)
            walkstep += 1
            y -= sAnimWalk(walkstep)
            walkstep += 1
            ; break;
        case 2://knocked s
            x += sAnimWalk(walkstep)
            walkstep += 1
            y += sAnimWalk(walkstep)
            walkstep += 1
            ; break;
        case 3://knocked w
            x -= sAnimWalk(walkstep)
            walkstep += 1
            y += sAnimWalk(walkstep)
            walkstep += 1
            ; break;
        }//done moving to new tile
    }else{//if the unit isn't moving to a new tile
    walkstep += 2
    }
if walkstep < 8{
    y -= sAnimHumanBounce(walkstep)
    }else{
    y += sAnimHumanBounce(walkstep)
    }
    
    
if walkstep >= 12{//When the unit finishes bouncing to another tile, check if the current tile
//(plus the height of the unit on it, if applicable) is at a lower elevation than the unit is currently at.
//If so, go back to falling. If not, check if the tile has a unit on it. If so, bounce again. If not, stop
//moving.
    var vtile,vunit,velevation,killedone;
    depth = mytile.depth - 6
    walkstep = 0
    vtile = mytile
    //velevation = vtile.elevation
    velevation = ds_grid_get(mapheightgrid,vtile.mx,vtile.my)
    if ds_grid_get(tiletypegrid,vtile.mx,vtile.my) = -1{//if the unit will be falling into a pit
        fallingpit = 1
        //vertdist = lasttile.elevation
        vertdist = ds_grid_get(mapheightgrid,lasttile.mx,lasttile.my)
        //elevation = lasttile.elevation
        elevation = vertdist
        bouncing = 0
        fallfadelimit = vtile.elevation
        }
    if fallingpit = 0{//if the unit isn't bouncing into a pit, figure out everything else
        if vtile.occupied > 0{
            vunit = vtile.occupied
            velevation += vunit.myheight
            }
        if elevation > velevation{
            falling = 1
            bouncing = 0
            vertdist = elevation - velevation
            
            }else{//if the unit won't fall, check if it needs to bounce again
            if mytile.occupied > 0{//if there's a unit on the tile just bounced to, bounce again
                killedone = 0
                killedhere = 0
                vunit = mytile.occupied//for checking during debug
                vunittype = vunit.object_index
                vunit.knockdamage += 5//placeholder squish damage
                knockdamage += 5//placeholder fall damage
                if knockdamage >= hp{
                    killedone = 1
                    mx = mytile.mx
                    my = mytile.my
                    sUnitKillMidKnock(id)
                    }
                if vunit.knockdamage >= vunit.hp and killedone = 0{//if vunit has taken too much damage, kill it immediately
                    sUnitKillMidKnock(vunit)
                    killedhere = 1
                    }else{//if vunit will still be around
                    sAddUnitToKnockedList(vunit)
                    vunit.alarm[4] = 20
                    }
                if killedhere = 0 and killedone = 0{
                    sUnitMoveFindNextBounceTile()
                    }else{
                    knockdir = -1
                    }
                mx = mytile.mx
                my = mytile.my
                }else{//if there's no unit on the tile, stay there and end the bounce
                knockforce = 0
                amknocked = 0
                wasknocked = 0
                waswalking = 0
                moving = 0
                walking = 0
                falling = 0
                climbing = 0
                bouncing = 0
                x = mytile.x
                y = mytile.y//ensure the unit is at the proper x/y position
                bx = x
                by = y
                mx = mytile.mx
                my = mytile.my
                depth = mytile.depth-5
                mytile.occupied = id
                //elevation = mytile.elevation
                elevation = ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
                ds_grid_set(unitposgrid,mx,my,id)
                //canclick = 1
                alarm[4] = 20//being alarm to remove self from knockedlist
                }
            }
        }
    }
