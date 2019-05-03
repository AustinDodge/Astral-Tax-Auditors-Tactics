/// @description sMakeButtons(vunit)
/// @param vunit
/*This script is called whenever buttons might be made. It checks what buttons can be made
then makes them, both buttons under "actions" and context-located buttons.
*/
var vbutton,vx,vy,vunit,canmakecancelbutton,canmakepickupbutton,vitem,canmakedoorbutton,vtile,vcontainer,
canmakedoorterminalbutton,vdoorterminal,vvendor,neighborlist,i,etile,canmakecontainerbutton,voccupied,vdidit,
containerlist,velevation,canmakearrowsbutton,canmakekongbutton,konglist,vobject,canmaketrickshotbutton,
canmakefirstaidbutton,canmakesurefootingbutton,canmakesprintbutton,canmakenimblebutton,canmakeleapbutton,
canmakecharmerbutton,canmakeblendinbutton,canmakediversionbutton,canmakereflexesbutton,canmakevendorbutton,
terminallist,vendorlist,canmakeelevatorbutton,vwidth,vmakeinfobutton;
vunit = argument0
//vx = view_xview[0] + (view_wview[0] - 60)
//vy = view_yview[0]+60

//vx = oUnitWindow.x+oUnitWindow.sprite_width+10
//vy = oUnitWindow.y

//set vx/vy to the position of the first action button
vx = camera_get_view_x(maincameraid) + 94
vy = camera_get_view_y(maincameraid)+(camrealheight - 23)

vwidth = 19//the width from the xstart of one button to the xstart of the next

canmakecancelbutton = 0
canmakepickupbutton = 0
canmakedoorbutton = 0
canmakedoorterminalbutton = 0
canmakevendorbutton = 0
canmakecontainerbutton = 0
canmakearrowsbutton = 1//can always end the unit's turn prematurely
canmakeelevatorbutton = 0
vmakeinfobutton = 1//by default make the info button




//abilities buttons
canmakekongbutton = 0
canmaketrickshotbutton = 0
canmakefirstaidbutton = 0
canmakesurefootingbutton = 0
canmakesprintbutton = 0
canmakenimblebutton = 0
canmakeleapbutton = 0
canmakecharmerbutton = 0
canmakeblendinbutton = 0
canmakediversionbutton = 0
canmakereflexesbutton = 0

containerlist = ds_list_create()
terminallist = ds_list_create()
konglist = ds_list_create()
vendorlist = ds_list_create()


vtile = ds_grid_get(tilegrid,vunit.mx,vunit.my)//the tile the unit is standing on
neighborlist = ds_list_create()//a list of all neighbor tiles

if vtile.n > 0{//
    ds_list_add(neighborlist,vtile.n)
    }
if vtile.e > 0{
    ds_list_add(neighborlist,vtile.e)
    }
if vtile.s > 0{
    ds_list_add(neighborlist,vtile.s)
    }
if vtile.w > 0{
    ds_list_add(neighborlist,vtile.w)
    }

with oButton{
    instance_destroy()
    }


