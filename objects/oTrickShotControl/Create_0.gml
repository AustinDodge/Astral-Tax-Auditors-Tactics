canclick = 0

ptile = -1//the tile under the cursor
targettile = -1//the tile that will be checked for Trick Shot

findingtarget = 1//if finding a tile for oTrickShot to work on
foundtarget = 0//if a target has been found and we're waiting for a unit to enter the tile
animating = 0//if a unit has entered the target tile and is being attacked

myunit = sunit//the unit that's using Trick Shot

myindicator = -1


var vstring;
vstring = "Trick Shot: right-click an unoccupied tile within attack range. Left click to cancel"

mywindow = sMakeGenericInfoWindow(oTileCursor,id,vstring)

sDestroyRangeTiles()
sFindAttackRange(myunit,myunit.mytile)
sMakeAttackRange(myunit.weaponhealing)

