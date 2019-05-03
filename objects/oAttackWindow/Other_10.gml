var vlist,vcanshove,attackerdamtip,defenderdamtip,attackerhittip,defenderhittip,varray;

with oMoveRange{
    visible = 0
    }
with oAttackRange{
    if active = 0{
        visible = 0
        }
    }
	
//tooltip defaults
attackerdamtip = ""
defenderdamtip = ""
attackerhittip = ""
defenderhittip = ""

if attacker.weaponhealing = 0{//if the player is attacking instead of healing
    vlist = sMakeAttackStatsList(attacker,defender)
    
    candefenderattack = sIsTileInAttackRange(attacker.mytile,defender)
    //assume the attacker can attack, otherwise they wouldn't get this far!
    
    //attackerhit = sFindAttackHitChance(attacker,attacker.mytile,defender,0)//find attacker combat chances
    attackerhit = ds_list_find_value(vlist,0)
    //attackerdamage = sFindAttackDamage(attacker,attacker.mytile,defender,0)
    attackerdamage = ds_list_find_value(vlist,1)
    //attackercrit = sFindAttackCritChance(attacker,attacker.mytile,defender,0)
    attackercrit = ds_list_find_value(vlist,2)
    //attackerknock = sFindAttackKnockChance(attacker,attacker.mytile,defender,0)
    attackerknock = ds_list_find_value(vlist,3)
    ds_list_destroy(vlist)
    
    
    dispattackerhit = string(attackerhit[0])
    dispattackerdamage = string(attackerdamage[0])
	attackerdamtip = attackerdamage[1]
	attackerhittip = attackerhit[1]
    dispattackercrit = string(attackercrit)
    if attackerknock >= 0{
        dispattackerknock = string(attackerknock)
        defenderknocklist = sMakeKnockRange(defender,attacker.knockdist,sUnitFaceUnit(attacker,defender),0)
        }else{
        dispattackerknock = "-"
        }
    /*if attackerknock > 0{
        if sIsKnockPossible(defender,sUnitFaceUnit(attacker,defender)) = 0 and attacker.knockdist > 0{//check if the knock isn't possible, long range units can't knock
            attackerknock = 0
            dispattackerknock = "-"
            }else{//if the knock can happen, determing the knockrange
            //this is the list of tiles that the defender will be knocked across.
            
            }
        }*/
    
    //now get the defender information
    
    
    if defender.cancounter = 0{
        candefenderattack = 0
        }
    if defender.unitisobject = 1{
        candefenderattack = 0
        }
    if defender.unitisitem = 1{
        candefenderattack = 0
        }
    if defender.myweapon <= 0{
        candefenderattack = 0
        }
        
        
    if candefenderattack{//if the defending unit can counter-attacker
        vlist = sMakeAttackStatsList(defender,attacker)
        //defenderhit = sFindAttackHitChance(defender,defender.mytile,attacker,0)
        defenderhit = ds_list_find_value(vlist,0)
        //defenderdamage = sFindAttackDamage(defender,defender.mytile,attacker,0)
        defenderdamage = ds_list_find_value(vlist,1)
        //defendercrit = sFindAttackCritChance(defender,defender.mytile,attacker)
        defendercrit = ds_list_find_value(vlist,2)
        //defenderknock = sFindAttackKnockChance(defender,defender.mytile,attacker)
        defenderknock = ds_list_find_value(vlist,3)
        
        dispdefenderhit = string(defenderhit[0])
        dispdefenderdamage = string(defenderdamage[0])
		defenderdamtip = defenderdamage[1]
		defenderhittip = defenderhit[1]
        dispdefendercrit = string(defendercrit)
        dispdefenderknock = string(defenderknock)
        if defenderknock >= 0{
            dispdefenderknock = string(defenderknock)
            attackerknocklist = sMakeKnockRange(attacker,defender.knockdist,sUnitFaceUnit(defender,attacker),0)
            }else{
            dispdefenderknock = "-"
            }
        /*if defenderknock > 0{
            if sIsKnockPossible(attacker,sUnitFaceUnit(defender,attacker)) = 0 and defender.attackrange < 2{//check if the knock isn't possible
                defenderknock = 0
                dispdefenderknock = "-"
                }else{//if the knock can happen, determing the knockrange
                
                }
            }*/
        
        ds_list_destroy(vlist)
        
        }else{//if the defender can't attack, set all display chances to dashes
        dispdefenderhit = "-"
        dispdefenderdamage = "-"
        dispdefendercrit = "-"
        dispdefenderknock = "-"
		
		if defender.cancounter = 0{
	        defenderdamtip = "Can't counter!"
	        }
		if defender.myweapon <= 0{
	        defenderdamtip = "No weapon!"
			defenderdamtip = "No weapon!"
			defenderhittip = "No weapon!"
	        }
	    if defender.unitisobject = 1{
	        
	        }
	    if defender.unitisitem = 1{
	        
	        }
	    
        }
    
        
    
    //make player hit chance box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-188,oPlayerHitStatBox)
    //vhit.hitdraw = dispattackerhit
    //make player damage box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-141,oPlayerDamStatBox)
    //vhit.hitdraw = dispattackerdamage
    //make player crit box
    //hit = instance_create(oUnitWindow.x,oUnitWindow.y-94,oPlayerCritStatBox)
    //vhit.hitdraw = dispattackercrit
    //make player knock box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-47,oPlayerKnockStatBox)
    //vhit.hitdraw = dispattackerknock
    
    //make enemy his chance box
    //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-188,oEnemyHitStatBox)
    //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-188,oEnemyHitStatBox)
    //vhit.hitdraw = dispdefenderhit
    //vhit.drawname = defender.name
    //make enemy damage box
    //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-141,oEnemyDamStatBox)
    //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-141,oEnemyDamStatBox)
    //vhit.hitdraw = dispdefenderdamage
    //vhit.drawname = defender.name
    //make enemy crit box
    //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-94,oEnemyCritStatBox)
    //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-94,oEnemyCritStatBox)
    //vhit.hitdraw = dispdefendercrit
    //vhit.drawname = defender.name
    //make enemy knock box
    //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-47,oEnemyKnockStatBox)
    //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-47,oEnemyKnockStatBox)
    //vhit.hitdraw = dispdefenderknock
    //vhit.drawname = defender.name
    
    
    /**************************************************************************************************************************************
    ***************************************************************************************************************************************/
    }else{//if the player is healing instead of attacking
    
    
    confirm.mystring = "Heal"
    
    if defender.team != attacker.team{
        candefenderattack = sIsTileInAttackRange(attacker.mytile,defender)
        }else{
        candefenderattack = 0
        }
    
    attackerhit[0]= 101//find attacker combat chances
	attackerhit[1] = "Healing Guaranteed"
	varray = sFindAttackDamage(attacker,attacker.mytile,defender,0)
    attackerdamage = varray[0]
    if ds_list_find_value(attacker.abilitieslist,26) = 1{
        attackerdamage[0] *= 2
        }
    attackercrit = -1
    attackerknock = -1
    
    
    
    dispattackerhit = string(attackerhit[0])
    dispattackerdamage = string(attackerdamage[0])
    dispattackercrit = string(attackercrit)
    //dispattackerknock = string(attackerknock)
    if attackerknock >= 0{
        dispattackerknock = string(attackerknock)
        defenderknocklist = sMakeKnockRange(defender,attacker.knockdist,sUnitFaceUnit(attacker,defender),0)
        }else{
        dispattackerknock = "-"
        }
    /*if attackerknock > 0{
        if sIsKnockPossible(defender,sUnitFaceUnit(attacker,defender)) = 0 and attacker.knockdist > 0{//check if the knock isn't possible, long range units can't knock
            attackerknock = 0
            dispattackerknock = "-"
            }else{//if the knock can happen, determing the knockrange
            defenderknocklist = sMakeKnockRange(defender,attacker.knockdist,sUnitFaceUnit(attacker,defender),0)
            }
        }*/
    
    if defender.cancounter = 0{
        candefenderattack = 0
        }
    if defender.unitisobject = 1{
        candefenderattack = 0
        }
    if defender.unitisitem = 1{
        candefenderattack = 0
        }
    if defender.myweapon <= 0{
        candefenderattack = 0
        }
    
    if candefenderattack{//if the defending unit can counter-attacker
        
        vlist = sMakeAttackStatsList(defender,attacker)
        //defenderhit = sFindAttackHitChance(defender,defender.mytile,attacker,0)
        defenderhit = ds_list_find_value(vlist,0)
        //defenderdamage = sFindAttackDamage(defender,defender.mytile,attacker,0)
        defenderdamage = ds_list_find_value(vlist,1)
        //defendercrit = sFindAttackCritChance(defender,defender.mytile,attacker)
        defendercrit = ds_list_find_value(vlist,2)
        //defenderknock = sFindAttackKnockChance(defender,defender.mytile,attacker)
        defenderknock = ds_list_find_value(vlist,3)
        
        dispdefenderhit = string(defenderhit[0])
        dispdefenderdamage = string(defenderdamage[0])
        dispdefendercrit = string(defendercrit)
        //dispdefenderknock = string(defenderknock)
        if defenderknock >= 0{
            dispdefenderknock = string(defenderknock)
            attackerknocklist = sMakeKnockRange(attacker,defender.knockdist,sUnitFaceUnit(defender,attacker),0)
            }else{
            dispdefenderknock = "-"
            }
        
        /*if defenderknock > 0{
            if sIsKnockPossible(attacker,sUnitFaceUnit(defender,attacker)) = 0 and defender.attackrange < 2{//check if the knock isn't possible
                defenderknock = 0
                dispdefenderknock = "-"
                }else{//if the knock can happen, determing the knockrange
                defenderknocklist = sMakeKnockRange(attacker,defender.knockdist,sUnitFaceUnit(defender,attacker),0)
                }
            }*/
        ds_list_destroy(vlist)
        }else{//if the defender can't attack, set all display chances to dashes
        dispdefenderhit = "-"
        dispdefenderdamage = "-"
        dispdefendercrit = "-"
        dispdefenderknock = "-"
        }
    
        
    
    //make player hit chance box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-188,oPlayerHitStatBox)
    //vhit.hitdraw = dispattackerhit
    //make player damage box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-47,oPlayerHealStatBox)
    //vhit.hitdraw = dispattackerdamage
    //make player crit box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-94,oPlayerCritStatBox)
    //vhit.hitdraw = dispattackercrit
    //make player knock box
    //vhit = instance_create(oUnitWindow.x,oUnitWindow.y-47,oPlayerKnockStatBox)
    //vhit.hitdraw = dispattackerknock
    
    if candefenderattack > 0{
        //make enemy his chance box
        //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-188,oEnemyHitStatBox)
        //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-188,oEnemyHitStatBox)
        //vhit.hitdraw = dispdefenderhit
        //vhit.drawname = defender.name
        //make enemy damage box
        //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-141,oEnemyDamStatBox)
        //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-141,oEnemyDamStatBox)
        //vhit.hitdraw = dispdefenderdamage
        //vhit.drawname = defender.name
        //make enemy crit box
        //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-94,oEnemyCritStatBox)
        //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-94,oEnemyCritStatBox)
        //vhit.hitdraw = dispdefendercrit
        //vhit.drawname = defender.name
        //make enemy knock box
        //vhit = instance_create(oUnitWindow.x+camrealwidth,oUnitWindow.y-47,oEnemyKnockStatBox)
        //vhit = instance_create(oUnitWindow.x+54,oUnitWindow.y-47,oEnemyKnockStatBox)
        //vhit.hitdraw = dispdefenderknock
        //vhit.drawname = defender.name
        }
    }
    
    //end unit healing
    
