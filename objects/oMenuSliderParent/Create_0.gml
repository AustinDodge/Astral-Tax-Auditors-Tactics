parent = -1//parent object the slider sits on top of

sliderlength = 20//the length in pixels of the slider
sliderdefault = 20//the position of the slider on startup
sliderposition = sliderdefault

sliderx = x+20//the position relative to the x position of the object where the slider starts
sliderendx = sliderx + sliderlength//the point where the slider ends


sliderheight = 5//the height of the slider


topcolor = c_gray//the color of the moving bar
backcolor = c_white//the color of the static background bar
selcolor = c_yellow//the color of the selection highlight
textcolor = backcolor//the color to draw the text

alpha = 1//the transparency of the slider

draw_set_font(fontSmallPixel)
mytext = "default"
myheight = string_height(string_hash_to_newline(mytext))

slidery = y+(round(myheight/2)-round(sliderheight/2))//the top y position of the slider

movingslider = 0//if the player is currently moving the slider
mouseoverslider = 0//if the mouse is over the slider object

colx1 = sliderx//the top x position of the slider
coly1 = y//top y position
colx2 = colx1+sliderlength
coly2 = coly1 + myheight


