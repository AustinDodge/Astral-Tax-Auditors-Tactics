/// @description sTileFindMovePathDraw(tile)
/// @param tile
/*This script takes the tile the cursor is over as an argument, and finds the
move path that would be followed if the unit was moved to that tile. Move backwards from
the child to the parent and set each tiles onmovepath to 1*/

var vtile,ctile,ptile,vrange,cdir,pdir,vend;
vtile = argument0//the starting tile that the cursor is over
ctile = -1//the "child" tile, that is closer to the cursor tile.
ptile = -1//the parent tile of the current child tile, closer to the unit
pdir = 0//the direction from this tile to it's parent tile
cdir = 0//the direction from this tile to it's child tile
vend = 0

with oMoveRange{
    onmovepath = 0
    }

if vtile.occupied <= 0{//if there's no unit on the tile
    if vtile.cango = 1{//and the tile can be moved to
        ptile = vtile.parent
        ctile = vtile
        vrange = ctile.mymoverange
        //vtile.onmovepath = 1
        with ctile{
            mymoverange.onmovepath = 1
            }
        if ctile = ptile.n{//if the end tile is north of the parent tile
            vrange.movepathindex = 6
            cdir = 0
            }
        if ctile = ptile.e{
            vrange.movepathindex = 7
            cdir = 1
            }
        if ctile = ptile.s{
            vrange.movepathindex = 8
            cdir = 2
            }
        if ctile = ptile.w{
            vrange.movepathindex = 9
            cdir = 3
            }
        while ctile > 0{
            //the work actually happens here
            //ctile.onmovepath = 1//draw path on this tile
            
            ptile = ctile.parent
            vrange = ctile.mymoverange
            with ctile{
                vrange.onmovepath = 1
                }
            if ptile = 0{//if we're reached the end
                vrange.onmovepath = 1
                vend = 1
                switch cdir{
                    case 0: vrange.movepathindex = 10; break;
                    case 1: vrange.movepathindex = 11; break;
                    case 2: vrange.movepathindex = 12; break;
                    case 3: vrange.movepathindex = 13; break;
                    }
                }
            
            if ctile != vtile and vend = 0{
                if ctile = ptile.n{
                    pdir = 2
                    }
                if ctile = ptile.e{
                    pdir = 3
                    }
                if ctile = ptile.s{
                    pdir = 0
                    }
                if ctile = ptile.w{
                    pdir = 1
                    }
                switch cdir{//the direction from this tile to its child, the last tile that was considered
                    case 0:
                        switch pdir{
                            case 0: vrange.movepathindex = 0; cdir = 2; break;
                            case 1: vrange.movepathindex = 3; cdir = 3; break;
                            case 2: vrange.movepathindex = 0; cdir = 0; break;
                            case 3: vrange.movepathindex = 2; cdir = 1; break;
                            }
                        ; break;
                    case 1://move east to the child tile
                        switch pdir{
                            case 0: vrange.movepathindex = 3; cdir = 2; break;
                            case 1: vrange.movepathindex = 1; cdir = 3; break;
                            case 2: vrange.movepathindex = 4; cdir = 0; break;
                            case 3: vrange.movepathindex = 1; cdir = 1; break;
                            }
                        ; break;
                    case 2://move south to the child tile
                        switch pdir{
                            case 0: vrange.movepathindex = 0; cdir = 2; break;
                            case 1: vrange.movepathindex = 4; cdir = 3; break;
                            case 2: vrange.movepathindex = 0; cdir = 0; break;
                            case 3: vrange.movepathindex = 5; cdir = 1; break;
                            }
                        ; break;
                    case 3://move west to the child tile
                        switch pdir{
                            case 0: vrange.movepathindex = 2; cdir = 2; break;
                            case 1: vrange.movepathindex = 1; cdir = 3; break;
                            case 2: vrange.movepathindex = 5; cdir = 0; break;
                            case 3: vrange.movepathindex = 1; cdir = 1; break;
                            }
                        ; break;
                    }
                
                }
            if vend = 0{
                ptile = ctile//this is now the child tile
                ctile = ctile.parent//its parent will be considered next
                }else{
                ctile = 0
                }
            //end determining movepathindex       
            
            
            }
        }
    }
            
        
        


