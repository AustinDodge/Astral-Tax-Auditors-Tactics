if fading = 0{//regular step
    if path_position >= 0.5{
        depth = ttile.depth - 3
        }
    if path_position > 0.98{
        if ttile.object_index != oPitTile{
            tile_add(bgunitdebris,10*tcolumn,5*tindex,10,5,x-5,y-2,depth)
            path_delete(mypath)
            instance_destroy()
            }else{//fade out while continuing in new direction
            var vx,vy,dx,dy,zspeed;
            dx = path_get_x(mypath,0.9)
            dy = path_get_y(mypath,0.9)
            vx = path_get_x(mypath,1)
            vy = path_get_y(mypath,1)
            zspeed = path_speed
            vx -= dx
            vy -= dy
            vx *= 10
            vy *= 10
            dx = 0
            dy = 0
            path_delete(mypath)
            mypath = path_add()
            path_set_kind(mypath,1)
            path_set_closed(mypath,0)
            path_add_point(mypath,dx,dy,100)
            path_add_point(mypath,vx,vy,100)
            path_add_point(mypath,vx,vy+100,100)
            path_start(mypath,zspeed,path_action_stop,0)
            fading = 1
            }    
        }
    }else{
    //fading out into pit
    blendamount += 0.4
    if blendamount >= 1{
        path_delete(mypath)
        instance_destroy()
        }
    }

