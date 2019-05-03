var vdir;

if initialized = 1{
    vdir = 0
    if imouse_y < myunit.y{
        vdir = 0//north
        if imouse_x > myunit.x{
            vdir = 1//east
            }
        }else{
        vdir = 3//west
        if imouse_x > myunit.x{
            vdir = 2//south
            }
        }
    if vdir != throwdir{//only do all this when facing a new direction
        sDestroyRangeTiles()
        throwdir = vdir
        myunit.facing = vdir
        myobject.facing = vdir
        if myobject.knockaxis > 0{
            with myobject{
                switch facing{
                    case 0: knockaxis = 1; break;
                    case 1: knockaxis = 2; break;
                    case 2: knockaxis = 1; break;
                    case 3: knockaxis = 2; break;
                    }
                }
            }
        
        if ds_exists(knocklist,ds_type_list){
            ds_list_destroy(knocklist)
            }
        knocklist = -1
        canthrow = 0
        
        if sIsKnockPossible(myobject,vdir){
            knocklist = sMakeKnockRange(myobject,1,vdir,0)
            canthrow = 1
            }
        }//end checking if a new direction is faced
    }
    
if objectfalling = 1{
    myobject.y += objectfallspeed
    objectfallsteps -= 1
    if objectfallsteps <= 0{
        objectfalling = 0
        }
    }

















































