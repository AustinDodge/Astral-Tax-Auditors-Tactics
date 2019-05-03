//draw background nebula

if __view_get( e__VW.HView, 0 ) <= sprite_get_height(spmenunebula1){
    draw_sprite(spmenunebula1,0,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 ))
    }else{
    draw_sprite(spmenunebula1,1,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 ))
    draw_sprite(spmenunebula1,2,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )-sprite_get_height(spmenunebula1)))
    }


draw_self()
draw_set_color(overcolor)
draw_set_alpha(overalpha)

draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),0)

draw_set_color(c_white)
draw_set_alpha(1)



