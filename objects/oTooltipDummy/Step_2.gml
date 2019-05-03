/// @description Insert description here
// You can write your code in this editor

if collision_point(imouse_x,imouse_y,id,0,0) = id{
	sDoTooltip(x+30,y,tipstring,tipwidth,tipborder,tipcolor,tipseparation)
	}

if myparent > 0{
    if instance_exists(myparent){
        x = myparent.x+dx
        y = myparent.y+dy
        }
    }