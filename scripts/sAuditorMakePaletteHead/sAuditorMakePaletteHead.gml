/// @description sAuditorMakePaletteHead()
/*this script returns a surface with an auditor's head palette drawn in index slot
1.
*/

var vpal,i,vcol,vy;

vpal = surface_create(4,6)
surface_set_target(vpal)
draw_sprite(auditorheadpalette,0,0,0)
draw_sprite(auditorheadpalette,0,1,0)
draw_sprite(auditorheadpalette,0,2,0)
draw_sprite(auditorheadpalette,0,3,0)
surface_reset_target()

for(i = 0; i < 6; i += 1){
    switch i{
        case 0: vcol = c_white; break;//background
        case 1: vcol = skincol3; break;//outline
        case 2: vcol = skincol1; break;//main
        case 3: vcol = skincol2; break;//shadow
        case 4: vcol = eyecol1; break;//eye main
        case 5: vcol = eyecol2; break;//eye shadow
        }
    if i > 0{
        surface_set_target(vpal)
        draw_set_color(vcol)
        draw_point(1,i)
        draw_point(3,i)
        draw_set_color(c_black)
        draw_point(2,i)//draw the fade to black bit
        surface_reset_target()
        }
    }
draw_set_color(c_white)
return vpal;
