door = ds_grid_get(tiletypegrid,mx,my,)
bordersprite = metaltileborder
switch door{
    case 1: sprite_index = reddoortile; break;
    case 2: sprite_index = yellowdoortile; break;
    case 3: sprite_index = greendoortile; break;
    case 4: sprite_index = bluedoortile; break;
    }

var vn,ve,vs,vw,vstr,vterminal;
vn = 0
ve = 0
vs = 0
vw = 0
for(i = 0; i < 4; i += 1){
    switch i{
        case 0: vx = mx; vy = my-1; break;//n
        case 1: vx = mx+1; vy = my; break;//e
        case 2: vx = mx; vy = my+1; break;//s
        case 3: vx = mx-1; vy = my; break;//w
        }
    if sIsTileLocationValid(vx,vy){
        vtile = ds_grid_get(tilegrid,vx,vy)
        if vtile.object_index = oDoorTile{
            switch i{
                case 0: vn = 1; break;//n
                case 1: ve = 1; break;//e
                case 2: vs = 1; break;//s
                case 3: vw = 1; vy = my; break;//w
                }
            }
        }
    }
vstr = string(vn)+string(ve)+string(vs)+string(vw)
switch vstr{
    case "0110": borderind = 0;break;//nw corner
    case "0011": borderind = 1;break;//ne corner
    case "1001": borderind = 2;break;//se corner
    case "1100": borderind = 3;break;//sw corner
    case "0111": borderind = 4;break;//north
    case "1011": borderind = 5;break;//east
    case "1101": borderind = 6;break;//south
    case "1110": borderind = 7;break;//west
    }
if door = 1 or door = 3{
    
    switch vstr{
        case "0110": screenind = 0;break;//nw corner
        case "0011": screenind = 2;break;//ne corner
        case "1001": screenind = 5;break;//se corner
        case "1100": screenind = 3;break;//sw corner
        case "0111": screenind = 1;break;//north
        case "1011": screenind = 6;break;//east
        case "1101": screenind = 4;break;//south
        case "1110": screenind = 6;break;//west
        }
    }
if door = 2 or door = 4{
    switch vstr{
        case "0110": screenind = 0;break;//nw corner
        case "0011": screenind = 1;break;//ne corner
        case "1001": screenind = 5;break;//se corner
        case "1100": screenind = 4;break;//sw corner
        case "0111": screenind = 6;break;//north
        case "1011": screenind = 3;break;//east
        case "1101": screenind = 6;break;//south
        case "1110": screenind = 2;break;//west
        }
    }

if door = 1 and vstr = "0111"{//north terminal
    vterminal = instance_create(x,y,oTramTerminal)
    vterminal.parent = id
    vterminal.depth = depth-1
    }
if door = 2 and vstr = "1011"{
    vterminal = instance_create(x,y,oTramTerminal)
    vterminal.parent = id
    vterminal.depth = depth-1
    }
if door = 3 and vstr = "1100"{
    vterminal = instance_create(x,y,oTramTerminal)
    vterminal.parent = id
    vterminal.depth = depth-1
    }
if door = 4 and vstr = "1100"{
    vterminal = instance_create(x,y,oTramTerminal)
    vterminal.parent = id
    vterminal.depth = depth-1
    }






































