//user 2 defines how the button is drawn

mytext =  "Fullscreen"
draw_set_font(fontSmallPixel)
linewidth = string_width(string_hash_to_newline(mytext))

selected = 0
if window_get_fullscreen() = 1{
    selected = 1
    }

