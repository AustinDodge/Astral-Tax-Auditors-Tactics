/// @description sMapCatwalkFindShadows()
/*This script is a copy-paste from sMapChangeTileCatwalk, to ensure that catwalks draw shadows
correctly after other map elements are added..
*/

var vtile,nneighbor,eneighbor,sneighbor,wneighbor,nstring;

with oCatwalkTile{
    if n > 0{
        if n.object_index = oCatwalkTile{
            nneighbor = 1
            }
        //if n.object_index = oMapTile or n.object_index = oDoorTile or n.object_index = oElevatorTile{
        if n.object_index != oCatwalkTile and n.object_index != oPitTile{
            shadown = 1
            }
        }else{//cast a shadow on the big wall
        shadown = 1
        }
    if e > 0{
        if e.object_index = oCatwalkTile{
            eneighbor = 1
            }
        //if e.object_index = oMapTile or e.object_index = oDoorTile or e.object_index = oElevatorTile{
        if e.object_index != oCatwalkTile and e.object_index != oPitTile{
            shadowe = 1
            }
        }else{
        shadowe = 1
        }
    }
