var vx,vy,vcol,vname,vwidth;

//draw_set_color(c_blue)
//draw_set_alpha(0.75)
//draw_rectangle(view_xview[0]+100,view_yview[0]+100,view_xview[0]+400,view_yview[0]+300,0)
//draw_set_color(c_white)
//draw_set_alpha(1)
vx = x+10
vy = y+10

draw_self()
sDrawTextPixelFont(vx,vy,c_white,"What will "+myunit.name+" learn?")
if myability > 0{
    vx = myability.x+8
    vy = myability.y+22
    vname = sAbilityFindNameString(myability.abilitynum)
    vwidth = sGetTextAuditorFontWidth(vname)
    mystring = sAbilityFindTooltip(myability.abilitynum)
    sDrawTextAuditorFont(vx-round(vwidth/2),vy,c_black,c_white,vname)
    vx = x+5
    vy += 20
    sDrawTextPixelFontWidth(vx,vy,c_white,mystring,sprite_width-10)
    }


/*


//draw_text(vx,vy,targetnamestring)
sDrawTextAuditorFont(vx,vy,c_black,c_white,targetnamestring)

vy += 15
//draw_text(vx,vy,"LV " + string(startlevel))
sDrawTextAuditorFont(vx,vy,c_black,c_white,string(startlevel))
draw_set_color(c_green)
//draw_text(vx+50,vy,"+"+string(levelsup))
sDrawTextAuditorFont(vx+50,vy,c_green,c_white,"+"+string(levelsup))
//draw_text(vx+80,vy,"--->")
sDrawTextAuditorFont(vx+80,vy,c_green,c_white,"--->")
//draw_text(vx+120,vy,"LV "+string(endlevel))
sDrawTextAuditorFont(vx+120,vy,c_green,c_white,"LV. "+string(endlevel))
draw_set_color(c_white)


vy += 15//draw HP up
//draw_text(vx,vy,"HP: "+string(starthp))
sDrawTextAuditorFont(vx,vy,c_black,c_white,"HP: "+string(starthp))
//draw_text(vx-50,vy,"c"+string(hpchance))
sDrawTextAuditorFont(vx-50,vy,c_black,c_white,"c"+string(hpchance))
vcol = c_black
if addhp > 0{
    draw_set_color(c_green)
    vcol = c_green
    }
//draw_text(vx+50,vy,hpstring)
sDrawTextAuditorFont(vx+50,vy,vcol,c_white,hpstring)
//draw_text(vx+80,vy,"--->")
sDrawTextAuditorFont(vx+80,vy,vcol,c_white,"--->")
//draw_text(vx+120,vy,endhp)
sDrawTextAuditorFont(vx+120,vy,vcol,c_white,endhp)
draw_set_color(c_white)

vy += 15//draw strength up
//draw_text(vx,vy,"STR: "+string(startstrength))
sDrawTextAuditorFont(vx,vy,c_black,c_white,"STR: "+string(startstrength))
//draw_text(vx-50,vy,"c"+string(strengthchance))
sDrawTextAuditorFont(vx-50,vy,c_white,c_black,"c"+string(strengthchance))
vcol = c_black
if addstrength > 0{
    draw_set_color(c_green)
    vcol = c_green
    }
//draw_text(vx+50,vy,strengthstring)
sDrawTextAuditorFont(vx+50,vy,vcol,c_white,strengthstring)
//draw_text(vx+80,vy,"--->")
sDrawTextAuditorFont(vx+80,vy,vcol,c_white,"--->")
//draw_text(vx+120,vy,endstrength)
sDrawTextAuditorFont(vx+120,vy,vcol,c_white,endstrength)
draw_set_color(c_white)

vy += 15//draw strength up
//draw_text(vx,vy,"SKL: "+string(startability))
sDrawTextAuditorFont(vx,vy,c_black,c_white,"SKL: "+string(startability))
//draw_text(vx-50,vy,"c"+string(abilitychance))
sDrawTextAuditorFont(vx-50,vy,c_black,c_white,"c"+string(abilitychance))
vcol = c_black
if addability > 0{
    draw_set_color(c_green)
    vcol = c_green
    }
//draw_text(vx+80,vy,abilitystring)
sDrawTextAuditorFont(vx+70,vy,vcol,c_white,abilitystring)
//draw_text(vx+130,vy,"--->")
sDrawTextAuditorFont(vx+100,vy,vcol,c_white,"--->")
//draw_text(vx+170,vy,endability)
sDrawTextAuditorFont(vx+150,vy,vcol,c_white,endability)
draw_set_color(c_white)





/* */
/*  */
