/// @description sAuditorMakePaletteMain()
/*this script returns a surface with an auditor's suit/skin palette drawn in index slot
1.
*/

var vpal,i,vcol,vy;


vpal = surface_create(4,22)
surface_set_target(vpal)
draw_sprite(auditormainpalettebase,0,0,0)
draw_sprite(auditormainpalettebase,0,1,0)
surface_reset_target()

for(i = 0; i < 22; i += 1){
    switch i{
        case 0: vcol = c_white; break;//background
        case 1: vcol = c_white; break;//background and skipped
        case 2: vcol = jacketcol4; break;//jacket outline
        case 3: vcol = jacketcol3; break;//jacket shadow
        case 4: vcol = jacketcol2; break;//jacket main color
        case 5: vcol = jacketcol1; break;//jacket highlight
        case 6: vcol = skincol3; break;//skin outline
        case 7: vcol = skincol2; break;//skin shadow
        case 8: vcol = skincol1; break;//skin main color
        case 9: vcol = jacketcol5; break;//suit crease/lapel color
        case 10: vcol = legcol4; break;//pant outline
        case 11: vcol = legcol3; break;//pant shadow
        case 12: vcol = legcol2; break;//pant color
        case 13: vcol = shoecol1; break;//shoe color
        //case 14: vcol = jacketcol4; break;//shoe outline, change this if you want the shoe to have its own outline color.
        case 14: vcol = shoecol2; break;//shoe shadow
        case 15: vcol = tiecol2; break;//tie shadow
        case 16: vcol = tiecol1; break;//tie color
        case 17: vcol = shirtcol1; break;//shirt color
        case 18: vcol = jacketcol1; break;//pant highlight
        case 19: vcol = eyecol1; break;//eye color
        case 20: vcol = eyecol2; break;//eye shadow
        case 21: vcol = shirtcol2; break;//shirt shadow
        }
    if i > 1{
        surface_set_target(vpal)
        draw_set_color(vcol)
        draw_point(1,i-1)
        draw_point(3,i-1)
        draw_set_color(c_black)
        draw_point(2,i-1)//draw the fade to black part of the surface
        surface_reset_target()
        }
    }
draw_set_color(c_white)
return vpal;
