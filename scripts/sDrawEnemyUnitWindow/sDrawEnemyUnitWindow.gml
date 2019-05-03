/// @description sDrawEnemyUnitWindow(dx,dy,aunit)
/// @param dx
/// @param dy
/// @param aunit
/*This script draws the unit view window in the lower left corner.
It's usually called by oUnitWindow.
*/


var boxy,wepx,armorx,invx,hpcol,vhp,dx,dy,aunit,hpstring;
dx = argument0
dy = argument1
dx += (camrealwidth-83)
aunit = argument2

boxy = __view_get( e__VW.YView, 0 ) + camrealheight
boxy -= 50

wepx = dx-148
armorx = wepx - 41
invx = armorx-41

if aunit.team != playerturn{
    draw_sprite(spenemyunitwindowcard,0,dx,dy)
    draw_sprite(spenemyunitwindowcardoutline,0,dx,dy)
    }else{
    draw_sprite(spallyunitwindowcard,0,dx,dy)
    draw_sprite(spallyunitwindowcardoutline,0,dx,dy)
    }
//draw_sprite(spunitportraitstandin,0,dx+1,dy+18)
//draw_set_color(c_blue)
//draw_set_alpha(0.5)
//draw_rectangle(dx-10,dy-10,dx+100,dy+100,0)
draw_set_color(c_white)
draw_set_alpha(1)
//draw_sprite(spintenemyequippedbox,0,wepx,boxy)//draw weapon box
//draw_text(wepx,boxy-15,"WEAPON")
//draw_sprite(spintenemyequippedbox,1,armorx,boxy)//draw the armor box
//draw_text(armorx,boxy-15,"ARMOR")

//draw_text(invx,boxy-15,"INVENTORY")

if instance_exists(aunit){
    vhp = aunit.hp/aunit.maxhp
    hpcol = c_green
    if vhp < 0.75{
        hpcol = c_yellow
        }
    if vhp < 0.25{
        hpcol = c_red
        }
    //draw_sprite(spunitportraitstandin,0,dx-49,dy+18)
    sDrawUnitPortrait(aunit,dx-49,dy+18,1)
    sDrawTextAuditorFont(dx-(95+string_width(string_hash_to_newline("LV "+string(aunit.level)))),dy+7,c_black,c_white,"LV "+string(aunit.level))
    
    sDrawTextAuditorFont(dx-(10+string_width(string_hash_to_newline(aunit.name))),dy+7,c_black,c_white,aunit.name)
    if aunit.hp >= 0{//if the unit uses HP
        hpstring = "HP: "+string(aunit.hp)+"/"+string(aunit.maxhp)
        }else{
        hpstring = "HP: N/A"
        hpcol = c_white
        }
    draw_set_color(hpcol)
    sDrawTextAuditorFont(dx-(54+string_width(string_hash_to_newline(hpstring))),dy+23,hpcol,c_white,hpstring)
    //sDrawTextAuditorFont(dx-(54+string_width("HP: "+string(aunit.hp)+"/"+string(aunit.maxhp))),dy+23,hpcol,c_white,"HP: "+string(aunit.hp)+"/"+string(aunit.maxhp))
    //draw_set_color(c_white)

    //if aunit.object_index = oAuditor{
    //    draw_text(dx,dy+60,"XP: "+string(aunit.xp)+"/"+string(aunit.nextxp))
    //    }
    if aunit.myweapon > 0{//if aunit is holding a weapon
       // draw_sprite(spinventorybutton,0,wepx+32,boxy+32)
        //draw_sprite(sPickItemSprite(aunit.myweapon),0,wepx+32,boxy+32)
        }else{
        //draw_sprite(spinventorybutton,1,wepx+32,boxy+32)
        }
    if aunit.myarmor > 0{//if aunit has armor
        //draw_sprite(spinventorybutton,0,armorx+32,boxy+32)
        //draw_sprite(sPickItemSprite(aunit.myarmor),0,armorx+32,boxy+32)
        }else{
        //draw_sprite(spinventorybutton,1,armorx+32,boxy+32)
        }
    
    }


//draw_text(dx,dy,"string")
