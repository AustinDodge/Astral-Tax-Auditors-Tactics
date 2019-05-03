if realone > 0{
    sprite_index = realone.sprite_index
    image_index = realone.image_index
    depth = realone.depth
    }

if falling = 1{
    y += fallspeed
    if y >= targety{
        falling = 0
        y = targety
        }
    }

