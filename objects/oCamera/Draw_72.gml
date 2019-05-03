if !surface_exists(tsurface){
    //tsurface = surface_create(wsurfacesize,hsurfacesize)
    tsurface = surface_create(camera_get_view_width(maincameraid),camera_get_view_height(maincameraid))
    view_set_surface_id(0,tsurface)
    }
    

