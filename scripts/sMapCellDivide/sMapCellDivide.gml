/// @description sMapCellDivide(cell,xory)
/// @param cell
/// @param xory

var vcell,xory,divpoint,divmin,divmax,newcell1,newcell2,divwork,vx,vy,plusorminus,keepchanging,maxchange,minchange;




vcell = argument0
xory = argument1
switch maptype{//different divgeneration values for different map types
    case 0://cavern maps
        if divgeneration < 2{//the maximum and minumum elevation difference in two cells. Larger differences at the start of divisions
            maxchange = 4
            minchange = 3
            }else{
            maxchange = 2
            minchange = 1
            }
        ; break;
    case 1://catwalk maps
        if divgeneration < 2{//the maximum and minumum elevation difference in two cells. Larger differences at the start of divisions
            maxchange = 3
            minchange = 1
            }else{
            maxchange = 2
            minchange = 1
            }
        ; break;
    }
//show_message(xory)

if xory = 0{//if the cell is too narrow to divide in one direction, make sure the cut happens in the other direction
    if height < 2{
        xory = 1
        }
    }else{
    if width < 2{
        xory = 0
        }
    }

if xory = 0{//pick the height or width values to cut along
    divwork = vcell.height//the cut will be horizontal, new cells will have the same width as the parent cell
    }else{
    divwork = vcell.width//the cut will be vertical, new cells will have the same height as the parent cell
    }

divmin = 1//these are the minimum and maximum values of the cut position
divmax = divwork-1
    
vx = vcell.xpos//the grid position of the starting cell
vy = vcell.ypos

if sIsNumberEven(divwork){//find the center line to start the cut on. If the cell is odd, randomly choose between either side of the center tiles
    divpoint = divwork/2
    }else{
    switch(irandom(1)){
        case 0: divpoint = floor(divwork/2); break;
        case 1: divpoint = ceil(divwork/2); break;
        }
    }
    
//show_message(divpoint)


plusorminus = irandom(1)
keepchanging = 1
while keepchanging = 1{//this determines where the cut in the cell will be made
    switch plusorminus{
        case 0: divpoint += 1; break;
        case 1: divpoint -= 1; break;
        }
    if irandom(100) < 50{//the chance that the divpoint will divert from the current position. Change this for best results - maybe make it really large for crazy maps?
        keepchanging = 0
        }
    if divpoint <= divmin{//if the divpoint ends up at the minimum, stop
        keepchanging = 0
        }
    if divpoint >= divmax{//if the divpoint ends up at the maximum, stop
        keepchanging = 0
        }
    }
    
//show_message(divpoint)
    
//now we make the two new cells

newcell1 = instance_create(x,y,oMapHeightCell)
newcell2 = instance_create(x,y,oMapHeightCell)
newcell1.parent = vcell
newcell2.parent = vcell
newcell1.generation = divgeneration+1
newcell2.generation = divgeneration+1

if xory = 0{
    newcell1.elevation = irandom_range(minchange,maxchange)
    newcell2.elevation = 0
    }else{
    newcell1.elevation = 0
    newcell2.elevation = irandom_range(minchange,maxchange)
    }

if xory = 0{
    newcell1.width = vcell.width
    newcell2.width = vcell.width
    
    newcell1.height = divpoint-1
    newcell2.height = vcell.height-divpoint
    
    newcell1.xpos = vcell.xpos
    newcell1.ypos = vcell.ypos
    
    newcell2.xpos = vcell.xpos
    newcell2.ypos = vcell.ypos+divpoint
    }else{
    newcell1.height = vcell.height
    newcell2.height = vcell.height
    
    newcell1.width = divpoint-1
    newcell2.width = vcell.width-divpoint
    
    newcell1.xpos = vcell.xpos
    newcell1.ypos = vcell.ypos
    
    newcell2.xpos = vcell.xpos+divpoint
    newcell2.ypos = vcell.ypos
    }





























