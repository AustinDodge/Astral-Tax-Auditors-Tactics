var startx,starty,itemx,textx,texty,drawy;

startx = x + 5
starty = y + 12

itemx = 20
texty = starty + 20
drawy = texty

drawx = startx
drawy = starty

//draw_set_color(c_blue)
//draw_set_alpha(0.5)
//draw_rectangle(startx,starty,startx+windowwidth,starty+windowheight,0)//draw the window

draw_sprite(sprite_index,0,x,y)

sDrawTextAuditorFont(drawx,drawy,c_black,c_white,windowstring1)
drawy += 20
sDrawTextAuditorFont(drawx+32,drawy,c_black,c_white,itemstring)
draw_sprite(itemsprite,0,drawx+10,drawy+5)
drawy += 20
sDrawTextAuditorFont(drawx,drawy,c_black,c_white,windowstring2)

/*
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_font(fontAuditorShadow)
draw_text(startx,drawy,itemname)//draw the attacking unit information
drawy += 30
draw_text(startx,drawy,windowstring)

//done drawing the attack window

/* */
/*  */
