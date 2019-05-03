/// @description Insert description here
// You can write your code in this editor
if glowing = 1{
    draw_sprite_ext(glowsprite,0,x,y,1,1,0,c_white,glowalpha)
    
    }

if mouseon = 1{
    if mystring != 0{
        sDoTooltip(x+(sprite_width-sprite_xoffset),y+(sprite_height-sprite_yoffset),mystring,tipwidth,tipborder,0,tipsep)
        }
    }

draw_self()
if mystring != 0{
    var vx;
    vx = x+round(sprite_width/2)
    draw_set_font(fontAuditorShadow)
    vx -= ceil(string_width(string_hash_to_newline(mystring))/2)
    sDrawTextAuditorFont(vx+2,y+4,c_black,c_white,mystring)
    }

var px,py,vx,vy,vdummy;

vx = x+3
vy = y+8
vx += 11*bondlevel

//draw based on the data list
vdummy = instance_create_depth(vx,vy,depth-1,oDummyDrawer)
vdummy.myattributelist = mylist
with vdummy{
	sAuditorLoadDataList()
	sIntDrawAuditorStand(2,0,0,0,0)
	}

instance_destroy(vdummy)


//old unit drawing script
/*if instance_exists(myunit){
	px = myunit.x
	py = myunit.y

	myunit.x = vx
	myunit.y = vy
	with myunit{
		if amidead = 0{
			sDrawAuditorStand(2,0,0)
			}else{
			sDrawAuditorKO(2,0,0)
			}
		}
	myunit.x = px
	myunit.y = py
	}