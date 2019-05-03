var vtile,vunit,vbutton,i,vsize,vthing,vdepth,vcheck,didclick,skiptile,vcancel;
vtile = 0
vunit = 0
vbutton = 0
vthing = 0
vsize = 0
vcheck = 0
vdepth = 1
vcancel = 0
i = 0
didclick = 0//if the mouse was clicked at all this step
skiptile = 0//if checking the cursor under the tile should be skipped - i.e., if we're selecting a unit, stile should be
//the tile of the cursor under the unit, not the tile under the cursor.


if collision_point(imouse_x,imouse_y,oButton,0,0) > 0{
    vcancel = 1
    }

if canclick = 1 and playerturn = 1 and vcancel = 0{//only do anything on the players turn and if the player can click at all
    if clickmode != -5{//clickmode 0 is nothing selected, no move range, no attackrange, etc. 5 and up is interface-only click mode
        
        vdepth = 10000
        //if there is a moverange, don't select units, select tiles.
        if !instance_exists(oMoveRange){
            with oUnitParent{//find the unit under the cursor
                if point_distance(imouse_x,imouse_y,x,y,) < intradius{//limit collision checks by only checking within a certain distance
                    if collision_point(imouse_x,imouse_y,id,1,0){//if the unit is right under the cursor
                        if depth < vdepth{//if it's at a lower depth than whatever was last checked
                            vthing = id
                            vdepth = vthing.depth
                            }
                        }
                    }      
                }
            if vthing > 0{//make sure that an item isn't picked over the unit on its square
                if object_is_ancestor(vthing.object_index,oItemParent){
                    if ds_grid_get(unitposgrid,vthing.mx,vthing.my) > 0{
                        vthing = ds_grid_get(unitposgrid,vthing.mx,vthing.my)
                        }
                    }
                }
            }
        //found the unit under the cursor with the lowest depth
        if vthing > 0{//if there's a unit under the cursor
            dunit = vthing
            //if clickmode = 0{//if there isn't a moverange open
            vthing = dunit.mytile
            skiptile = 1//skip finding the tile under the cursor, it's dunit's tile
                //}
            }
        //now find the tile under the cursor
        if skiptile = 0{
            vthing = -1
                           
            vthing = sGetTileUnderCursor()
            if vthing > 0{
                if vthing.occupied > 0{
                    if dunit != vthing.occupied{
                        dunit = vthing.occupied
                        }
                    }
                }else{
                //if the mouse isn't over a tile, put the cursor back over sunit's tile
                if sunit > 0{
                    vthing = sunit.mytile
                    }
                }
            }
            //now we have the tile under the cursor
        //if the cursor is over the interface, return to sunit
        if imouse_y > __view_get( e__VW.YView, 0 )+(camrealheight-50){
            if sunit > 0{
                vthing = sunit.mytile
                }
            }
        
        if vthing > 0{
            if vthing != stile{//if the cursor wasn't already over this map tile
                stile = vthing
                if instance_exists(oUnitFacingArrow){
                    if oUnitFacingArrow.myunit > 0{
                        stile = (oUnitFacingArrow.myunit).mytile
                        }
                    }
                /*with oMapTile{
                    onxaxis = 0
                    onyaxis = 0
                    if mx = stile.mx{
                        onxaxis = 1
                        }
                    if my = stile.my{
                        onyaxis = 1
                        }
                    if stile = id{
                        onxaxis = 0
                        onyaxis = 0
                        }
                    }
                oTileCursor.x = stile.x
                oTileCursor.y = stile.y
                oTileCursor.mytile = stile
                oTileCursor.depth = stile.depth-6
                */
                sTileCursorSetPosition(stile)
                if sunit > 0 and instance_exists(oMoveRange) and clickmode != 5{//if there is currently an sunit looking for a moverange
                    if stile.cango = 1 and stile.occupied = 0{
                        with oUnitActivationView{
                            instance_destroy()
                            }
                        with oAttackRange{//reset the attackrange
                            instance_destroy()
                            }
                        with oAttackIcon{
                            instance_destroy()
                            }
                        with oHealIcon{
                            instance_destroy()
                            }
                        with oMapTile{
                            canattack = 0
                            attackable = 0
                            }
                        if sunit.attacked = 0{//if the unit hasn't already attacked
                            sFindAttackRange(sunit,stile)
                            sMakeAttackRange(sunit.weaponhealing)
                            }//if the unit has already attacked, don't draw the attack range
                        
                        
                        
                        
                        if sunit.team = 1{
                            //logic to make exclamation points appear over enemy units that will be activated
                            with oUnitParent{
                                if aiactivated = 0{
                                    if team != sunit.team{
                                        if ds_grid_get(myinfluencemap,stile.mx,stile.my) = 1{
                                            if !instance_exists(oUnitActivationView){
                                                instance_create(x,y,oUnitActivationView)
                                                }
                                            if ds_list_find_index(oUnitActivationView.myunitlist,id) = -1{
                                                ds_list_add(oUnitActivationView.myunitlist,id)
                                                }
                                            }
                                        }
                                    }
                                }
                            //draw the movement path for the unit
                            sTileFindMovePathDraw(stile)
                            }
                        
                        }else{//if the cursor is over a tile that can't be moved to
                        //draw the attack range from the current tile
                        with oAttackRange{
                            instance_destroy()
                            }
                        with oAttackIcon{
                            instance_destroy()
                            }
                        with oHealIcon{
                            instance_destroy()
                            }
                        with oUnitActivationView{
                            instance_destroy()
                            }
                        with oMapTile{
                            canattack = 0
                            attackable = 0
                            }
                        with oMoveRange{
                            onmovepath = 0
                            }
                        sFindAttackRange(sunit,sunit.mytile)
                        sMakeAttackRange(sunit.weaponhealing)
                        }
                    }//end actions over move range
                }//end selecting new stile
            }else{//if there's no unit or tile under the cursor
            if stile != 0{//reset stile
                stile = 0
                //sunit = 0
                sbutton = 0
                }
                
            }
        if instance_exists(oButton){
            vbutton = instance_nearest(imouse_x,imouse_y,oButton)
            if collision_point(imouse_x,imouse_y,vbutton,0,0) = noone{
                vbutton = 0
                }
            }
        
        }//end clickmode = -5, it might be better to just delete the whole bracket
        //NOTHING IS ACTUALLY DONE IN THIS PART! logic is performed to determine what units or tiles actions will be performed on,
        //but that's it.
    
    
    if clickmode != 5{
        if mouse_check_button_pressed(mb_left) and collision_point(imouse_x,imouse_y,oUnitStatsWindow,1,0) = noone and !keyboard_check(vk_control){//if the left mouse is clicked
        /*clicking the left mouse button selects units and presses buttons.
        */
            /*if instance_exists(oCancelMoveButton){
                if collision_point(imouse_x,imouse_y,oCancelMoveButton,0,0) = noone{//if the mouse isn't clicking on oCancelMoveButton,
                    didclick = 1
                    }
                }*/
            if vbutton > 0{
                if collision_point(imouse_x,imouse_y,vbutton,0,0) > 0{
                    didclick = 1
                    }
                }
            if clickmode != 5{
                if dunit > 0 and didclick = 0{//if the cursor is over a unit
                    sDestroyRangeTiles()
                    if clickmode = 1{//if a moverange is open
                        sDestroyRangeTiles()
                        with oButton{
                            instance_destroy()
                            }
                        with oMapTile{
                            cango = 0
                            parent = 0
                            //mydistance = 0
                            }
                        clickmode = 0
                        if !collision_point(imouse_x,imouse_y,dunit,1,0) and oTileCursor.mytile != dunit.mytile{
                            //audio_play_sound(soundChirpDown1,2,0)
                            sSoundPlayEffect(soundChirpDown1,1,0,0)
                            }
                        }//end stopping moverange
                    if collision_point(imouse_x,imouse_y,dunit,1,0) or oTileCursor.mytile = dunit.mytile{//double check the mouse cursor is over the sunit or it's tile
                        if !collision_point(imouse_x,imouse_y,oButton,0,0){
                            sunit = dunit//make sunit the unit under the cursor
                            sSoundPlayEffect(soundChirpUp1,1,0,0)
                            sClickOnPlayerUnit(sunit)
                            didclick = 1
                            
                            with oUnitStatsWindow{
                                myunit = sunit
                                event_perform(ev_other,ev_user0)
                                }
                            }
                        }
                    }
                }
            
            }//end checking left click
        }//end non-mode specific non-interface left click
        
    
    if clickmode = 5{//if a window is open
        if instance_exists(oAttackWindow) and stile > 0{//while attack window is open
            if mouse_check_button_pressed(mb_right){//select another unit for the attack window
                if stile.canattack = 1{
                    if sIsTileInAttackRange(stile,sunit){
                        if stile.occupied > 0{
                            if (stile.occupied).team != playerturn{
                                with oAttackWindow{
                                    event_perform(ev_other,ev_user4)
                                    }
                                sClickOnAttackable(sunit,stile.occupied)
                                }
                            }
                        }
                    }
                }//end right click
            if mouse_check_button_pressed(mb_left){
                var vkillit,vind;
                vkillit = 0
                if vbutton = 0{
                    vkillit = 1
                    }else{
                    vind = vbutton.parent
                    if vind.object_index != oAttackWindow{
                        vkillit = 1
                        //show_message(vbutton.parent)
                        }
                    }
                if vkillit = 1{//if oAttackWindow's buttons aren't what's being clicked
                    with oAttackWindow{
                        event_perform(ev_other,ev_user4)
                        }
                    }
                }
            }
        }//end clickmode 5

    //end clickmode 5

    if clickmode = 1{//if a unit has been selected
        if mouse_check_button_pressed(mb_right){
        /*clicking the right button chooses a tile to move to
        */
            if stile > 0 and didclick = 0{//if the cursor is over a tile
                if stile.cango = 1 and stile.occupied = 0{//and that tile is currently movable
                    if sunit.team = playerturn{//if it's the player's turn
                        if instance_exists(oMoveRange) and !instance_exists(oItemRange){
                            sClickOnMoveRange(stile)
                            didclick = 1
                            }
                        }
                    }else{//if it's not movable, check if it can be attacked
                    if sunit.attacked = 0{//if the unit hasn't already attacked
                        if stile.canattack = 1{//if it's attackable
                            if sIsTileInAttackRange(stile,sunit){//and it's in the units move range
                                if stile.occupied > 0{//if there's a unit in it
                                    if sunit.weaponhealing = 0{
                                        //if the unit is NOT HEALING
                                        if (stile.occupied).team != playerturn{//if that unit can be attacked
                                            if !instance_exists(oAttackWindow){
                                                sClickOnAttackable(sunit,stile.occupied)
                                                }
                                            }
                                        }else{
                                        //if the unit is healing
                                        if stile.attackable = 1{//if that unit can be attacked
                                            if !instance_exists(oAttackWindow){
                                                sClickOnAttackable(sunit,stile.occupied)
                                                }
                                            }
                                        }
                                    }
                                }else{//if the attacktile's out of the units current attack range, but the unit can move in range
                                //insert script to move unit to a tile it can attack here from
                                var vtile;
                                vtile = stile.attackparent
                                stile = vtile//set stile to the closest move tile to selected attacktile
                                sClickOnMoveRange(stile)
                                }
                            }
                        }
                    }
                }
            }//end checking if the right mouse is clicked
        if mouse_check_button_pressed(mb_left){
            }
        }else{//if there's no unit selected,click on the tile
        if keyboard_check(vk_control) and mouse_check_button_pressed(mb_left){//if the user clicks control, debug for now
            if stile > 0{
                if stile.occupied = 0{//if there's no unit on the tile
                    //sDebugClickMakeEnemy(stile)
                    sDebugClickMakeBarrel(stile)
                    }else{
                    with stile.occupied{
                        instance_destroy()
                        }
                    }
                }
            }
        }
    }
        

/* */
/*  */
