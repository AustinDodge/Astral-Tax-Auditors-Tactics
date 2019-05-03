//status icon image index

pstatusindex += 0.05
if pstatusindex >= 3{
    pstatusindex = 0
    with oStatusIcon{
        changestatus = 1
        }
    }
statusindex = floor(pstatusindex)

if attackpulse = 0{
    //if we're waiting for the next pulse
    pattackindex = 0
    attackindex = 0
    attackpulsecounter += 1
    if attackpulsecounter > attackpulsecountermax{
        attackpulsecounter = 0
        attackpulse = 1
        attackinorout = 1
        }
    }else{
    //if the icon is pulsing
    if attackinorout = 1{
        //pulsing in
        pattackindex += 0.3
        attackindex = floor(pattackindex)
        if attackindex = sprite_get_number(spattackcursordef)-1{
            attackinorout = 0
            }
        }else{
        //pulsing out
        pattackindex -= 0.3
        attackindex = floor(pattackindex)
        if attackindex = 0{
            //done pulsing
            attackpulse = 0
            attackpulsecounter = 0
            }
        }
    }
            

