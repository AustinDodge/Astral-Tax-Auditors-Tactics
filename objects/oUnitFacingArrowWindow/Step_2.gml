if myunit > 0{
    x = __view_get( e__VW.XView, 0 ) + (round(__view_get( e__VW.WView, 0 )/2)-round(wwidth/2))
    if myunit.y < __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2){
        y = __view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )-105)
        }else{
        y = __view_get( e__VW.YView, 0 )+20
        }
    }
        

