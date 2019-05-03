var vx,vy,vval,gx,gy,vstartx,vstarty,vind;

if !surface_exists(mysurface){
    mysurface = surface_create(spritewidth*gwidth,spritewidth*gheight)
    }
    
surface_set_target(mysurface)

vx = 0//set in create
vy = 0

vstartx = vx
vstarty = vy

gx = 0
gy = 0

vval = 0

while gy < gheight{
    vind = 0
    vval = ds_grid_get(mygrid,gx,gy)
    if vval = 0{
        //the non-text pixels
        //if irandom(whitebgamount)<= 0{
        if irandom(3) = 0{
            vind = irandom_range(0,3)
            }else{
            vind = irandom_range(1,3)
            }
        //vind = irandom(3)
        }else{
        //the text pixels
        //if irandom(blacktextamount) <= 1{
        if irandom(9) <= 1{
            vind = irandom(3)
            }else{
            vind = 0
            }
        }
    draw_sprite(mysprite,vind,vx,vy)
    vx += spritewidth
    gx += 1
    if gx >= gwidth{
        gx = 0
        vx = vstartx
        gy += 1
        vy += spritewidth
        }
    }

surface_reset_target()
draw_surface(mysurface,drawx,drawy)

draw_set_color(c_black)
draw_set_alpha(fadealpha)
draw_rectangle(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
draw_set_alpha(1)

if saveimage = 1{
    if imagenum < howmanyframes{
        imagenum += 1
        surface_save(mysurface,"titleimage"+string(imagenum)+".png")
        }else{
        saveimage = 0
        imagenum = 0
        }
    }

