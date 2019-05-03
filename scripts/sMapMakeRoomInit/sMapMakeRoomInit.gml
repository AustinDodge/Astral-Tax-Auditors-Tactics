/// @description sMapMakeRoomInit()

var xory,divpoint,firstcell;

//xory is the direction the cut should be made in the cell

with oMapHeightCell{
    instance_destroy()
    }

with oMapTestGridTile{
    instance_destroy()
    }

if divratio != 50{//if the divratio isn't 50, the first cut should represent the divratio.
    if divratio < 50{
        xory = 0
        }else{
        xory = 1
        }
    }else{
    xory = irandom(1)//Otherwise it's random
    }

firstcell = instance_create(x,y,oMapHeightCell)
firstcell.height = roomheight
firstcell.width = roomwidth
firstcell.elevation = 1
firstcell.xpos = 0
firstcell.ypos = 0
firstcell.generation = divgeneration

//sMapDrawTestElevGrid()


