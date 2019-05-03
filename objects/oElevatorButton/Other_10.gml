if parent != 0{
    with parent{
        animating = 1
        donemoving = 0
        if elevation = lowelevation{//if down, go up
            goingup = 1
            }else{
            goingdown = 1
            }
        //correct move points
        occupied.ptile = id
        occupied.pmovepoints = occupied.movepoints
        sDestroyRangeTiles()
        if !instance_exists(oActionControl){
            instance_create(x,y,oActionControl)
            oActionControl.startunit = occupied
            oActionControl.clickunitwhendone = 1
            }
        }
    }

