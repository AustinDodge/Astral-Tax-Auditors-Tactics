/// @description sGetTileUnderCursor()
/*Returns the tile currently under the cursor.
*/

var vthing,vdepth;
vdepth = 10000

vthing = 0
with oMapTile{
   if point_distance(imouse_x,imouse_y,x,y,) < intradius{//limit collision checks by only checking within a certain distance
        if collision_point(imouse_x,imouse_y,id,1,0){//if the unit is right under the cursor
            if depth < vdepth{//if it's at a lower depth than whatever was last checked
                vthing = id
                vdepth = vthing.depth
                }
            }
        }
   }
   
return vthing;
