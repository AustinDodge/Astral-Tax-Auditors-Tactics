if fadeout = 1{
    myalpha -= 0.03
    middrop += 0.3
    if middrop >= 1{
        y += 1
        //middrop = 0
        }
    if myalpha <= 0{
        if myanimtarget != 0{
            myanimtarget.anim = 1
            }
        instance_destroy()
        }
    }

