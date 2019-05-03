//CANCEL button clicked

with cancel{
    instance_destroy()
    }
with confirm{
    instance_destroy()
    }
with oButton{
    instance_destroy()
    }

with oMoveRange{
    visible = 1
    }
with oAttackRange{
    visible = 1
    }
with oKnockRange{
    instance_destroy()
    }
with oButton{
    instance_destroy()
    }
with mycontainer{
    var vstandin;
    disappearing = 1
    depth += 1
    vstandin = instance_create(x,y-10,oContainerItemStandin)
    vstandin.depth = depth-2
    vstandin.mx = mx
    vstandin.my = my
    vstandin.mytype = iteminside
    vstandin.sprite_index = sGetItemInfo(iteminside,2)
    vstandin.fadeout = 1
    vstandin.targety = mytile.y
    vstandin.mydata = sMakeItemData(iteminside,-1)
    
    
    }
instance_create(x,y,oActionControl)
oActionControl.clickunit = myunit
oActionControl.clickunitwhendone = 1
//sMakeButtons(myunit)

clickmode = 1
instance_destroy()

