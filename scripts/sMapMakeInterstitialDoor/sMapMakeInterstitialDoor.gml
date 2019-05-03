/// @description sMapMakeInterstitialDoor()

/*this script makes the single door that the units will be on during an elevator interstitial.
*/

var xmid,ymid,ndiff,ediff,sdiff,wdiff,nstart,estart,sstart,wstart,vmove;
/*xmid and ymid are the middle, or an approximation of the middle in evenly sized rooms,
of the x and y tiles. the diff variables are how far off from the middle the doors are
made. the start variables are where the door will be positioned against the edge.
*/

nstart = 0//finally, get the door start values

reddoor = 1//this elevator door will always be the "n" door

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
































