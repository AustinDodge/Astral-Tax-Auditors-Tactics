if canclick = 1 and playerturn = 1{
//if player = 1{//if the player is calling it
    //sPlayerChangePlayer()
    willchangeplayer = 1
    with oUnitParent{
        if team = playerturn{//if the unit is part of the team that just ended
            if ds_list_find_value(abilitieslist,25) = 1{//if the unit has the ability Inner Calm
                if hp < maxhp{
                    if didaction = 0{
                        sDrawUnitHealHP(id,8)
                        sDrawAbilityUsed(25,x,y)
                        }
                    }
                }
            }
        }
    instance_create(x,y,oActionControl)
//    }
    /*After oActionControl makes sure that everything is done, 'if willchangeplayer' in this
    object's step event will execute sPlayerChangePlayer, activating the AI turn.
    */
    }

/* */
/*  */
