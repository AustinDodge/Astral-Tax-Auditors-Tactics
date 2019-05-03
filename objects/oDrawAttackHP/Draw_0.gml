var pointsdrawn,drawx,drawy,startx,starty,whattype = 0,thisrow;
if instance_exists(myunit){
    startx = myunit.x
    starty = myunit.y-40
    drawx = startx
    drawy = starty
    pointsdrawn = 0
    thisrow = 0
    
    while pointsdrawn < maxhitpoints{
        if pointsdrawn < greenpoints{
            draw_sprite(hppillsprite,0,drawx,drawy)//draw green points
            }
        if pointsdrawn >= greenpoints and pointsdrawn < greenpoints+redpoints{
            draw_sprite(hppillsprite,1,drawx,drawy)//draw red points
            }
        if pointsdrawn >= greenpoints+redpoints and pointsdrawn < maxhitpoints{
            draw_sprite(hppillsprite,2,drawx,drawy)//draw gray points
            }
        pointsdrawn += 1
        thisrow += 1
        drawx += 3
        if thisrow > hpperrow{
            drawx = startx
            drawy -= 6
            thisrow = 0
            }
        }
    
    if animstage = 1 and alarmon = 0{
        redpoints -= 1
        if redpoints = 0{
            alarm[1] = 20
            alarmon = 1
            }
        }
    if animstage = 0 and alarmon = 0{   
        if redpoints < damage{
            redpoints += 1
            greenpoints -= 1
            }else{
            alarm[0] = 10
            alarmon = 1
            }
        }
	myunit.hp = greenpoints
    }else{
    instance_destroy()
    }


