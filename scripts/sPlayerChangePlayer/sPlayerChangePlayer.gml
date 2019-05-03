/// @description sPlayerChangePlayer()
/*this script iteates up one player. If the playerturn is greater than the number of
players(usually two, the player and the enemy AI), it goes to player 1, the human
player. Usually it just switches between human and enemy, but if allowaiturns is set to
0 in oPlayerControl, it will just reset the units moves and start the player turn over.
*/
var vteam;
sDestroyRangeTiles()
with oButton{
    instance_destroy()
    }
with oTrickShotControl{
    instance_destroy()
    }
with oTrickShotIndicator{
    instance_destroy()
    }
canclick = 0
with oPlayerControl{
    vteam = playerturn//the team that was active before the teams changed
    if allowaiturns = 1{
        playerturn += 1
        if playerturn = 2{//if it's the AI turn
            //instance_create(x,y,oAIControl)
            transitiondone = 0
            animatingtransition = 1
			with oKOAuditor{
                mykocount -= 1
                koturns = mykocount
                if mykocount < 0{
                    amidead = 1
                    instance_destroy()
                    }
                }
            }
        if playerturn > players{
            playerturn = 1
            instance_create(__view_get( e__VW.XView, 0 )+round(camrealwidth/2),__view_get( e__VW.YView, 0 )-100,oTurnIndicator)
            //canclick = 1
            animatingtransition = 1
            transitiondone = 0
            sStartElevatorAnimation()
            if nemesisonmap = 0{
                if turnstillnemesis >= 0{
                    turnstillnemesis -= 1
                    }
                if turnstillnemesis = 0{
                    instance_create(x,y,oNemesisControl)
                    }else{
                    instance_create(x,y,oActionControl)
                    }
                }
            }
        }else{
        playerturn = 1
        }
    }
with oUnitParent{
    if aiactivated = 1{
        turnover = 0
        }else{
        turnover = 1
        }
    ds_list_clear(climbedonlist)
    moved = 0
    attacked = 0
    didaction = 0
    knockdamage = 0
    cancancelmove = 1
    
    movepoints = moverange
    pmovepoints = movepoints
    
    //resolve status effects
    if team = playerturn{
        amdistracting = 0
        if stunnedstatus > 0{
            if showstunnedstatus = 1{
                stunnedstatus -= 1
                if stunnedstatus = 0{
                    showstunnedstatus = 0
                    }
                }
            }
        if explodestatus > 0{
            if showexplodestatus > 0{
                explodestatus -= 1
                if explodestatus = 0{
                    showexplodestatus = 0
                    }
                }
            }
        sUnitAbilitiesCooldown()
        sUnitResetUsedAbilities()
        }//end if team
    }




































