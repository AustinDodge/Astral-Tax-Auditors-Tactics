var vx,vy,bx,by,vtile,vunit,i,vfade;

dy -= tspeed
vfade = 0
if dy <= fy{
    vfade = 1
    if tramanimin = 1{
        if myfadestage > 0{
            myfadestage -= 1
            }
        }
    if tramanimout = 1{
        if myfadestage < fallfadesteps{
            myfadestage += 1
            }
        }
    }

for(i = 0; i < ds_list_size(tilelist); i += 1){
    vtile = ds_list_find_value(tilelist,i)
    vtile.y -= tspeed
    vunit = vtile.occupied
    if vunit > 0{
        vunit.y -= tspeed
        vunit.fallfadestage = myfadestage
        }
    vtile.fallfadestage = myfadestage
        
    }

if dy <= targety{
    if tramanimin = 1{
        for(i = 0; i < ds_list_size(tilelist); i += 1){
            vtile = ds_list_find_value(tilelist,i)
            vx = ds_list_find_value(xstartlist,i)
            vy = ds_list_find_value(ystartlist,i)
            vtile.x = vx
            vtile.y = vy
            vtile.fallfadestage = 0
            depth -= 2
            vunit = vtile.occupied
            if vunit > 0{
                vunit.x = vx
                vunit.y = vy
                vunit.depth = vtile.depth-5
                vunit.fallfadestage = 0
                vunit.fadinginblack = 0
                vunit.fadingoutblack = 0
                //vunit.depth -= 2
                }
            }
        instance_create(x,y,oElevatorInterstitialControl)
        instance_create(x,y,oTramInterstitialInfoWindow)
        with oTramInterstitialInfoWindow{
            event_perform(ev_other,ev_user0)
            }
        }//end in animation
    if tramanimout = 1{
        with oAuditor{//kill all auditors who aren't on the door tile
            vtile = ds_grid_get(tilegrid,mx,my)
            if vtile.door != exitdoor{
                hp = 0
                amidead = 1
                }
            }
        with oKOAuditor{
            vtile = ds_grid_get(tilegrid,mx,my)
            if vtile.door != exitdoor{
                amidead = 1
                instance_destroy()
                }
            }
        sDestroyRangeTiles()
        with oButton{
            instance_destroy()
            }
        turnstillnemesis += irandom_range(5,7)
        nemesisonmap = 0
        with oMapControl{
            sMapCreateInit()
            }
        }//end out animation
    instance_destroy()
    }