if ds_list_find_value(attacker.abilitieslist,18) = 1{//if the attacker can shove
    vcanshove = 0//if the unit can shove the other unit. At the end, make a greyed out button if the unit has shove but cannot shove this turn
    if ds_list_find_value(defender.abilitieslist,19) = 0{//if the defender can be shoved
        if (abs(attacker.mx-defender.mx) + abs(attacker.my-defender.my)) = 1{//if the units are in adjacent tiles
            if abs(attacker.elevation - defender.elevation) <= 2{
                if sIsKnockPossible(defender,attacker.facing){
					confirm.x -= 38
					with confirm{
						event_perform(ev_other,ev_user15)
						}
					cancel.x += 38
					with cancel{
						event_perform(ev_other,ev_user15)
						}
                    shove = instance_create(x+(round(camrealwidth/2)-38),y+windowheight+60,oAttackShoveButton)
                    shove.parent = id
                    shove.mystring = "Shove"
                    shove.sprite_index = spwordbutton
                    shove.depth = depth-1
                    vcanshove = 1
                    shove.mask_index = spwordbutton
                    with shove{
                        event_perform(ev_other,ev_user15)
                        }
                    }
                }
            }
        }
    if vcanshove = 0{//if the unit wasn't able to shove but has the ability, show the button greyed out
        }
    }

