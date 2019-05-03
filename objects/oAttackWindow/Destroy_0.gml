with oAttackStatParent{
    instance_destroy()
    }
    
with oInventoryButton{
    if isitem = 1 and posmod = 1{
        posmod = 0
        y -= 100
        event_perform(ev_other,ev_user15)
        }
    }
with oTooltipDummy{
	instance_destroy()
	}

