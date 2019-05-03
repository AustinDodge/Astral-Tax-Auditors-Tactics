x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 )


attackerhit = 0
defenderhit = 0
attackerdamage = 0
defenderdamage = 0
attackercrit = 0
defendercrit = 0
attackerknock = 0
defenderknock = 0

defendergoesfirst = 0//if the defending unit has a boost that lets it attack first

dispattackerhit = "-"//the string the window will display
dispdefenderhit = "-"
dispattackerdamage = "-"
dispdefenderdamage = "-"
dispattackercrit = "-"
dispdefendercrit = "-"
dispattackerknock = "-"
dispdefenderknock = "-"

candefenderattack = 1//if the defending unit can perform a counter-attack

attackerknocklist = -1//the list that may be made containing the tiles the attacker may be knocked through
defenderknocklist = -1//same thing but for the defender's knock path

windowheight = 200
windowwidth = 200

confirm = instance_create_depth(x+(round(camrealwidth/2)-95),y+windowheight+60,depth+1,oConfirmButton)
confirm.parent = id
confirm.mystring = "Attack"
confirm.sprite_index = spwordbutton
confirm.depth = depth-1
confirm.mask_index = spwordbutton
cancel = instance_create_depth(x+(round(camrealwidth/2)+20),y+windowheight+60,depth-1,oCancelButton)
cancel.parent = id
cancel.mystring = "Cancel"
cancel.sprite_index = spwordbutton
cancel.depth = depth-1
cancel.mask_index = spwordbutton

shove = -1//the shove button

with oButton{
    event_perform(ev_other,ev_user15)
    }
    
clickmode = 5//set click mode to only operate window elements

