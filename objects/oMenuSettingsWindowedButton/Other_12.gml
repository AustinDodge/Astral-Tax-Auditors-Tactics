//user 2 defines how the button is drawn

mytext =  "Windowed"
draw_set_font(fontSmallPixel)
linewidth = string_width(string_hash_to_newline(mytext))

selected = 0
if window_get_fullscreen() = 0{
    selected = 1
    }

