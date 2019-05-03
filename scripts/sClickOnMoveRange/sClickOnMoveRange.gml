/// @description sClickOnMoveRange(stile)
/// @param stile
/*this script describes what happens when a player clicks on a move range tile,
starting the movement of the currently selected unit to that tile.
*/

var vtile,vunit,nexttile,vparent,vvalid,vstarter;
vtile = argument0
vstarter = argument0
vunit = sunit

vparent = vtile.parent
if vparent != 0{//if the player didn't click on the first moverange, i.e. the tile the unit is already on

    with vunit{
        movestack = ds_stack_create()//make movestack in the unit
        }
    
    ds_stack_push(vunit.movestack,vtile)//add the clicked tile to the movestack
    
        while vparent.parent != 0{//if that tile's parent isn't the start tile
            vtile = vparent
            ds_stack_push(vunit.movestack,vtile)//add it to the movestack
            vparent = vtile.parent
            }
        vvalid = 1
        }
if vvalid = 1{
    with vunit{
        if movepoints = pmovepoints{//set the cancel tile if the unit hasn't already partially moved
            prevtile = mytile//set this so the move can be cancelled
            prevface = facing
            }
        movepoints -= vstarter.mydistance//subtract movepoints
        ds_grid_set(unitposgrid,mx,my,-1)//change its position on the uintposgrid
        mytile.occupied = 0//and change its tiles occupied status
        vunit.moving = 1//start the unit moving
        vunit.walking = 1//the unit is walking
        //now rehash the movestack script from the beginstep event
        x = mytile.x
        y = mytile.y//ensure the unit is at the proper x/y position
        nexttile = ds_stack_pop(movestack)//get the next tile
        
        //if nexttile.elevation < mytile.elevation{
        if ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) < ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
            willfall = 1
            vertdist = mytile.elevation - nexttile.elevation
            }
        //if nexttile.elevation > mytile.elevation{
        if ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) > ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
            climbing = 1
            walking = 0
            waswalking = 1
            //vertdist = nexttile.elevation - mytile.elevation
            vertdist = ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) - ds_grid_get(mapheightgrid,mytile.mx,mytile.my)
            }
        //if nexttile.elevation <= mytile.elevation{//if the unit won't be climbing to the next tile
        if ds_grid_get(mapheightgrid,nexttile.mx,nexttile.my) <= ds_grid_get(mapheightgrid,mytile.mx,mytile.my){
            if mytile.depth < nexttile.depth{//set the new depth to the tile with
                depth = mytile.depth-5//the lowest depth
                }else{//so the unit draws in front
                depth = nexttile.depth-5
                }
            }else{//if the unit is climbing
            lasttile = mytile
            }
        if nexttile = mytile.n{//set the proper facing
            facing = 0
            }
        if nexttile = mytile.e{
            facing = 1
            }
        if nexttile = mytile.s{
            facing = 2
            }
        if nexttile = mytile.w{
            facing = 3
            }
        lasttile = mytile
        mytile = nexttile
        walkstep = 0
        lasttile.drawshadow = 1
        lasttile.shadowunit = id
        mytile.drawshadow = 1
        mytile.shadowunit = id
        if unitmovesound != -1{
            //audio_play_sound(unitmovesound,2,0)
            sSoundPlayEffect(unitmovesound,1,0,1)
            }
        }
    sMakeButtons(vunit)
    //and we should be good to go!
    }




























