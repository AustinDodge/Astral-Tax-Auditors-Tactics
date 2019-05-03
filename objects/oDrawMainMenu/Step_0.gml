rot += rotspeed
if rot >= 360{
    rot = 0
    }
if rot < 0{
    rot = 360
    }

x = round(startx + lengthdir_x(rotlength,rot))
y = round(starty + lengthdir_y(rotlength,rot))

