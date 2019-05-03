/// @description sGNoiseChangeShape(vx,vy,width,height,pos)
/// @param vx
/// @param vy
/// @param width
/// @param height
/// @param pos
/*changes the size and position of a gnoise shape element. Change it randomly unless the shape is getting
out of bounds.
*/

var vx,vy,vwidth,vheight,vpos,vmod,vmodamount;

vx = argument0
vy = argument1
vheight = argument2
vwidth = argument3
vpos = argument4

vmodamount = 1

vmod = irandom_range(0-vmodamount,vmodamount)
//x
if vx < 0{
    vmod = vmodamount
    }
if vx > subwidth{
    vmod = 0-vmodamount
    }
vx += vmod
//y
vmod = irandom_range(0-vmodamount,vmodamount)
if vy < 0{
    vmod = vmodamount
    }
if vy > subheight{
    vmod = 0-vmodamount
    }
vy += vmod
//width
vmod = irandom_range(0-vmodamount,vmodamount)
vmax = subwidth/2
if vwidth <= 1{
    vmod = vmodamount
    }
if vwidth >= vmax{
    vmod = 0-vmodamount
    }
vwidth += vmod
//height
vmod = irandom_range(0-vmodamount,vmodamount)
vmax = subheight/2
if vheight <= 1{
    vmod = vmodamount
    }
if vheight >= vmax{
    vmod = 0-vmodamount
    }
vheight += vmod

ds_list_replace(shapexlist,vpos,vx)
ds_list_replace(shapeylist,vpos,vy)
ds_list_replace(shapewidthlist,vpos,vwidth)
ds_list_replace(shapeheightlist,vpos,vheight)


















