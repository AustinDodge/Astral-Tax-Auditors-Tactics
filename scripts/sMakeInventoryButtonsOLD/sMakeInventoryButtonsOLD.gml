/// @description sMakeInventoryButtons(vunit)
/// @param vunit
/*this script makes the inventory buttons along the bottom of the screen
This is the outdated one, but I still make a couple changes, to the vx/vy coords and
xspace.
*/

var vunit,vx,vy,i,howmany,vbutton,xspace,vitem,vlist,vuses,vnum,vdata;
vunit = argument0

//xspace = round(130/(vunit.inventoryslots+1))
xspace = 19

with oInventoryButton{
    instance_destroy()
    }
howmany = vunit.inventoryslots
vy = (__view_get( e__VW.YView, 0 )+camrealheight) - 47

vx = __view_get( e__VW.XView, 0 ) + 81
//make the weapon button
vbutton = instance_create(vx,vy,oInventoryButton)
vlist = vunit.myweaponlist
vbutton.image_speed = 0
//vitem = vunit.myweapon
vbutton.isweapon = 1
vbutton.uses = -2
//if vitem != 0{//check if there's a weapon
if ds_exists(vlist,ds_type_list){
    vnum = ds_list_find_value(vlist,0)
    vuses = ds_list_find_value(vlist,1)
    vbutton.mydata = vlist
    vbutton.itemnumber = vnum
    vbutton.uses = vuses
    vbutton.oversprite = sGetItemInfo(vnum,2)
    vbutton.inventorypos = -1
    vbutton.isweapon = 1
    }else{
    vbutton.image_index = 1
    vbutton.itemnumber = 0
    vbutton.inventorypos = 0
    vbutton.canbeclicked = 0
    }

//make armor button
//vx = view_xview[0] + 207
vx += 41
vbutton = instance_create(vx,vy,oInventoryButton)
vbutton.image_speed = 0
//vitem = vunit.myarmor
vlist = vunit.myarmorlist
vbutton.isarmor = 1
vbutton.uses = -2
//if vitem != 0{//check if there's armor
if ds_exists(vlist,ds_type_list){
    vnum = ds_list_find_value(vlist,0)
    vuses = ds_list_find_value(vlist,1)
    vbutton.itemnumber = vnum
    vbutton.uses = vuses
    vbutton.mydata = vlist
    vbutton.oversprite = sGetItemInfo(vnum,2)
    vbutton.inventorypos = -2
    vbutton.isarmor = 1
    }else{
    vbutton.image_index = 1
    vbutton.itemnumber = 0
    vbutton.inventorypos = 0
    vbutton.canbeclicked = 0
    }

vx += 9

//vx = view_xview[0] + 244 

for(i = 0; i < howmany; i += 1){
    vx += xspace
    vbutton = instance_create(vx,vy,oInventoryButton)
    vbutton.image_speed = 0
    vbutton.isitem = 1
    vbutton.uses = -2
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



