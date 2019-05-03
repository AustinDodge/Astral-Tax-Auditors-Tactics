if opening = 1{
    //open = 1
    lidheight += 1
    lidalpha -= 0.05
    if lidalpha <= 0{
        opening = 0
        open = 1
        }
    }
if disappearing = 1{
    opening = 0
    open = 0
    myalpha -= 0.05
    if myalpha <= 0{
        instance_destroy()
        }
    }

