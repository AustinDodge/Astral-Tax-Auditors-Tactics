//animstep += 1


if moving = 1 and pausemove = 0{
    if unitisitem = 0{//if it's not an item
        if walking = 1{
            sUnitMoveTilesDefault()
            }
        if amknocked = 1{
            sUnitMoveKnockTilesDefault()
            }
        if falling = 1{
            sUnitMoveFallDefault()
            }
        if fallingpit = 1{
            sUnitMoveFallPit()
            }
        if climbing = 1{
            sUnitMoveClimbDefault()
            }
        if bouncing = 1{
            sUnitMoveBounceTilesDefault()
            }
        //now, after movement is done, set the tile shadow stuff
        if walking = 1 {
            lasttile.drawshadow = 1
            lasttile.shadowunit = id
            mytile.drawshadow = 1
            mytile.shadowunit = id
            
            }
        if amknocked = 1{
            if walkstep < tilemovespeed/2{
                nexttile.drawshadow = 1
                nexttile.shadowunit = id
                mytile.drawshadow = 1
                mytile.shadowunit = id
                }else{
                lasttile.drawshadow = 1
                lasttile.shadowunit = id
                mytile.drawshadow = 1
                mytile.shadowunit = id
                }   
            }
        if bouncing = 1{
            lasttile.drawshadow = 1
            lasttile.shadowunit = id
            mytile.drawshadow = 1
            mytile.shadowunit = id
            }
        if stunnedstatus = 1{//don't animate if stunned
            animstep = 0
            }
        }else{//if unit is an item, follow item move rules
        //no item move rules for now
        }
    }

if shuddering = 1{
    x = bx
    y = by
    if shudderstep < 2{//if the unit shudders away from the start coordinated
        switch facing{
            case 0: x += 2; break;//n
            case 1: x -= 2; break;//e
            case 2: x -= 2; break;//s
            case 3: x += 2; break;//w
            }
        }
    shudderstep += 1
    if shudderstep > 4{//if the unit is done shuddering one step
        shuddercount -= 1
        shudderstep = 0
        }
    if shuddercount = 0{
        shuddering = 0
        }
    
    }

if jumping = 1{//jumping uses the same variables as shuddering
    if anim <= 1{//only animate jumping if animation is walking/still
        x = bx
        y = by
        
        if shudderstep < 10{//if the unit shudders away from the start coordinated
            y -= 3
            }
        }
    shudderstep += 1
    if shudderstep > 19{//if the unit is done shuddering one step
        shuddercount -= 1
        shudderstep = 0
        }
    if shuddercount = 0{
        var keepjumping;
        keepjumping = 0
        if ds_list_find_value(abilitiesusedlist,46) = 1{//keep jumping if unit is using diversion
            if playerturn = team{
                keepjumping = 1
                }
            }
        if keepjumping = 0{
            jumping = 0
            }else{//keep
            shuddercount = 1
            }
        }    
    }








































