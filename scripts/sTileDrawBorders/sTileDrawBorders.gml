/// @description sTileDrawBorders()

//this script is run during map creation and tells each tile whether or not it should
//draw a border or not. It must be run after final neighbors are found.

with oMapTile{
    if n > 0{
        if n.elevation != elevation{
            bordern = 1
            }
        if n.object_index = oPitTile and object_index != oPitTile{
            safetyn = 1
            safetyborder = 1
            bordern = 1
            }
        if n.object_index = oDoorTile{
            bordern = 1
            }
        }else{
        bordern = 1
        }
    if e > 0{
        if e.elevation != elevation{
            bordere = 1
            }
        if e.object_index = oPitTile and object_index != oPitTile{
            safetye = 1
            safetyborder = 1
            bordere = 1
            }
        if e.object_index = oDoorTile{
            bordere = 1
            }
        }else{
        bordere = 1
        }
    if s > 0{
        if s.elevation != elevation{
            borders = 1
            }
        if s.object_index = oPitTile and object_index != oPitTile{
            safetys = 1
            safetyborder = 1
            borders = 1
            }
        if s.object_index = oDoorTile{
            //borders = 1
            }
        
        }else{
        //borders = 1
        }
    if w > 0{
        if w.elevation != elevation{
            borderw = 1
            }
        if w.object_index = oDoorTile{
            //borderw = 1
            }
        if w.object_index = oPitTile and object_index != oPitTile{
            safetyw = 1
            safetyborder = 1
            borderw = 1
            }
        }else{
        //borderw = 1
        }
    }
    

