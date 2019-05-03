if animating = 1{
    switch animstage{
        case 1://lift and disappear lid
            topalpha -= 0.1
            lidpos += 1
            if topalpha = 0{
                animstage += 1
                }
            break;
        case 2://disappear bottom
            bottomalpha -= 1
            if bottomalpha = 0{
                animstage += 1
                }
            break;
        case 3://destroy
            instance_destroy()
            ; break;
        }
    }

