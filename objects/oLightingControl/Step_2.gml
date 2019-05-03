if surface_exists(shadowsurface){
    if surface_get_width(shadowsurface) != camrealwidth or surface_get_height(shadowsurface) != camrealheight{
        surface_resize(shadowsurface,camrealwidth,camrealheight)
        }
    }else{
    shadowsurface = surface_create(camrealwidth,camrealheight)
    }
    
if surface_exists(drawsurface){
    if surface_get_width(drawsurface) != camrealwidth or surface_get_height(drawsurface) != camrealheight{
        surface_resize(drawsurface,camrealwidth,camrealheight)
        }
    }else{
    drawsurface = surface_create(camrealwidth,camrealheight)
    }

