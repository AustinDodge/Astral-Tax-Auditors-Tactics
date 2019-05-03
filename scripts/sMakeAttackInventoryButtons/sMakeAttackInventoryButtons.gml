/// @description sMakeAttackInventoryButtons()
/*this script makes the inventory buttons along the bottom of the screen when oAttackWindow
is open. It uses 
*/

var vunit,defunit,vx,vy,i,howmany,vbutton,xspace,vitem,vlist,vuses,vnum,vdata;
if instance_exists(oAttackWindow){
    //attacker side
    vunit = oAttackWindow.attacker
    defunit = oAttackWindow.defender
    
    with oInventoryButton{
        instance_destroy()
        }
   // vy = (view_yview[0]+camrealheight) - 23
    
    //vx = view_xview[0] + 168
    vy = (camera_get_view_x(maincameraid)+camrealheight) - 47
    vx = camera_get_view_y(maincameraid) + 140
    
    //make the weapon button
    vbutton = instance_create(vx,vy,oInventoryButton)
    vlist = vunit.myweaponlist
    vbutton.image_speed = 0
    //vitem = vunit.myweapon
    vbutton.isweapon = 1
    vbutton.uses = -2
    vbutton.equipped = 0
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
    vx += 26
    vbutton = instance_create(vx,vy,oInventoryButton)
    vbutton.image_speed = 0
    //vitem = vunit.myarmor
    vlist = vunit.myarmorlist
    vbutton.isarmor = 1
    vbutton.uses = -2
    vbutton.equipped = 0
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
    
    //make the enemy buttons
    vunit = defunit
    vx = (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ))-168
    //make the weapon button
    vbutton = instance_create(vx,vy,oInventoryButton)
    vlist = vunit.myweaponlist
    vbutton.image_speed = 0
    //vitem = vunit.myweapon
    vbutton.isweapon = 1
    vbutton.uses = -2
    vbutton.equipped = 0
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
    vx -= 26
    vbutton = instance_create(vx,vy,oInventoryButton)
    vbutton.image_speed = 0
    //vitem = vunit.myarmor
    vlist = vunit.myarmorlist
    vbutton.isarmor = 1
    vbutton.uses = -2
    vbutton.equipped = 0
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

    with oInventoryButton{
        canbeclicked = 0
        //parent = oCamera
        parent = oUnitWindow
        event_perform(ev_other,ev_user15)
        }
    }
    


