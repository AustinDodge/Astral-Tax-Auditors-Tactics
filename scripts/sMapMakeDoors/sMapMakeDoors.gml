/// @description sMapMakeDoors()

/*this script makes the doors on the map. It draws from the <color>door variables set in
oMapControl and makes them on the respective sides of the room. It only sets the position
in the grid tiletypegrid, so it needs to be ran before the actual tiles are put down.
red is the north door 1
yellow is the east door 2
green is the south door 3
blue is the west door 4
*/

var xmid,ymid,ndiff,ediff,sdiff,wdiff,nstart,estart,sstart,wstart,vmove;
/*xmid and ymid are the middle, or an approximation of the middle in evenly sized rooms,
of the x and y tiles. the diff variables are how far off from the middle the doors are
made. the start variables are where the door will be positioned against the edge.
*/
xmid = ceil(roomwidth/2)
if sIsNumberEven(xmid){//if an even number, randomly pick between the middle being left or right of center.
    switch irandom(0){//ex if roomwidth is 8, the middle can be 4 or 5
        case 1: xmid += 1; break;
        }
    }
xmid -= 1//correct for counting from 0
ymid = ceil(roomheight/2)
if sIsNumberEven(ymid){
    switch irandom(0){
        case 1: ymid += 1; break;
        }
    }
ymid -= 1

ndiff = irandom_range(0,floor(roomwidth/4))//the center is modified by up to one quarter the room width
sdiff = irandom_range(0,floor(roomwidth/4))
ediff = irandom_range(0,floor(roomheight/4))
wdiff = irandom_range(0,floor(roomheight/4))

ndiff -= 1
sdiff -= 1
ediff -= 1
wdiff -= 1

if irandom(1) = 1{//randomly change it to a negative, so future calculations only need to use +=
    ndiff = 0-ndiff
    }
if irandom(1) = 1{
    sdiff = 0-sdiff
    }
if irandom(1) = 1{
    ediff = 0-ediff
    }
if irandom(1) = 1{
    wdiff = 0-wdiff
    }

nstart = xmid + ndiff//finally, get the door start values
sstart = xmid + sdiff
estart = ymid + ediff
wstart = ymid + wdiff

nstart -= 1//correct to be the corner of the door tiles, rather than the middle
sstart -= 1
estart -= 1
wstart -= 1

var vx,vy,vxstart,vystart;//the coordinates to place the door tiles on the grid

if reddoor = 1{
    vxstart = nstart
    vystart = 0
    vx = vxstart
    vy = vystart
    while vy < 2{
        ds_grid_set(tiletypegrid,vx,vy,1)//set tile type to 1 for red door grid
        vx += 1
        if vx = vxstart+3{
            vx = vxstart
            vy += 1
            }
        }
    }
    
if yellowdoor = 1{
    while ds_grid_value_exists(tiletypegrid,estart,roomwidth-1,estart+2,roomwidth-2,1){//move the door south if it overlaps with door 1
        estart += 1
        }
    vxstart = roomwidth - 1
    vystart = estart
    vx = vxstart
    vy = vystart
    while vx > roomwidth - 3{
        ds_grid_set(tiletypegrid,vx,vy,2)
        vy += 1
        if vy = vystart + 3{
            vx -= 1
            vy = vystart
            }
        }
    }
    
if greendoor = 1{
    while ds_grid_value_exists(tiletypegrid,sstart,roomheight-1,sstart+2,roomheight-2,2){//move the door west if it overlaps with door 2
        sstart -= 1
        }
    vxstart = sstart
    vystart = roomheight-1
    vx = vxstart
    vy = vystart
    while vy > roomheight-3{
        ds_grid_set(tiletypegrid,vx,vy,3)
        vx += 1
        if vx = vxstart+3{
            vx = vxstart
            vy -= 1
            }
        }
    }
vmove = 0   
if bluedoor = 1{
    if ds_grid_value_exists(tiletypegrid,0,wstart,1,wstart+2,1){//move wstart south if it overlaps with door 1
        while ds_grid_value_exists(tiletypegrid,0,wstart,1,wstart+2,1){
            wstart += 1
            vmove += 1
            if vmove > 10{
                show_message("Stuck in an infinite loop making the blue door!")
                }
            }
        }
    vmove = 0
    if ds_grid_value_exists(tiletypegrid,0,wstart,1,wstart+2,3){//move wstart north if it overlaps with door 3
        while ds_grid_value_exists(tiletypegrid,0,wstart,1,wstart+2,3){
            wstart -= 1
            vmove += 1
            if vmove > 10{
                show_message("Stuck in infinite loop making the blue door!")
                }
            }
        }
    vxstart = 0
    vystart = wstart
    vx = vxstart
    vy = vystart
    while vx < 2{
        ds_grid_set(tiletypegrid,vx,vy,4)
        vy += 1
        if vy = vystart+3{
            vy = vystart
            vx += 1
            }
        }
    }






































