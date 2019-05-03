sDrawUnitWindow(dx,dy)
sDrawMoneyCard(0)

if instance_exists(oAttackWindow){
    sDrawEnemyUnitWindow(dx,dy,oAttackWindow.defender)
    }
/*var boxy,wepx,armorx,invx,hpcol,vhp;
boxy = view_yview[0] + camrealheight
boxy -= 50

wepx = view_xview[0]+148
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
draw_sprite(spintitemsbox,0,invx,boxy)
//draw_text(invx,boxy-15,"INVENTORY")
if dunit != 0{//if there's a dunit to draw
    if sunit = 0{//if there's not an sunit
        if instance_exists(dunit){
            vhp = dunit.hp/dunit.maxhp
            hpcol = c_green
            if vhp < 0.75{
                hpcol = c_yellow
                }
            if vhp < 0.25{
                hpcol = c_red
                }
            draw_sprite(spunitportraitstandin,0,dx+1,dy+18)
            draw_text(dx+95,dy+10,"LV "+string(dunit.level))
            draw_text(dx+10,dy+10,dunit.name)//draw the dunit
            draw_set_color(hpcol)
            draw_text(dx+54,dy+35,"HP: "+string(dunit.hp)+"/"+string(dunit.maxhp))
            draw_set_color(c_white)
            draw_text(dx+54,dy+48,"HIT: "+string(dunit.skill))
            draw_text(dx+54,dy+67,"DAM: "+string(sGetDisplayDamage(dunit)))
            //if dunit.object_index = oAuditor{
            //    draw_text(dx,dy+60,"XP: "+string(dunit.xp)+"/"+string(dunit.nextxp))
            //    }
            }
        }else{
        if instance_exists(sunit){
            vhp = sunit.hp/sunit.maxhp
            hpcol = c_green
            if vhp < 0.75{
                hpcol = c_yellow
                }
            if vhp < 0.25{
                hpcol = c_red
                }
            draw_sprite(spunitportraitstandin,0,dx+1,dy+18)
            draw_text(dx+95,dy+7,"LV "+string(sunit.level))
            draw_text(dx+10,dy+7,sunit.name)
            draw_set_color(hpcol)
            draw_text(dx+54,dy+23,"HP: "+string(sunit.hp)+"/"+string(sunit.maxhp))
            draw_set_color(c_white)
            draw_text(dx+54,dy+39,"HIT: "+string(sunit.skill))
            draw_text(dx+54,dy+55,"DAM: "+string(sGetDisplayDamage(sunit)))
            //if sunit.object_index = oAuditor{
            //    draw_text(dx,dy+60,"XP: "+string(sunit.xp)+"/"+string(sunit.nextxp))
            //    }
            if sunit.myweapon > 0{//if sunit is holding a weapon
               // draw_sprite(spinventorybutton,0,wepx+32,boxy+32)
                //draw_sprite(sPickItemSprite(sunit.myweapon),0,wepx+32,boxy+32)
                }else{
                //draw_sprite(spinventorybutton,1,wepx+32,boxy+32)
                }
            if sunit.myarmor > 0{//if sunit has armor
                //draw_sprite(spinventorybutton,0,armorx+32,boxy+32)
                //draw_sprite(sPickItemSprite(sunit.myarmor),0,armorx+32,boxy+32)
                }else{
                //draw_sprite(spinventorybutton,1,armorx+32,boxy+32)
                }
            }
        }
    }
    

//draw_text(dx,dy,"string")

/* */
/*  */
