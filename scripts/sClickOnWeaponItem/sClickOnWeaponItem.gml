/// @description sClickOnWeaponItem(button)
/// @param button
/*this script is activated when an inventorybutton is clicked. The unit holds the object
up and a button is made to discard the item.
*/
var vbutton,vtype,vunit,gbutton,vitem,vobj,vistrap,vspace;

canclick = 0
vunit = sunit
vbutton = argument0
vtype = vbutton.itemnumber//this is determined in sMakeInventoryButtons
vspace = 25//the space between buttons

vbutton.canbeclicked = 0

vunit.anim = 6//set the hold animation
vunit.animstep = 0

with oMapTile{
    canitem = 0//reset what map tiles can be thrown to
    }
    
sFindItemRange(vunit)
    
if vtype = 0{
    show_message("no item in that button")
    }
    
vistrap = sGetItemInfo(vtype,4)//1 if the item is a trap, 0 if is consumable

vobj = sGetItemInfo(vtype,3)//get the object index for the proper item
vitem = instance_create(vunit.x,vunit.y-28,vobj)
vitem.itemtype = vtype
vitem.targetunit = vunit
vitem.startunit = vunit
vitem.depth = vunit.depth-1
vitem.inventorypos = vbutton.inventorypos
vitem.mydata = mydata
with vitem{//init item to get attack stats if applicable
    event_perform(ev_other,ev_user0)
    }
    
//skip the buttons for use and give,
/*if vistrap = 1{
    gbutton = instance_create(vbutton.x,vbutton.y-(vspace*3),oUseTrapItemButton)//make the use button
    }else{
    gbutton = instance_create(vbutton.x,vbutton.y-(vspace*3),oUseConsumableItemButton)//make the use button
    }
gbutton.itemnumber = vbutton.itemnumber
gbutton.inventorypos = vbutton.inventorypos
gbutton.myunit = vunit
gbutton.parent = oCamera
gbutton.mybutton = vbutton//mybutton is set to the calling inventorybutton
gbutton.myitem = vitem//set the item that this button will affect
with gbutton{
    event_perform(ev_other,ev_user15)
    }*/

gbutton = instance_create(vbutton.x,vbutton.y-(vspace*3),oGiveItemButton)//make the throw button
gbutton.itemnumber = vbutton.itemnumber
gbutton.inventorypos = vbutton.inventorypos
gbutton.myunit = vunit
gbutton.parent = oCamera
gbutton.mybutton = vbutton//mybutton is set to the calling inventorybutton
gbutton.myitem = vitem//set the item that this button will affect
with gbutton{
    event_perform(ev_other,ev_user15)
    }

gbutton = instance_create(vbutton.x,vbutton.y-(vspace*2),oDiscardItemButton)//make the throw button
gbutton.itemnumber = vbutton.itemnumber
gbutton.inventorypos = vbutton.inventorypos
gbutton.myunit = vunit
gbutton.parent = oCamera
gbutton.mybutton = vbutton//mybutton is set to the calling inventorybutton
gbutton.myitem = vitem//set the item that this button will affect
with gbutton{
    event_perform(ev_other,ev_user15)
    }

gbutton = instance_create(vbutton.x,vbutton.y-(vspace*1),oStoreEquippedItemButton)//make the store button
gbutton.itemnumber = vbutton.itemnumber
gbutton.inventorypos = vbutton.inventorypos
gbutton.myunit = vunit
gbutton.parent = oCamera
gbutton.mybutton = vbutton//mybutton is set to the calling inventorybutton
gbutton.myitem = vitem//set the item that this button will affect
gbutton.weaponorarmor = 0//if the button will store the equipped armor or weapon
with gbutton{
    event_perform(ev_other,ev_user15)
    }

gbutton = instance_create(vbutton.x,vbutton.y,oCancelItemButton)//make the throw button go away
gbutton.itemnumber = vbutton.itemnumber
gbutton.inventorypos = vbutton.inventorypos
gbutton.myunit = vunit
gbutton.parent = oCamera
gbutton.mybutton = vbutton//mybutton is set to the calling inventorybutton
gbutton.myitem = vitem//set the item that this button will affect
gbutton.killitem = 0//if the cancel button will destroy the item on own destruction
with gbutton{
    event_perform(ev_other,ev_user15)
    }


