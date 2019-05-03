/// @description sPauseGame(1toppause_2settingspause)
///@param 1toppause_2settingspause
/*Pauses the game
*/
var ammakingmap,amanimatingroom,initpause,isaction,alreadypaused,whichmenu;

whichmenu = argument0


keyboard_clear(vk_escape)//make sure a second event isn't registered for the menu
io_clear()

ammakingmap = 0//if the map is being made, don't allow pausing
amanimatingroom = 0//if the map is being animated, like players are leaving, don't animate
isaction = 0//if oActionControl currently exists
initpause = 0//if the game wasn't previously paused
canpause = 0
alreadypaused = 0

//check if unpauseable conditions exist
if instance_exists(oActionControl){
    isaction = 1
    }
if instance_exists(oMapCreatorControl){
    ammakingmap = 1
    }
if gameispaused{
    alreadypaused = 1
    }


if isaction = 0 and ammakingmap = 0 and amanimatingroom = 0{
    canpause = 1
    }
if alreadypaused = 0{
	initpause = 1
	}



if canpause = 1{
	//if the first pause, set everything up
	if initpause = 1{//if pausing for the first time
		instance_create_depth(x,y,-10000,oPauseControl)
		gameispaused = 1
		}
	//clear all previously existing pause menus
	with oMenuParent{
		instance_destroy()
		}
	with oMenuButtonParent{
		instance_destroy()
		}
	with oMenuSliderParent{
		instance_destroy()
		}
	//previous menus cleared, now create the called menu
	switch whichmenu{
		case 1: instance_create(x,y,oPauseMenu);break;
		case 2: instance_create(x,y,oSettingsMenu); break;
		}
    }
