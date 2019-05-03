/// @description sTileDrawMovePath()
/*This script is called by a tile that has a movement path on it to draw that path.
*/

var nclimb,eclimb,npath,epath,ndiff,ediff,vy;

npath = 0//if the path has a component that leads north
epath = 0//if the path has a component that leads east
nclimb = 0//if the path has a vertical component to the north
eclimb = 0//same for east
ndiff = 0//the number of elevations to draw to the north
ediff = 0//the number of elevations to draw to the east
vy = 0

if movepathindex < 14{//if the sprite doesn't need to draw climbing
    draw_sprite(spmovepath,movepathindex,x,y)
    //determine if there needs to be climbing/falling drawn
    switch movepathindex{
        case 0: npath = 1; break;
        case 1: epath = 1; break;
        case 2: npath = 1; break;
        case 3: npath = 1; epath = 1; break;
        case 4: epath = 1; break;
        case 8: npath = 1; break
        case 9: epath = 1; break;
        case 10: npath = 1; break;
        case 11: epath = 1; break;
        }
    if npath = 1{
        with mytile{
            if n.elevation > elevation{
                ndiff = n.elevation - elevation
                }
            }
        if ndiff > 0{
            vy = y-3
            while ndiff > 0{
                ndiff -= 1
                draw_sprite(spmovepath,15,x,vy)
                vy -= elevheight
                }
            }
        }
    if epath = 1{
        with mytile{
            if e.elevation > elevation{
                ediff = e.elevation - elevation
                }
            }
        if ediff > 0{
            vy = y-3
            while ediff > 0{
                ediff -= 1
                draw_sprite(spmovepath,14,x,vy)
                vy -= elevheight
                }
            }
        }
    }
