globalvar cursorlist,stile,intradius,clickmode,dunit;

instance_create(x,y,oTileCursor)
instance_create(x,y,oUnitSelectCursor)
instance_create(x,y,oUnitAttackCursor)

clickmode = 0
//canmakecancelbutton = 0 global that was deleted, only used locally in sMakeButtons
/*detail various clickmodes later
0 = no buttons, no unit selected
*/
canclick = 1
//if the player can click at all
cursorlist = ds_list_create()
//a list of everything under the cursor
stile = 0//the currently selected tile
sunit = 0//the currently selected unit
dunit = 0//the unit currently under the cursor, but not necessarily selected
intradius = 70//the radius of objects near the cursor to check

imouse_x = 0
imouse_y = 0

/* */
/*  */
