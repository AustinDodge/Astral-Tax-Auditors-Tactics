var vxborder,vyborder,vunit;

if movingcamera = 0{
    vxborder = 50
    vyborder = 30
    if ds_priority_size(unitmovepriority) > 0{
        vunit = ds_priority_find_max(unitmovepriority)
        }else{
        show_message("error, no unit in priority!")
        }
    if abs(oCamera.x - vunit.x) > vxborder or abs(oCamera.y - vunit.y) > vyborder{
        movingcamera = 1
        oCamera.xborder = vxborder
        oCamera.yborder = vyborder
        oCamera.targetspeed = 6
        //vunit = 0
        if vunit > 0{
            oCamera.targetx = vunit.x
            oCamera.targety = vunit.y
            oCamera.cameratargeting = 1
            }else{
            show_message("Error while moving AI camera, no next unit to pick!")
            }
        }
    }
if oCamera.cameratargeting = 0{//done moving camera, go to next AI stage
    movingcamera = 0
    stage += 1
    }
