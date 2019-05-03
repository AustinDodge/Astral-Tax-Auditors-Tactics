var vdef;

x = -2000
y = -2000
if instance_exists(oAttackWindow){
    if oAttackWindow.defender > 0{
        vdef = oAttackWindow.defender
        x = vdef.x
        y = vdef.y -10
        depth = vdef.depth-2
        }
    }

