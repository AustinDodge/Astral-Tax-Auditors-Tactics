if open  = 1{
    image_index = 1
    if mx < 0{
        mx += 8
        }
    if mx > 0{
        mx = 0
        }
    }else{
    image_index = 0
    if mx > closedx{
        mx -= 8
        }
    if mx < closedx{
        mx = closedx
        }
    }
    
myunit = dispunit

x = oUnitWindow.x + mx
y = oUnitWindow.y-165

if instance_exists(oAttackWindow){
    x = oUnitWindow.x-300
    }

with oAbilityIcon{
    x = oUnitStatsWindow.x + gx
    y = oUnitStatsWindow.y +gy
    }
depth = oUnitWindow.depth-1



