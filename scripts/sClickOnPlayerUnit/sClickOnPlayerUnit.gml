/// @description sClickOnPlayerUnit(sunit)
/// @param sunit
/*this script describes what to do when the player clicks on an auditor. It's called
by oIntControl
*/

var vunit;
vunit = argument0

sunit = vunit
if !instance_exists(oWindowParent){//don't select units if the attack window is open
    clickmode = 1
    
    sDestroyRangeTiles()
    with oInventoryButton{
        instance_destroy()
        }
    //audio_play_sound(soundChirpUp1,2,0)    
    if vunit.unitisobject = 0 and vunit.unitisitem = 0{
        
        if vunit.movepoints > 0{
            sFindMoveRange(vunit)
            if vunit.attacked = 0{
                sFindAttackRange(vunit,vunit.mytile)
                sMakeAttackRange(vunit.weaponhealing)
                }
            //sMakeButtons(vunit)
            }else{
            if vunit.turnover = 0{
                //sMakeButtons(vunit)
                if vunit.attacked = 0{
                    sFindAttackRange(vunit,vunit.mytile)
                    sMakeAttackRange(vunit.weaponhealing)
                    }
                }
            }
        if vunit.team = 1{
            if vunit.turnover = 0{
                sMakeButtons(vunit)
                }
            }
        sMakeInventoryButtons(vunit)
        if inelevator = 1{
            sDestroyRangeTiles()
            }
        }
    }
