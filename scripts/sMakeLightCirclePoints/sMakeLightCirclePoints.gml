/// @description sMakeLightCirclePoints(pureradius,faderadius,)
/// @param pureradius
/// @param faderadius
/*this script determines the vectors for the light circles.
*/

var vx,vy,px,py,pradius,fradius,alpha,vcolor,csides,deg,i,vdir,purelength,fadelength,cir1list,cir2list,vsize,fadecolor,fadealpha;


pradius = argument0
fradius = argument1 + argument0

cir1list = circle1list
cir2list = circle2list

ds_list_clear(cir1list)
ds_list_clear(cir2list)


csides = lightcirclesides
deg = 359/csides

csides += 1

vdir = 0
//find the points for the circles
for(i = 0; i < csides; i += 1){
    if i = csides-1{//make sure it ends where it started
        vdir = 0
        }
    px = lengthdir_x(pradius,vdir)
    py = lengthdir_y(pradius,vdir)
    px = floor(px)
    py = floor(py)
    ds_list_add(cir1list,px)
    ds_list_add(cir1list,py)
    px = lengthdir_x(fradius,vdir)
    py = lengthdir_y(fradius,vdir)
    px = floor(px)
    py = floor(py)
    ds_list_add(cir2list,px)
    ds_list_add(cir2list,py)
    vdir += deg
    }

