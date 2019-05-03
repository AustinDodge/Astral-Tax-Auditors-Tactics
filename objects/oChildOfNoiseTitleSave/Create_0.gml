mysprite = sprtitlepixels


mygrid = sTitleGetGrid()
gwidth = ds_grid_width(mygrid)
gheight = ds_grid_height(mygrid)
spritewidth = sprite_get_width(mysprite)
logowidth = spritewidth*gwidth
logoheight = spritewidth*gheight

centerx = round(__view_get( e__VW.WView, 0 )/2)
centery = round(__view_get( e__VW.HView, 0 )/2)

drawx = centerx-round(logowidth/2)
drawy = centery-round(logoheight/2)

whitebgamount = 0
blacktextamount = -7
blackup = 1//if the black text should be increased or decreased

mysurface = surface_create(spritewidth*gwidth,spritewidth*gheight)
howmanyframes = 60

imagenum = 0
saveimage = 0

fadein = 1
fadealpha = 1
fadeout = 0


