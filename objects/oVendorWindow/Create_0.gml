x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 )

middlex = __view_get( e__VW.XView, 0 ) + round(camrealwidth/2)
middley = __view_get( e__VW.YView, 0 ) + round(camrealheight/2)

windowheight = sprite_height
windowwidth = sprite_width

windowoffsetx = round(windowwidth/2)
windowoffsety = round(windowheight/2)

x = middlex - windowoffsetx
y = middley - windowoffsety

itemstringwidth = 0



cantakeit = 0
cantakeitnoswap = 0

itemname = ""
itemsprite = 0

windowstring1 = ""
windowstring2 = ""



cancel = instance_create(x+(windowwidth-80),y+(windowheight+5),oCancelButton)
cancel.parent = id
cancel.mystring = "Exit"
cancel.sprite_index = spwordbutton
cancel.depth = depth-1

noswap = -1//if this button will exist, it will be made in user0.

with oButton{
    event_perform(ev_other,ev_user15)
    }
    
windowstring = ""
    
clickmode = 5//set click mode to only operate window elements

