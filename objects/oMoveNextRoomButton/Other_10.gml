var vtile;

if canclick = 1{
    //sTramAnimate(1)
    instance_create(x,y,oWaitForMeControl)
    with oWaitForMeControl{
        event_perform(ev_other,ev_user0)
        }
    /*with oAuditor{//kill all auditors who aren't on the door tile
        vtile = ds_grid_get(tilegrid,mx,my)
        if vtile.door != exitdoor{
            hp = 0
            }
        }
    sDestroyRangeTiles()
    with oButton{
        instance_destroy()
        }
    with oMapControl{
        sMapCreateInit()
        }*/
    }

/* */
/*  */
