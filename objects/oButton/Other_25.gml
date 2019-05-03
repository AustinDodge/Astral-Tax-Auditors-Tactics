if parent != 0{
    dx = x-parent.x
    dy = y-parent.y
    }
    
glowsprite = spbuttonglow
if sprite_index = spitemactionbutton{
    glowsprite = spitemactionbuttonglow
    }
if sprite_index = spwordbutton{
    glowsprite = spwordbuttonglow
    }
if object_index = oAbilityLearnButton{
    glowsprite = spabilityiconglow
    }

