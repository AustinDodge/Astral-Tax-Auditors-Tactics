/// @description sMapDrawTestElevGrid()

var vx,vy,xgrid,ygrid,vval,vtile,startx,starty;

with oMapTestGridTile{
    instance_destroy()
    }
    
ds_grid_clear(mapheightgrid,0)

with oMapHeightCell{
    ds_grid_add_region(mapheightgrid,xpos,ypos,(xpos+width),(ypos+height),elevation)
    }
    
startx = 100
starty = 100

vx = startx
vy = starty
xgrid = 0
ygrid = 0
while ygrid < ds_grid_height(mapheightgrid){
    vval = ds_grid_get(mapheightgrid,xgrid,ygrid)
    vtile = instance_create(vx,vy,oMapTestGridTile)
    vtile.elevation = vval
    vx += 32
    xgrid += 1
    if xgrid = ds_grid_width(mapheightgrid){
        vx = startx
        vy += 32
        xgrid = 0
        ygrid += 1
        }
    }


