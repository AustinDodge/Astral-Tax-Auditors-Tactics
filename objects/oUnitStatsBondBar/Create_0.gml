/// @description Insert description here
// You can write your code in this editor
clicked = 0
parent = 0
oversprite = 0
canbeclicked = 1

mystring = 0

isitem = 0
isweapon = 0
isarmor = 0

posmod = 0

inventorynumberwidth = sprite_get_width(spritemusenumbers)
inventorynumberheight = sprite_get_height(spritemusenumbers)

mouseon = 0
glowsprite = -1
glowing = 0
glowalpha = 0
glowon = 1//if the glow should go up or down
canglow = 1//if the button can glow

blendcolor = c_white

tipwidth = 0//width of the tooptip in pixels
tipsep = string_height(string_hash_to_newline("L"))//the number of pixels between lines

tipheight = 1
tipborder = 0//the number of pixels for the border
tipheight += tipborder*2//add border


myunit = -4
bondlevel = 0