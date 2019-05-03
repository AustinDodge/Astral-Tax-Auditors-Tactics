draw_set_alpha(alpha)
draw_set_font(fontSmallPixel)
draw_set_color(textcolor)
draw_text(x,y,string_hash_to_newline(mytext))

//draw back rectangle
draw_set_color(backcolor)
draw_rectangle(sliderx,slidery,sliderx+sliderlength,slidery+sliderheight,0)
//draw position rectangle
draw_set_color(topcolor)
if sliderposition > 0{
    draw_rectangle(sliderx,slidery,sliderx+sliderposition,slidery+sliderheight,0)
    }
//draw the selection rectangle
if mouseoverslider = 1 or movingslider = 1{
    draw_set_color(selcolor)
    draw_rectangle(sliderx-1,slidery-1,(sliderx+sliderlength)+1,(slidery+sliderheight)+1,1)
    }



