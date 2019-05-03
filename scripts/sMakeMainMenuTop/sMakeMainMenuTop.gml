/// @description sMakeMainMenuTop()
/*makes the buttons for the main menu
*/

var vbutton;
instance_create(30,200,oNewGameButton)
instance_create(30,220,oTopMenuSettingsButton)
instance_create(30,240,oTopMenuQuitButton)



with oButton{
    depth = -10000
    event_perform(ev_other,ev_user2)
    }


