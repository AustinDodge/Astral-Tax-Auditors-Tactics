wheight = 40//the height of the window
wwidth = 200//the width
windowcolor = make_color_rgb(87,98,223)

if instance_exists(mytarget){
    x = __view_get( e__VW.XView, 0 ) + (round(__view_get( e__VW.WView, 0 )/2)-round(wwidth/2))
    if mytarget.y < __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2){
        y = __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )-105)
        }else{
        y = __view_get( e__VW.YView, 0 )+20
        }
    }
//y = view_yview[0]+view_hview[0]
//y -= 220



