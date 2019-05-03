/// @description sMakeSettingsMenuSound()
/*Makes the sound settings menu. Can be called from anywhere, but assumes the game is already paused
*/
var vingame;
vingame = 0
with oMenuButtonParent{
    instance_destroy()
    }
if !instance_exists(oSettingsMenu){
    instance_create(x,y,oSettingsMenu)
    if instance_exists(oPauseMenu){
        oSettingsMenu.couldclick = oPauseMenu.couldclick
        oSettingsMenu.couldmovecamera = oPauseMenu.couldmovecamera
        oSettingsMenu.pauseonexit = 1//if the settings menu should go back to pause screen or not
        vingame = 1
        }
        
    with oSettingsMenu{
        event_perform(ev_other,ev_user0)
        ingame = vingame
        }        
    }
