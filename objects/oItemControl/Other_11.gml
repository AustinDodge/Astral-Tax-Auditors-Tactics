var vtile,vunit,vunit,gunit,i,vdepth,vuseditem,vlist,vpos,vpath,vx,vy,gx,gy;
actionmode = 2
cangive = 1

if cangive = 1{//if the unit has free slots
    vuseditem = 1
    if object_is_ancestor(startunit,oUnitParent){
        //if both are units, have them face each other
        startunit.facing = sUnitFaceUnit(startunit,ptargetunit)
        ptargetunit.facing = sUnitFaceUnit(ptargetunit,startunit)
        }else{
        //otherwise have the targetunit face the 
        ptargetunit.facing = sTileFaceTile(ptargetunit.mytile,startunit)
        }
    
    vx = pitem.x
    vy = pitem.y
    gx = ptargetunit.x
    gy = ptargetunit.y-28
    vpath = sItemMakeThrowPath(vx,vy,gx,gy)
    with pitem{
        mypath = vpath
        path_start(vpath,3,path_action_stop,0)
        }
    pitem.target = ptargetunit
    pitem.targetunit = ptargetunit
    pitem.thrown = 1
    
    //startunit = ptargetunit//make startunit the unit, not the crate
    endanim = 0
    }
    
if vuseditem = 1{//if the item was used, remove it from startunit's inventory then destroy oItemControl
    instance_create(x,y,oActionControl)
    oActionControl.startunit = ptargetunit
    oActionControl.clickunit = ptargetunit
    oActionControl.clickunitwhendone = 1
    sDestroyRangeTiles()
    
    with oInventoryButton{
        instance_destroy()
        }
    //I don't know why I made startunit the crate instead of the unit, but roll with it.
    //I don't want to break anything now.
    startunit = ptargetunit
    //sMakeInventoryButtons(startunit)
    findingtarget = 0
    //startunit.turnover = 1
    //startunit.moved = 1
    
    }