if vunit.stunnedstatus = 0{
    
    
    if vunit.movepoints < vunit.pmovepoints{//check if the cancel button can be made
        if vunit.cancancelmove = 1{
            if (vunit.prevtile).occupied = 0{//check that the previous tile is empty
                canmakecancelbutton = 1
                if ds_list_find_value(vunit.abilitieslist,33) = 1 or ds_list_find_value(vunit.abilitieslist,34) = 1{//if the unit has the Lifter or Booster abilities
                    if sUnitCheckClimbCancel(vunit) = 0{//if another unit climbed over/up this unit
                        canmakecancelbutton = 0
                        }
                    }                    
                }
            }
        }
    
    
    vitem = ds_grid_get(mapitemgrid,vunit.mx,vunit.my)
    if vitem > 0{//if the unit is standing on an item
        canmakepickupbutton = 1
        }
    
    if vtile.door > 0{
        if vtile.door = exitdoor{
            if exitlocked = 0{
                canmakedoorbutton = 1
                }
            }
        }
    if vtile.object_index = oElevatorTile{
        canmakeelevatorbutton = 1
        }
    vdidit = 0
    if ds_list_size(neighborlist) > 0{//find buttons for interacting with neighbor tiles
        for (i = 0; i < ds_list_size(neighborlist); i += 1){
            etile = ds_list_find_value(neighborlist,i)
            if etile.occupied > 0{//if there's something on etile
                    voccupied = etile.occupied
                    if voccupied.unitisobject = 1{
                        if voccupied.objectiscrate = 1{//if it's a crate
                            if voccupied.disappearing = 0{
                                //check make sure the crate isn't too high or low
                                if abs(etile.elevation - (vunit.mytile).elevation) <= vunit.uprange{
                                
                                    canmakecontainerbutton = 1
                                    vcontainer = voccupied
                                    ds_list_add(containerlist,vcontainer)
                                    }
                                }
                            //vdidit = 1
                            }else{//non-crate objects can be thrown with Kong ability
                            if ds_list_find_value(vunit.abilitieslist,5) = 1{//if the unit can Kong
                                if abs(etile.elevation - (vunit.mytile).elevation) <= 2{
                                    canmakekongbutton = 1
                                    vobject = voccupied
                                    ds_list_add(konglist,vobject)
                                    }
                                }
                            }//end Kong checking
                        }
                    }
            //if abs(etile.elevation-vtile.elevation) <= vunit.uprange{
            if abs(ds_grid_get(mapheightgrid,etile.mx,etile.my)-ds_grid_get(mapheightgrid,vtile.mx,vtile.my)) <= vunit.uprange{
                if ds_grid_get(tiletypegrid,etile.mx,etile.my) = 7{//if it's a door terminal
                    vdoorterminal = etile.myobject
                    if vdoorterminal.locked = 1{
                        canmakedoorterminalbutton = 1
                        ds_list_add(terminallist,vdoorterminal)
                        //i = ds_list_size(neighborlist)//exit for loop
                        //vdidit = 1
                        }
                    }
                if ds_grid_get(tiletypegrid,etile.mx,etile.my) = 8{//if it's a vending machine
                    vvendor = etile.myobject
                    canmakevendorbutton = 1
                    ds_list_add(vendorlist,vvendor)
                    }
                
                }
            }
        }
    
    //Trick Shot checking
    if ds_list_find_value(vunit.abilitieslist,6) = 1{
        canmaketrickshotbutton = 1
        }
    //First Aid checking
    if ds_list_find_value(vunit.abilitiescooldownlist,42) = 0{//if the ability isn't on cooldown
        if ds_list_find_value(vunit.abilitieslist,42) = 1{
            canmakefirstaidbutton = 1
            }
        if ds_list_find_value(vunit.abilitieslist,43) = 1{
            canmakefirstaidbutton = 1
            }
        if ds_list_find_value(vunit.abilitieslist,44) = 1{
            canmakefirstaidbutton = 1
            }
        }
    //Sure Footing checking
    if ds_list_find_value(vunit.abilitieslist,35) = 1{//if the unit has Sure Footing
        if ds_list_find_value(vunit.abilitiescooldownlist,35) = 0{//if the ability isn't on cooldown
            canmakesurefootingbutton = 1
            }
        }
    //Sprint checking
    if ds_list_find_value(vunit.abilitieslist,37) = 1{//if the unit has Sprint
        if ds_list_find_value(vunit.abilitiescooldownlist,37) = 0{//if the ability isn't on cooldown
            canmakesprintbutton = 1
            }
        }
    if ds_list_find_value(vunit.abilitieslist,36) = 1{//if the unit has Nimble
        if ds_list_find_value(vunit.abilitiescooldownlist,36) = 0{//if the ability isn't on cooldown
            canmakenimblebutton = 1
            }
        }
    if ds_list_find_value(vunit.abilitieslist,41) = 1{//if the unit has Leap
        if ds_list_find_value(vunit.abilitiescooldownlist,41) = 0{//if the ability isn't on cooldown
            canmakeleapbutton = 1
            }
        }
    if ds_list_find_value(vunit.abilitieslist,48) = 1{//if the unit has Charmer
        if ds_list_find_value(vunit.abilitiescooldownlist,48) = 0{//if the ability isn't on cooldown
            canmakecharmerbutton = 1
            }
        }
    if ds_list_find_value(vunit.abilitieslist,47) = 1{//if the unit has Blend In
        if ds_list_find_value(vunit.abilitiescooldownlist,47) = 0{//if the ability isn't on cooldown
            canmakeblendinbutton = 1
            }
        }
    if ds_list_find_value(vunit.abilitieslist,46) = 1{//if the unit has Diversion
        if ds_list_find_value(vunit.abilitiescooldownlist,46) = 0{//if the ability isn't on cooldown
            canmakediversionbutton = 1
            }
        }
    if ds_list_find_value(vunit.abilitieslist,53) = 1{//if the unit has reflexes
        if ds_list_find_value(vunit.abilitiescooldownlist,53) = 0{//if the ability isn't on cooldown
            canmakereflexesbutton = 1
            }
        }       
        
    }//end if stunnedstatus

ds_list_destroy(neighborlist)


