
var vbutton;

image_speed = 0

open = 0
mx = 0
closedx = -68
mx = closedx
showwhich = 0//0 stats, 1 abilities
myunit = -1
mxoff = 0
myoff = 0

couldclick = canclick
couldmovecamera = canmovecamera

canclick = 0
canmovecamera = 0

vbutton = instance_create_depth(x+(sprite_width-16),y,depth-1,oUnitInfoCancelButton)
vbutton.parent = id
vbutton.myunit = sunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }

sWindowFindCenter()


//display parameters


dispname = "-"
dispstr = "-"
dispskl = "-"
dispacc = "-"
dispint = "-"
dispdef = "-"
dispspd = "-"
disphp = "-"
dispmaxhp = "-"
displevel = "-"
dispxp = "-"
dispmov = "-"
dispvrt = "-"