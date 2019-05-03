var vx,vy,vstr,vydown,vxacross;

draw_self()

vx = x
vy = y
vydown = 19
vxacross = 24

//draw name
sDrawTextAuditorFont(vx+5,vy+4,c_black,c_white,dispname)

//draw level
vx += 80
sDrawTextAuditorFont(vx+5,vy+4,c_black,c_white,displevel)

//draw stats
vx = x+53
vy = y+28
//skl
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispskl)
//acc
vx += vxacross
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispacc)
//spd
vx += vxacross
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispspd)
//mov
vx += vxacross
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispmov)

//str
vx = x+53
vy = y+51
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispstr)
//def
vx += vxacross
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispdef)
//int
vx += vxacross
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispint)
vx += vxacross
sDrawTextAuditorFont(vx,vy,c_black,c_white,dispvrt)

//hp
vx = x+65
vy = y+66
vstr = disphp+"/"+dispmaxhp
sDrawTextAuditorFont(vx,vy,c_black,c_white,vstr)

//xp
vx = x+65
vy = y+81
vstr = dispxp+"/"+"100"
sDrawTextAuditorFont(vx,vy,c_black,c_white,vstr)


//draw unit portrait
if myunit > 0{
	sDrawUnitPortrait(myunit,x+2,y+19,0)
	}


