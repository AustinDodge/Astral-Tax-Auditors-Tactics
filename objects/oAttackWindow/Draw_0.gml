var startx,starty,attackerx,defenderx,textx,texty,drawx,drawy;


//drawx = oUnitWindow.x
drawx = camera_get_view_x(maincameraid)+((round(camrealwidth/2))-round(sprite_get_width(spcombatcard)/2))
drawy = oUnitWindow.y

//drawx += 150
drawy -= 80

startx = drawx
starty = drawy

//draw attacker stats
if attacker.weaponhealing = 0{
	draw_sprite(spcombatcard,0,drawx,drawy)
	}else{
	draw_sprite(spcombatcard,1,drawx,drawy)
	}
drawx += 56
drawy += 3


textx = floor(sGetTextAuditorFontWidth(dispattackerdamage))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispattackerdamage)
drawx += 29
textx = floor(sGetTextAuditorFontWidth(dispattackerhit))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispattackerhit)
drawx += 31
textx = floor(sGetTextAuditorFontWidth(dispattackercrit))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispattackercrit)
drawx += 31
textx = floor(sGetTextAuditorFontWidth(dispattackerknock))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispattackerknock)

drawx = startx
drawy = starty

//draw defender stats
drawx += 56
drawy += 30

textx = floor(sGetTextAuditorFontWidth(dispdefenderdamage))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispdefenderdamage)
drawx += 29
textx = floor(sGetTextAuditorFontWidth(dispdefenderhit))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispdefenderhit)
drawx += 31
textx = floor(sGetTextAuditorFontWidth(dispdefendercrit))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispdefendercrit)
drawx += 31
textx = floor(sGetTextAuditorFontWidth(dispdefenderknock))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,dispdefenderknock)

drawx = startx+23
drawy = starty+13
textx = floor(sGetTextAuditorFontWidth(string(attacker.hp)))/2
sDrawTextAuditorFont(drawx-textx,drawy,c_black,c_white,string(attacker.hp))

drawx = startx+168
drawy = starty+30
textx = floor(sGetTextAuditorFontWidth(string(defender.hp)))/2
sDrawTextAuditorFont(drawx,drawy,c_black,c_white,string(defender.hp))


//done drawing the attack window

/* */
/*  */
