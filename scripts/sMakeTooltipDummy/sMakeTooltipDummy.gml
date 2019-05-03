/// @description sMakeTooltipDummy(sprite,x,y,string,width,border,color,separation,parent)
/// @param sprite,x,y,string,width,border,color,separation,parent
/*creates a dummy tooltip object, usually to go over an interface piece that doens't have an
in-game object to check for collisions.
sprite is the mask that is used to check for mouse collisions. Parent works like with buttons, moving the
dummy around relative to the parent, and can be used to selectively destroy dummies.
leave values at 0 for default except sprite, x, y, and string
*/

var vsprite,vx,vy,vstring,vwidth,vborder,vcolor,vseparation,vparent,vdummy;
vsprite = argument0
vx = argument1
vy = argument2
vstring = argument3
vwidth = argument4
vborder = argument5
vcolor = argument6
vseparation = argument7
vparent = argument8

draw_set_font(fontSmallPixel)

vdummy = instance_create(vx,vy,oTooltipDummy)
if vsprite <= 0{
	vsprite = spcombatcardsquare
	}
vdummy.sprite_index = vsprite
vdummy.tipstring = vstring
if vwidth != 0{
	vdummy.tipwidth = vwidth
	}else{
	vdummy.tipwidth = 150
	}
if vborder != 0{
	vdummy.tipborder = vborder
	}else{
	vdummy.tipborder = 3
	}
vdummy.tipcolor = vcolor
if vseparation != 0{
	vdummy.tipseparation = vseparation
	}else{
	vdummy.tipseparation = string_height(string_hash_to_newline("L"))
	}
if vparent != 0{
	vdummy.myparent = vparent
	vdummy.depth = vparent.depth-1
	vdummy.dx = vdummy.x-vparent.x
    vdummy.dy = vdummy.y-vparent.y
	}else{
	vdummy.myparent = -1
	vdummy.dx = 0
	vdummy.dy = 0
	}
	
return vdummy;
