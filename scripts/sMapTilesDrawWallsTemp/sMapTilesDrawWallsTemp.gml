/// @description sMapTilesDrawWallsTemp()
var i,drawx,drawy;

with oMapTile{
    drawx = x - 18
    for (i = 0; i < elevation; i += 1){//draw the west tiles
        tile_add(industrialbg1,tilewallw*2,0,tilewallw,tilewallh,drawx,y+(i*elevheight)+1,depth+1)
        }
    drawx = x
    for (i = 0; i < elevation; i += 1){//draw the south tiles
        tile_add(industrialbg1,tilewallw*3,0,tilewallw,tilewallh,drawx,y+(i*elevheight)+1,depth+1)
        }
    }
        
