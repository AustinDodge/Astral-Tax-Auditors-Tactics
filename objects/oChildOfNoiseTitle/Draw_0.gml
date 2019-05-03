var vx,vy,vval,gx,gy,vstartx,vstarty,vind;

vx = drawx//set in create
vy = drawy

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

