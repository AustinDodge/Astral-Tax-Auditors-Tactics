subheight = round(height/iterations)
subwidth = subheight

var i,v;
for (i = 0; i < shapedensity; i += 1;){
    v = irandom_range(-5,subwidth)
    ds_list_add(shapexlist,v)
    v = irandom_range(-5,subheight)
    ds_list_add(shapeylist,v)
    v = irandom(subwidth)
    ds_list_add(shapewidthlist,v)
    v = irandom(subheight)
    ds_list_add(shapeheightlist,v)
    }

