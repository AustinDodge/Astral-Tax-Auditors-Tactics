x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 )

middlex = __view_get( e__VW.XView, 0 ) + round(camrealwidth/2)
middley = __view_get( e__VW.YView, 0 ) + round(camrealheight/2)

windowheight = sprite_height
windowwidth = sprite_width

windowoffsetx = round(windowwidth/2)
windowoffsety = round(windowheight/2)

x = middlex - windowoffsetx
y = middley - windowoffsety

image_speed = 0.2



starthp = 0
endhp = 0
addhp = 0
startstrength = 0
endstrength = 0
addstrength = 0
startskill = 0
endskill = 0
addskill = 0

hpchance = 0
strengthchance = 0
skillchance = 0

startlevel = 0
addlevel = 0
endlevel = 0

levelsup = 0

target = 0//the unit that the level functions will affect
targetnamestring = ""

hpstring = "+"
strengthstring = "+"
skillstring = "+"


