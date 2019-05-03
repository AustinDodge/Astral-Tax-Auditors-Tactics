canclick = oPauseControl.couldclick
canmovecamera = oPauseControl.couldmovecamera

with oMenuButtonParent{
	instance_destroy()
	}
with oMenuSliderParent{
	instance_destroy()
	}
with oMenuParent{
	instance_destroy()
	}
with oPauseControl{
	instance_destroy()
	}
gameispaused = 0

if room = roomStartMenu{
	sMakeMainMenuTop()
	}