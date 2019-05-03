with oMoveRange{
    visible = 0
    }
with oAttackRange{
    if active = 0{
        visible = 0
        }
    }
    
itemname = mycontainer.itemstring
itemtype = mycontainer.itemtype
itemnum = mycontainer.iteminside
itemsprite = sGetItemInfo(itemnum,2)
itemstring = sGetItemInfo(itemnum,1)

draw_set_font(fontAuditorShadow)
itemstringwidth = string_width(itemname)

//determine if the item can be taken. Type does not matter, only if the unit has room in its inventory.
if ds_list_size(myunit.inventorylist) >= myunit.inventoryslots{
	cantakeit = 0
	}else{
	cantakeit = 1
	}
		
if itemtype = 0 or itemtype = 1{//if it's an item
    windowstring1 = "It's an item:"
    }else{//if it's a weapon or armor
    if itemtype = 2{//if it's a weapon
        windowstring1 = "It's a weapon:"
        }
    if itemtype = 3{
        windowstring1 = "It's armor: "
		}
	}
    
if cantakeit = 0{//cannot take an item
    with confirm{
        instance_destroy()
        }
    windowstring2 = "No free inventory slots!"
    }else{
    if cantakeit = 1{//can take the item
        windowstring2 = "Take it or leave it?"
        }
    }