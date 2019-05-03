var vunit,vx,vy;
switch showwhich{
    case 0: sprite_index = spintunitstatsbox; break;
    case 1: sprite_index = spintunitabilitiesbox; break;
    }

draw_self()
switch showwhich{
    case 0://drawing stats*********************************************************************
        vunit = 0
        /*if dunit > 0{
            vunit = dunit
            }
        if sunit > 0{
            vunit = sunit
            }*/
        if instance_exists(dispunit){
            vunit = dispunit
            }
        
        if vunit > 0{
            if vunit.unitisobject = 0 and vunit.unitisitem = 0{
                myunit = dispunit
                draw_set_color(c_white)
                vx = x+5
                vy = y+5
                //draw_text(vx,vy,"STR: "+string(vunit.strength))
                vy += sDrawTextPixelFont(vx,vy,c_white,"STR: "+string(vunit.strength))
                //vy += 25
                //draw_text(vx,vy,"SKL: "+string(vunit.skill))
                vy += sDrawTextPixelFont(vx,vy,c_white,"SKL: "+string(vunit.skill))
                //vy += 25
                //draw_text(vx,vy,"ACC: "+string(vunit.accuracy))
                vy += sDrawTextPixelFont(vx,vy,c_white,"ACC: "+string(vunit.accuracy))
                //vy += 25
                //draw_text(vx,vy,"DEF: "+string(vunit.defense))
                vy += sDrawTextPixelFont(vx,vy,c_white,"DEF: "+string(vunit.defense))
                //vy += 25
                //draw_text(vx,vy,"SPD: "+string(vunit.mspeed))
                vy += sDrawTextPixelFont(vx,vy,c_white,"SPD: "+string(vunit.mspeed))
                }
            }
        ; break;
    case 1://drawing abilities********************************************************************
        ; break;
    }

/* */
/*  */
