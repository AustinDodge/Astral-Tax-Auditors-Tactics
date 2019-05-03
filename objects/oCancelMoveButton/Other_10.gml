

if canclick = 1{
    if myunit.cancancelmove = 1{//if the unit can be returned
        with myunit{
            ds_list_clear(climbedonlist)
            mytile.occupied = 0
            ds_grid_set(unitposgrid,mx,my,-1)//make the tile empty
            mytile = prevtile
            facing = prevface
            prevtile = 0//reset prevtile
            //and teleport back to mytile
            mx = mytile.mx
            my = mytile.my
            mytile.occupied = id
            ds_grid_set(unitposgrid,mx,my,id)
            x = mytile.x
            y = mytile.y
            depth = mytile.depth-5
            moved = 0
            movepoints = pmovepoints
            }
        if instance_exists(oAttackWindow){
            with oAttackWindow{
                event_perform(ev_other,ev_user4)
                }
            }
        sDestroyRangeTiles()
        sClickOnPlayerUnit(myunit)
        instance_destroy()
        }
    }

