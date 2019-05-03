if !instance_exists(oMenuParent){
    if instance_exists(myunit){
        myunit.turnover = 1
        myunit.moved = 1
        myunit.movepoints = 0
        myunit.cancancelmove = 0
        }
    //canmovecamera = 1
    with mywindow{
        instance_destroy()
        }
    instance_destroy()
    canclick = 1
    }

