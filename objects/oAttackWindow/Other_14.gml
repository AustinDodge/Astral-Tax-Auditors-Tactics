with cancel{
    instance_destroy()
    }
with confirm{
    instance_destroy()
    }
with shove{
    instance_destroy()
    }
with oButton{
    instance_destroy()
    }
if attackerknocklist > 0{
    ds_list_destroy(attackerknocklist)
    }
if defenderknocklist > 0{
    ds_list_destroy(defenderknocklist)
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

sMakeButtons(attacker)

clickmode = 1
instance_destroy()

