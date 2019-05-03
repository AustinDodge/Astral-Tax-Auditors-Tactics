if makenewmap = 1{
    makenewmap = 0
    sDestroyRangeTiles()
    with oButton{
        instance_destroy()
        }
    sMapCreateInit()
    }

