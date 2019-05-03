//change all variables that the options can change
var vval;
with oMenuSliderEffectsVolume{
    //make an even two-digit percentage
    vval = sliderposition/sliderlength
    vval *= 100
    vval = round(vval)
    vval /= 100
    globaleffectsvolume = vval
    }
    
if oMenuSettingsFullscreenButton.selected = 1{
    if window_get_fullscreen() = 0{
        sCameraChangeResolution(display_get_width(),display_get_height(),1)
        }
    }else{
    if window_get_fullscreen() = 1{
        sCameraChangeResolution(1500,850,0)
        }
    }

//done changing variables, now return to top pause menu or main menu if not in game
if room = roomStartMenu{
	sPauseResume()
	}else{
	sPauseGame(1)
	}