globalvar startonmenu,showcreditsonstartup,imouse_x,imouse_y,globaleffectsvolume,canclick,gdisplayheight,gdisplaywidth,
gameispaused,maincameraid,portraitsurface;

//these are mainly for debug, players will always start to the menu
startonmenu = 0//if the game should start at the menu or in a tactical room
showcreditsonstartup = 1//if credits should be shown

if startonmenu = 1{
    if showcreditsonstartup = 1{
        room_goto(roomCONLogo)
        }else{
        room_goto(roomStartMenu)
        }
    }else{
    room_goto(roomTacticalMap)
    }
    
imouse_x = 0
imouse_y = 0

globaleffectsvolume = 1
globalmusicvolume = 1
canclick = 1
gameispaused = 0

maincameraid = view_camera[0]

gdisplaywidth = camera_get_view_width(maincameraid)
gdisplayheight = camera_get_view_height(maincameraid)

portraitsurface = -1
