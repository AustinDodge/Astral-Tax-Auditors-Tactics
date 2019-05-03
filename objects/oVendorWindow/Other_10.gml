//create the buttons for purchasable items

var i,vbutton,vsize,vx,vy,startx,vindex;

inventorylist = myvendor.inventorylist

vsize = ds_list_size(inventorylist)
if vsize > 20{//max twenty different items 
    vsize = 20
    }

vx = x+22
vy = y+26
startx = vx

for (i = 0; i < vsize; i += 1){
    vbutton = instance_create(vx,vy,oItemPurchaseButton)
    vindex = ds_list_find_value(inventorylist,i)
    vbutton.itemnumber = vindex
    vbutton.itemtype = sGetItemInfo(vindex,4)
    //0 and 1 are items, 2 is weapon, 3 is armor
    vbutton.image_speed = 0
    vbutton.oversprite = sGetItemInfo(vindex,2)
    vbutton.parent = id
    vbutton.myvendor = myvendor
    vbutton.canbeclicked = 0
    vbutton.myunit = myunit
	vbutton.sprite_index = vbutton.oversprite
    vx += 38
    if (vx-x) > 180{
        vx = startx
        vy += 36
        }
    }
    
with oItemPurchaseButton{
    event_perform(ev_other,ev_user15)
    event_perform(ev_other,ev_user1)//purchase button specific init
    }

