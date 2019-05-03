var vind,vspr,vcolor;
vind = 0
vspr = stramterminaln


if parent > 0{
    fallfadestage = parent.fallfadestage
    vcolor = c_white
    if fallfadestage != 0{
        vcolor = merge_color(c_white,c_black,fallfadestage/fallfadesteps)
        }
    //depth = parent.depth-1
    if parent.door = exitdoor{
        if exitlocked = 1{
            vind = 2
            }else{
            vind = 1
            }
        }
    switch parent.door{
        case 2: vspr = stramterminale; break;
        case 3: vspr = stramterminals; break;
        case 4: vspr = stramterminalw; break;
        }
    }
draw_sprite_ext(vspr,vind,x,y,1,1,0,vcolor,1)

