dispunit = -1
if instance_exists(sunit){
    dispunit = sunit
    }
vtile = oTileCursor.mytile
if vtile > 0{
    if vtile.occupied > 0{
        dispunit = vtile.occupied
        }
    }

if instance_exists(oAttackWindow){
    dispunit = sunit
    }
if instance_exists(oLevelUpWindow){
    dispunit = oLevelUpWindow.target
    }
    
if dispunit != prevunit{
    with oUnitStatsWindow{
        myunit = dispunit
        event_perform(ev_other,ev_user0)
        }
    if !instance_exists(oAttackWindow) and !instance_exists(oCancelItemButton){
        if dispunit > 0{
            sMakeInventoryButtons(dispunit)
            }
        }
    }
    
prevunit = dispunit

