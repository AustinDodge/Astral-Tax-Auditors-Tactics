bx += xspeed
by += yspeed

x = floor(bx)
y = floor(by)

if isreal = 1{//if the particle is part of the world and not the interface
    mx += gxspeed
    my += gyspeed

    mytile = ds_grid_get(tilegrid,floor(mx),floor(my))
    depth = mytile.depth-3
    }

bsteps += 1
if bsteps >= tsteps{
    instance_destroy()
    }