if vmakeinfobutton = 1{
	vbutton = instance_create_depth(oUnitWindow.x+37,oUnitWindow.y-23,oUnitWindow.depth-3,oUnitInfoButton)
	vbutton.parent = oUnitWindow
	vbutton.myunit = vunit
	with vbutton{
		event_perform(ev_other,ev_user15)//lock button in place
		}
	}

//bottom-of-the-screen buttons

if canmakecancelbutton = 1{
    vbutton = instance_create(vx,vy,oCancelMoveButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)//lock the button in place
        }
    //vy += 30
    vx += vwidth
    }
if canmakepickupbutton = 1{
    vbutton = instance_create(vx,vy,oPickUpItemButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    vbutton.itemstring = sGetItemInfo(vitem.itemtype,1)
    vbutton.myitem = vitem
    //vy += 30
    vx += vwidth
    }
if canmakedoorbutton = 1{
    vbutton = instance_create(vx,vy,oMoveNextRoomButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakearrowsbutton = 1{
    vbutton = instance_create(vx,vy,oDoFacingButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmaketrickshotbutton = 1{
    vbutton = instance_create(vx,vy,oTrickShotButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakefirstaidbutton = 1{
    vbutton = instance_create(vx,vy,oFirstAidButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakesurefootingbutton = 1{
    vbutton = instance_create(vx,vy,oSureFootingButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakesprintbutton = 1{
    vbutton = instance_create(vx,vy,oSprintButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakenimblebutton = 1{
    vbutton = instance_create(vx,vy,oNimbleButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakeleapbutton = 1{
    vbutton = instance_create(vx,vy,oLeapButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakecharmerbutton = 1{
    vbutton = instance_create(vx,vy,oCharmerButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakeblendinbutton = 1{
    vbutton = instance_create(vx,vy,oBlendInButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakediversionbutton = 1{
    vbutton = instance_create(vx,vy,oDiversionButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
if canmakereflexesbutton = 1{
    vbutton = instance_create(vx,vy,oReflexesButton)
    vbutton.parent = oCamera
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    //vy += 30
    vx += vwidth
    }
    
    
    

//context placed buttons********************************************************************************
if canmakeelevatorbutton = 1{
    vtile = vunit.mytile
    vbutton = instance_create(vtile.x-8,vtile.y-8,oElevatorButton)
    vbutton.parent = vtile
    vbutton.myunit = vunit
    with vbutton{
        event_perform(ev_other,ev_user15)
        }
    }


if canmakedoorterminalbutton = 1{
    while ds_list_size(terminallist) > 0{
        vdoorterminal = ds_list_find_value(terminallist,0)
        ds_list_delete(terminallist,0)
        vbutton = instance_create(vdoorterminal.x,vdoorterminal.y-5,oUseDoorTerminalButton)
        vbutton.parent = vdoorterminal
        vbutton.myunit = vunit
        vbutton.myterminal = vdoorterminal
        with vbutton{
            event_perform(ev_other,ev_user15)
            }
        }
    //vy += 30
    }
if canmakevendorbutton = 1{
    while ds_list_size(vendorlist) > 0{
        vvendor = ds_list_find_value(vendorlist,0)
        ds_list_delete(vendorlist,0)
        vbutton = instance_create(vvendor.x,vvendor.y-5,oUseVendorButton)
        vbutton.parent = vvendor
        vbutton.myunit = vunit
        vbutton.myvendor = vvendor
        with vbutton{
            event_perform(ev_other,ev_user15)
            }
        }
    //vy += 30
    }
if canmakecontainerbutton = 1{
    while ds_list_size(containerlist) > 0{
        vcontainer = ds_list_find_value(containerlist,0)
        ds_list_delete(containerlist,0)
        vbutton = instance_create(vcontainer.x-8,vcontainer.y-8,oOpenContainerButton)
        vbutton.parent = vcontainer
        vbutton.myunit = vunit
        vbutton.mycontainer = vcontainer
        with vbutton{
            event_perform(ev_other,ev_user15)
            }
        }
    //vy += 30
    }
    
if canmakekongbutton = 1{
    while ds_list_size(konglist) > 0{
        vobject = ds_list_find_value(konglist,0)
        ds_list_delete(konglist,0)
        vbutton = instance_create(vobject.x,vobject.y,oKongButton)
        vbutton.parent = vobject
        vbutton.myunit = vunit
        vbutton.myobject = vobject
        with vbutton{
            event_perform(ev_other,ev_user15)
            }
        }
    //vy += 30
    }


    
//destroy all lists made at the top of the script
ds_list_destroy(containerlist)
ds_list_destroy(konglist)
ds_list_destroy(terminallist)
ds_list_destroy(vendorlist)





















