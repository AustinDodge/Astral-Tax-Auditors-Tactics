/// @description sAuditorMakeColors()
/*this script uses random but constrained h,s, and v values to make all the colors needed to draw an auditor. It's
called in the auditors init event.
*/

var h,s,v;

h = irandom_range(0,45)
//h = irandom_range(0,255)
//allow all colors, but trend towards a hue of twenty, midway between red and yellow.
//h = round(mean(irandom_range(0,255),irandom_range(0,255)))
//h -= 125
//if h < 0{
//    h += 255
//    }
s = irandom_range(230,255)
//s = round((irandom_range(100,220)+irandom_range(100,220))/2)
v = round((irandom_range(20,230)+irandom_range(20,230))/2)
haircol1 = make_color_hsv(h,s*.8,lerp(v,255,.60))//highlight
haircol2 = make_color_hsv(h,s,v)//color
haircol3 = make_color_hsv(h,s*.9,v*.7)//shadow
haircol4 = make_color_hsv(h,s*.9,v*.4)//outline

//skin color
h = irandom_range(17,23)
s = irandom_range(120,160)
v = irandom_range(40,255)
//show_message(v)
skincol1 = make_color_hsv(h,s,v)//main color
skincol2 = make_color_hsv(h,s,v*.8)//shadow
skincol3 = make_color_hsv(h,s,v*.3)//outline

h = irandom_range(0,255)
s = irandom_range(0,100)
v = irandom_range(175,255)
shirtcol1 = make_color_hsv(h,s,v)//main color
shirtcol2 = make_color_hsv(h,s*.9,v*.7)//shadow
shirtcol3 = make_color_hsv(h,s*.9,v*.4)//outline

h = irandom_range(0,255)
s = irandom_range(150,255)
v = irandom_range(100,255)
tiecol1 = make_color_hsv(h,s,v)//main color
tiecol2 = make_color_hsv(h,s*.9,v*.7)//shadow

h = irandom_range(0,255)
s = irandom_range(0,200)
v = irandom_range(80,255)
jacketcol1 = make_color_hsv(h,s*.8,lerp(v,255,.40))//highlight
jacketcol2 = make_color_hsv(h,s,v)//main color
jacketcol3 = make_color_hsv(h,s,v*.7)//shadow
jacketcol4 = make_color_hsv(h,s,v*.4)//outline
jacketcol5 = make_color_hsv(h,s*.9,v*.55)//crease/lapel


legcol1 = jacketcol1
legcol2 = jacketcol2
legcol3 = jacketcol3
legcol4 = jacketcol4

h = irandom_range(0,255)
s = irandom_range(230,255)
v = irandom_range(80,150)

shoecol1 = make_color_hsv(h,s,v)//main color
shoecol2 = make_color_hsv(h,s,v*.7)//shade color


h = irandom_range(21,185)
s = irandom_range(20,240)
v = irandom_range(40,140)
eyecol1 = make_color_hsv(h,s,v)//main eye color
eyecol2 = make_color_hsv(h,s,v*.7)//shadow eye color



















