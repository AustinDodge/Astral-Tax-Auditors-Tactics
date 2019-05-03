switch stage{
    case 1://make object and stand-in
        if !instance_exists(oActionControl){
            if oCamera.cameratargeting = 0{
                //make the nemesis on the tile
                switch nemesistype{
                    case 0: nemobject = oOsculaNemesis; break;
                    }
                neminstance = instance_create(nemtile.x,nemtile.y,nemobject)
                neminstance.visible = 0
                neminstance.aiactivated = 1
                
                nemstandin = instance_create(neminstance.x,__view_get( e__VW.YView, 0 )-30,oNemesisStandin)
                sUnitMakeLightSource(nemstandin,10,40)
                nemstandin.realone = neminstance
                nemstandin.targety = neminstance.y
                neminstance.unitmovesound = soundStompMove1
                
                sMakeUnitInMap(neminstance,nemtile,0)
                with neminstance{
                    ds_list_replace(abilitieslist,10,1)//give nemesis Cliff Hanger 3 to start
                    ds_list_replace(abilitieslist,19,1)//give nemesis No Shoving to start
                    }
                
                stage += 1
                }
            }
        ; break;
    case 2://replace with real nemesis when stand-in finishes falling
        if nemstandin.falling = 0{//with the standin finishes falling
            with nemstandin{
                instance_destroy()
                }
            with neminstance{
                visible = 1
                sUnitMakeLightSource(id,10,40)
                }
            stage += 1
            }
        ; break;
    case 3://nemesis placed, destroy self
        canclick = 1
        instance_destroy()
        instance_create(x,y,oActionControl)
        }

