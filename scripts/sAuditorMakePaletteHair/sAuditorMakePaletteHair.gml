/// @description sAuditorMakePaletteHair()
/*this script returns a surface with an auditor's head palette drawn in index slot
1.
*/

var vpal,i,vcol,vy;

vpal = surface_create(4,5)
surface_set_target(vpal)
draw_sprite(auditorhairpalette,0,0,0)
draw_sprite(auditorhairpalette,0,1,0)
surface_reset_target()

for(i = 0; i < 5; i += 1){
    switch i{
        case 0: vcol = c_white; break;//background
        case 1: vcol = haircol4; break;//outline
        case 2: vcol = haircol2; break;//main
        case 3: vcol = haircol1; break;//highlight
        case 4: vcol = haircol3; break;//shadow
        }
    if i > 0{
        surface_set_target(vpal)
        draw_set_color(vcol)
        draw_point(1,i)
        draw_point(3,i)
        draw_set_color(c_black)
        draw_point(2,i)//draw the fade-to-black bit
        surface_reset_target()
        }
    }
draw_set_color(c_white)
return vpal;