var drawx,drawy,startx,starty,vdummy;

drawx = camera_get_view_x(maincameraid)+((round(camrealwidth/2))-round(sprite_get_width(spcombatcard)/2))
drawy = oUnitWindow.y

//drawx += 150
drawy -= 80
drawx += 39
drawy += 1

startx = drawx
starty = drawy


//drawx and drawy are now at the proper place to start drawing tooltipdummies
//attacker dam
vdummy = sMakeTooltipDummy(0,drawx,drawy,attackerdamtip,0,0,0,0,oUnitWindow)
//attacker hit
drawx += 31
vdummy = sMakeTooltipDummy(0,drawx,drawy,attackerhittip,0,0,0,0,oUnitWindow)
//attacker crit
drawx += 31
vdummy = sMakeTooltipDummy(0,drawx,drawy,"atk crit",0,0,0,0,oUnitWindow)
//attacker knock
drawx += 31
vdummy = sMakeTooltipDummy(0,drawx,drawy,"atk knk",0,0,0,0,oUnitWindow)

drawx = startx
drawy += 27

//defender dam
vdummy = sMakeTooltipDummy(0,drawx,drawy,defenderdamtip,0,0,0,0,oUnitWindow)
//defender hit
drawx += 31
vdummy = sMakeTooltipDummy(0,drawx,drawy,defenderhittip,0,0,0,0,oUnitWindow)
//defender crit
drawx += 31
vdummy = sMakeTooltipDummy(0,drawx,drawy,"def crit",0,0,0,0,oUnitWindow)
//defender knock
drawx += 31
vdummy = sMakeTooltipDummy(0,drawx,drawy,"def knk",0,0,0,0,oUnitWindow)
    

/*with oAttackStatParent{
    depth = oUnitWindow.depth
    parent = oUnitWindow
    event_perform(ev_other,ev_user15)
    }
//sMakeAttackInventoryButtons()
/*
with oInventoryButton{
    if isitem = 1{
        y += 100
        posmod = 1
        event_perform(ev_other,ev_user15)
        }
    }

/* */
/*  */
