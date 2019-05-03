var holosprite,holonum,i;
draw_self()
if locked = 1{
    holosprite = sLockedHologram
    }else{
    holosprite =sUnlockedHologram
    }
holonum = irandom_range(1,4)
for (i = 0; i < holonum; i += 1){
    draw_sprite_ext(holosprite,irandom(8),x,y,1,1,0,c_white,0.4)
    }

