var canuse;

canuse = 1
//modify with status effects
if sunit.stunnedstatus > 0{
    canuse = 0
    }
if instance_exists(oAttackWindow){
    canuse = 0
    }
if instance_exists(oWindowParent){
    canuse = 0
    }
    
if canuse = 1{
    if instance_exists(oCancelItemButton){
        oCancelItemButton.killitem = 1
        }
    with oButton{
        if object_index != oInventoryButton{
            instance_destroy()
            }
        }
    with oInventoryInteractButton{
        instance_destroy()
        }

    if itemnumber > 0{//if this button has an item
        if sunit.team = playerturn{//only allow the player to use the inventory of their own units
            if sunit.turnover = 0{
                if isweapon = 1{
                    sClickOnWeaponItem(id)
                    }
                if isarmor = 1{
                    sClickOnArmorItem(id)
                    }
                if isitem = 1{
                    sClickOnInventoryItem(id)
                    }
                }
            }
        }
    }

