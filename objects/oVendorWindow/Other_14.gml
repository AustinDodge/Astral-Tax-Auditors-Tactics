with cancel{
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
mouse_clear(mb_left)
//instance_create(x,y,oActionControl)
//oActionControl.clickunit = myunit
//oActionControl.clickunitwhendone = 1
//sMakeButtons(myunit)
sClickOnPlayerUnit(myunit)

clickmode = 1
instance_destroy()

