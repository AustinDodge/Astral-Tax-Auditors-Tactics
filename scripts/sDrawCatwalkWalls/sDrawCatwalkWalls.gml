/// @description sDrawTileWalls()

//this script draws the walls described in sMakeTileWalls
/*don't forget that the tile walls are described with the bottom left corner at 0,0
*/

var vx,vy,px,py,startx,starty,gridheight,startpx,listsize,vgrid,i,vtile,vtile2,vval,nwall,ewall,swall,wwall,howmany,whichwall;

switch maptheme{
    case 0: whichwall = 0; break;//industrial
    case 1: whichwall = 1; break;//park
    }

//start by drawing the south facing walls
with oCatwalkTile{
    nwall = 0
    ewall = 0
    swall = 0
    wwall = 0
    howmany= 0
    if n > 0{
        if n.object_index != oPitTile and n.object_index != oDoorTile{
            if n.elevation < elevation-1{
                nwall = 1
                }
            }
        }
    if e > 0{
        if e.object_index != oPitTile and e.object_index != oDoorTile{
            if e.elevation < elevation-1{
                ewall = 1
                }
            }
        }
    if s > 0{
        if s.object_index != oPitTile and s.object_index != oDoorTile{
            if s.elevation < elevation-1{
                swall = 1
                }
            }
        }
    if w > 0{
        if w.object_index != oPitTile and w.object_index != oDoorTile{
            if w.elevation < elevation-1{
                wwall = 1
                }
            }
        }
    if nwall = 1{
        howmany = (elevation-1)-n.elevation
        px = x-drawtilexadd
        py = y//+elevheight+1
        while howmany > 0{
            howmany -= 1
            tile_add(catwalkwallbg,tilewallw*3,tilewallh*whichwall,tilewallw,tilewallh,px,py,depth+1)
            py += elevheight
            }
        }
    if ewall = 1{
        howmany = (elevation-1)-e.elevation
        px = x
        py = y//+elevheight+1
        while howmany > 0{
            howmany -= 1
            tile_add(catwalkwallbg,tilewallw*2,tilewallh*whichwall,tilewallw,tilewallh,px,py,depth+1)
            py += elevheight
            }
        }
    if swall = 1{
        howmany = (elevation-1)-s.elevation
        px = x
        py = y+elevheight+1
        while howmany > 0{
            howmany -= 1
            tile_add(catwalkwallbg,tilewallw*3,tilewallh*whichwall,tilewallw,tilewallh,px,py,s.depth+1)
            py += elevheight
            }
        }
     if wwall = 1{
        howmany = (elevation-1)-w.elevation
        px = x-drawtilexadd
        py = y+elevheight+1
        while howmany > 0{
            howmany -= 1
            tile_add(catwalkwallbg,tilewallw*2,tilewallh*whichwall,tilewallw,tilewallh,px,py,w.depth+1)
            py += elevheight
            }
        }
     }

