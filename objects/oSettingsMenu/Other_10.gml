//determine center of screen

menuwidth = 300
menuheight = 200

sMenuGetRoomCoordinates(0,0)
//make menu buttons
var vx,vy,vbutton;
vx = x+10
vy = y+10
//vbutton = instance_create(vx,vy,oMenuPauseResumeButton)
vbutton = instance_create(vx,vy,oMenuSliderEffectsVolume)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    //event_perform(ev_other,ev_user15)//button position init, probably unnecessary
    event_perform(ev_other,ev_user0)//slider init
    }
vy += 30
//fullscreen/windowed buttons
vbutton = instance_create(vx,vy,oMenuSettingsFullscreenButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user15)
    event_perform(ev_other,ev_user2)
    }
vbutton = instance_create(vx+80,vy,oMenuSettingsWindowedButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user15)
    event_perform(ev_other,ev_user2)
    }
//make the window size button
vy += 30
vbutton = instance_create_depth(vx,vy,depth-1,oMenuSettingsWindowSizeButton)
vbutton.parent = id
with vbutton{
	event_perform(ev_other,ev_user15)
	event_perform(ev_other,ev_user2)
	}

//regular buttons made, make cancel and accept
vx = x + 10
vy = y + menuheight - 15
vbutton = instance_create(vx,vy,oMenuSettingsAcceptButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user15)
    event_perform(ev_other,ev_user2)
    }

vx = x + (menuwidth-50)
vbutton = instance_create(vx,vy,oMenuSettingsCancelButton)
vbutton.parent = id
vbutton.depth = depth-1
with vbutton{
    event_perform(ev_other,ev_user15)
    event_perform(ev_other,ev_user2)
    }

gnoise = sStartGNoise(menuwidth,menuheight,2,0.3,7,c_black,c_dkgray)

ingame = 0//if the settings menu was made in-game or at the top menu
canclick = 0


