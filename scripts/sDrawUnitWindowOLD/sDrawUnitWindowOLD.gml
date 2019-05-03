/// @description sDrawUnitWindow(dx,dy)
/// @param dx
/// @param dy
/*This script draws the unit view window in the lower left corner.
It's usually called by oUnitWindow.
*/


var boxy,wepx,armorx,invx,hpcol,vhp,dx,dy,hpstring,vunit;
dx = argument0
dy = argument1
boxy = __view_get( e__VW.YView, 0 ) + camrealheight
boxy -= 50

wepx = __view_get( e__VW.XView, 0 )+148
armorx = wepx + 41
invx = armorx+41

draw_sprite(spunitwindowcard,0,dx,dy)
draw_sprite(spunitwindowcardoutline,0,dx,dy)
//draw_sprite(spunitportraitstandin,0,dx+1,dy+18)
draw_set_color(c_blue)
draw_set_alpha(0.5)
//draw_rectangle(dx-10,dy-10,dx+100,dy+100,0)
draw_set_color(c_white)
draw_set_alpha(1)
draw_sprite(spintequippedbox,0,wepx,boxy)//draw weapon box
//draw_text(wepx,boxy-15,"WEAPON")
draw_sprite(spintequippedbox,1,armorx,boxy)//draw the armor box
//draw_text(armorx,boxy-15,"ARMOR")
if !instance_exists(oAttackWindow){
    draw_sprite(spintitemsbox,0,invx,boxy)
    }
//draw_text(invx,boxy-15,"INVENTORY")
vunit = -1
if instance_exists(dispunit){
    vunit = dispunit
    }
//if instance_exists(oAttackWindow){//always draw the selected unit when attacking


if vunit > 0{
    vhp = vunit.hp/vunit.maxhp
    hpcol = c_green
    if vhp < 0.75{
        hpcol = c_yellow
        }
    if vhp < 0.25{
        hpcol = c_red
        }
    //draw_sprite(spunitportraitstandin,0,dx+1,dy+18)
    sDrawUnitPortrait(vunit,dx-1,dy+18,0)
    //draw_text(dx+95,dy+10,"LV "+string(vunit.level))
    sDrawTextAuditorFont(dx+95,dy+7,c_black,c_white,"LV. "+string(vunit.level))
    draw_set_color(c_black)
    //draw_text(dx+10,dy+10,vunit.name)//draw the vunit
    sDrawTextAuditorFont(dx+10,dy+7,c_black,c_white,vunit.name)
    
   if vunit.hp >= 0{//if the unit uses HP
        hpstring = "HP: "+string(vunit.hp)+"/"+string(vunit.maxhp)
        }else{
        hpstring = "HP: N/A"
        hpcol = c_white
        }
    draw_set_color(hpcol)
    //sDrawTextAuditorFont(dx+54,dy+23,hpcol,c_white,"HP: "+string(dunit.hp)+"/"+string(dunit.maxhp))
    sDrawTextAuditorFont(dx+54,dy+23,hpcol,c_white,hpstring)
    draw_set_color(c_white)
    if !instance_exists(oAttackWindow){
        //draw_text(dx+54,dy+48,"HIT: "+string(vunit.skill))
        sDrawTextAuditorFont(dx+54,dy+39,c_black,c_white,"HIT: "+string(vunit.skill))
        //draw_text(dx+54,dy+67,"DAM: "+string(sGetDisplayDamage(vunit)))
        sDrawTextAuditorFont(dx+54,dy+55,c_black,c_white,"DAM: "+string(sGetDisplayDamage(vunit)))
        }
    //if vunit.object_index = oAuditor{
    //    draw_text(dx,dy+60,"XP: "+string(vunit.xp)+"/"+string(vunit.nextxp))
    //    }
    if vunit.myweapon > 0{//if vunit is holding a weapon
       // draw_sprite(spinventorybutton,0,wepx+32,boxy+32)
        //draw_sprite(sPickItemSprite(vunit.myweapon),0,wepx+32,boxy+32)
        }else{
        //draw_sprite(spinventorybutton,1,wepx+32,boxy+32)
        }
    if vunit.myarmor > 0{//if vunit has armor
        //draw_sprite(spinventorybutton,0,armorx+32,boxy+32)
        //draw_sprite(sPickItemSprite(vunit.myarmor),0,armorx+32,boxy+32)
        }else{
        //draw_sprite(spinventorybutton,1,armorx+32,boxy+32)
        }
    }
    

//draw_text(dx,dy,"string")
