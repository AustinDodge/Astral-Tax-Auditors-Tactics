/// @description sDoTooltip(x,y,string,width,border,color,sep)
/// @param x
/// @param y
/// @param string
/// @param width
/// @param border
/// @param color
/// @param sep
/*Called in any event of a thing that has a tooltip. String is the text,
width is the width of the tip(minus the border), and border is how much of a border
between the edge of the tip box and the text is included. Color is the color of the box,
0 for default blue. X and Y are the upper-left corner. Sep is the amount to separate the
lines in the text.

This script sets the relevant variables in oToolTipControl, which will draw the tip over everything else.
Can be called at any time
*/

var vstring,vwidth,vborder,vcol,vx,vy,vheight,vsep;
vx = argument0
vy = argument1
vstring = argument2
vwidth = argument3
vborder = argument4
vcol = argument5
vsep = argument6

//position tooltip to the left if it would go off the page
if vx+vwidth > __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ){
    vx -= vwidth
    vx -= 32
    }

vheight = sGetTextPixelFontHeight(vstring,vsep,vwidth)

//potition tooltip above if it would go off the page
if vy+vheight > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ){
    vy -= vheight
    vy -= 32
    }

if vcol = 0{
    vcol = make_color_rgb(87,98,223)//default color
    }
    
with oToolTipControl{
    mx = vx
    my = vy
    mstring = vstring
    mwidth = vwidth
    mborder = vborder
    mcolor = vcol
    msep = vsep
    
    drawtip = 1
    }
/*
draw_set_color(vcol)
draw_set_alpha(0.78)
draw_rectangle(vx,vy,vx+vwidth+(vborder*2),vy+vheight+(vborder*2),0)

vx += vborder
vy += vborder
draw_set_color(c_white)
draw_set_alpha(1)
sDrawTextPixelFontWidth(vx,vy,c_white,vstring,vwidth)

    
