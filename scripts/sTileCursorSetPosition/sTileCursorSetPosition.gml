/// @description sTileCursorSetPosition(vtile)
/// @param vtile
/*Sets the tile cursor to be over the tile argument0
*/

var vtile;
vtile = argument0

with oMapTile{
    onxaxis = 0
    onyaxis = 0
    if mx = vtile.mx{
        onxaxis = 1
        }
    if my = vtile.my{
        onyaxis = 1
        }
    if vtile = id{
        onxaxis = 0
        onyaxis = 0
        }
    }
oTileCursor.x = vtile.x
oTileCursor.y = vtile.y
oTileCursor.mytile = vtile
oTileCursor.depth = vtile.depth-6
