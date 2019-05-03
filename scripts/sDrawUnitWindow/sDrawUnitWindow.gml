/// @description sDrawUnitWindow(dx,dy)
/// @param dx
/// @param dy
/*This script draws the unit view window in the lower left corner.
Specifically, it draws the unit window at dx,dy, with those defining the bottom left corner of the unit window.
It's usually called by oUnitWindow.
*/


var boxy,wepx,armorx,invx,hpcol,vhp,dx,dy,hpstring,vunit,vbarimages,vx,vy,vwidth,vdam,boxxmod,boxymod,vxpindex;
dx = argument0//the lower left corners of the view
dy = argument1
//boxy = camera_get_view_y(maincameraid) + camrealheight//after all calculations, 50 pixels above the bottom of the screen
//boxy -= 51

//wepx = camera_get_view_x(maincameraid)+148
//armorx = wepx + 41
//invx = armorx+41

boxxmod = sprite_get_width(spunitboxbaseOLD)
boxymod = sprite_get_height(spunitboxbaseOLD)

dy -= (boxymod+4)

//draw_text(invx,boxy-15,"INVENTORY")
vunit = -1
if instance_exists(dispunit){
    vunit = dispunit
    }
//if instance_exists(oAttackWindow){//always draw the selected unit when attacking


if vunit > 0{
    //draw unit portrait
    sDrawUnitPortrait(vunit,dx+6,dy-41,0)   
    //reset x/y coordinates
    dx += 54
    //dy -= (boxymod+4)
    //draw unit stat box 
    draw_sprite(spunitboxbase,0,dx,dy)
    //draw text
    //name
    sDrawTextAuditorFont(dx-48,dy-55,c_black,c_white,vunit.name)
	//xp bar
	vxpindex = floor(sprite_get_number(spunitboxxpbar)*(vunit.xp/100))
	draw_sprite(spunitboxxpbar,vxpindex,dx+2,dy+1)	
    //level
    sDrawTextAuditorMidFont(dx+3,dy+1,c_black,c_white,"LV")
    vx = 21
    draw_set_font(fontAuditorShadowMain)
    vwidth = floor(string_width(string_hash_to_newline(vunit.level))/2)
    vx -= vwidth
    sDrawTextAuditorFont(dx+vx,dy+5,c_black,c_white,vunit.level)
    //HP
    if vunit.hp >= 0{//if the unit uses HP
        //draw unit HP bar
        vbarimages = 31//the number of sprites for the HP bar
        if vunit.hp = vunit.maxhp{
            vhp = vbarimages
            }else{
            vhp = floor(vbarimages*(vunit.hp/vunit.maxhp))
            }
        draw_sprite(spunitboxhpbar,vhp,dx+1,dy+18)
        hpstring = +string(vunit.hp)
        }else{
        hpstring = "N/A"
        hpcol = c_white
        }
    sDrawTextAuditorMidFont(dx+3,dy+15,c_black,c_white,"HP")
    sDrawTextAuditorMidFont(dx+14,dy+15,c_black,c_white,":")
    vx = 25
    draw_set_font(fontAuditorMidBody)
    vwidth = floor(string_width(string_hash_to_newline(hpstring))/2)
    vx -= vwidth
    sDrawTextAuditorMidFont(dx+vx,dy+15,c_black,c_white,hpstring)
    //sDrawTextAuditorMidFont(dx+3,dy+15,c_black,c_white,hpstring)
    //hit
    sDrawTextAuditorMidFont(dx+3,dy+24,c_black,c_white,"HIT")
    sDrawTextAuditorMidFont(dx+18,dy+24,c_black,c_white,":")
    vx = 29
    draw_set_font(fontAuditorMidBody)
    vwidth = floor(string_width(string_hash_to_newline(vunit.skill))/2)
    vx -= vwidth
    sDrawTextAuditorMidFont(dx+vx,dy+24,c_black,c_white,vunit.skill)
    //string(vunit.skill)    
    //draw_text(dx+54,dy+67,"DAM: "+string(sGetDisplayDamage(vunit)))
    sDrawTextAuditorMidFont(dx+3,dy+32,c_black,c_white,"DAM")
    sDrawTextAuditorMidFont(dx+20,dy+32,c_black,c_white,":")
    vdam = sGetDisplayDamage(vunit)
    vx = 28
    draw_set_font(fontAuditorMidBody)
    vwidth = floor(string_width(string_hash_to_newline(vdam))/2)
    vx -= vwidth
    sDrawTextAuditorMidFont(dx+vx,dy+32,c_black,c_white,vdam)
    //string(sGetDisplayDamage(vunit))
    
    //done drawing text on the box, now draw inventory/actions stuff
    //reset dx/dy
    //dx = camera_get_view_x(maincameraid) + 46
	dx -= 8
    //dy = (camera_get_view_y(maincameraid)+camrealheight)-(boxymod+1)
    dx += 43
    dy -= 25
    
    sDrawTextAuditorMidFont(dx,dy,c_black,c_white,"INVENTORY")
    dx += 4
    dy += 37
    sDrawTextAuditorMidFont(dx,dy,c_black,c_white,"ACTIONS")
    
    
    
    draw_set_color(c_white)
    draw_set_alpha(1)
    //draw_sprite(spintequippedbox,0,wepx,boxy)//draw weapon box
    //draw_text(wepx,boxy-15,"WEAPON")
    //draw_sprite(spintequippedbox,1,armorx,boxy)//draw the armor box
    //draw_text(armorx,boxy-15,"ARMOR")
    if !instance_exists(oAttackWindow){
        //draw_sprite(spintitemsbox,0,invx,boxy)
        }
    
    draw_set_color(c_white)
    }
    

//draw_text(dx,dy,"string")
