/// @description sMakeInventoryButtons(vunit)
/// @param vunit
/*this script makes the inventory buttons along the bottom of the screen
*/

var vunit,vx,vy,i,howmany,vbutton,xspace,vitem,vlist,vuses,vnum,vdata;
vunit = argument0

//xspace = round(130/(vunit.inventoryslots+1))
xspace = 26

with oInventoryButton{
    instance_destroy()
    }
howmany = vunit.inventoryslots

vx = camera_get_view_x(maincameraid) + 75
vy = (camera_get_view_y(maincameraid)+camrealheight) - 45


//All weapon, armor, and regular item buttons are made in the same loop now.

for(i = 0; i < howmany; i += 1){
    vx += xspace
    vbutton = instance_create(vx,vy,oInventoryButton)
    vbutton.image_speed = 0
    vbutton.isitem = 1
    vbutton.uses = -2
    vbutton.equipped = 0
    //vitem = ds_list_find_value(vunit.inventorylist,i)
    vlist = ds_list_find_value(vunit.inventorylist,i)
    if vlist != undefined{
        vnum = ds_list_find_value(vlist,0)
        vuses = ds_list_find_value(vlist,1)
        
        vbutton.itemnumber = vnum
        vbutton.uses = vuses
        vbutton.mydata = vlist
        vbutton.oversprite = sGetItemInfo(vnum,2)
        vbutton.inventorypos = i
        vbutton.isitem = 1
        if vlist = vunit.myweaponlist{
            vbutton.isitem = 0
            vbutton.isweapon = 1
            vbutton.equipped = 1
            }
        if vlist = vunit.myarmorlist{
            vbutton.isitem = 0
            vbutton.isarmor = 1
            vbutton.equipped = 1
            }
        }else{//if there's no item
        vbutton.image_index = 1
        vbutton.itemnumber = 0
        vbutton.inventorypos = -1
        vbutton.canbeclicked = 0
        }
    
    }
with oInventoryButton{
    //parent = oCamera
    parent = oUnitWindow
    event_perform(ev_other,ev_user15)
    }



