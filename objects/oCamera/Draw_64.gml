if surface_exists(tsurface){
    draw_surface_stretched(tsurface,0,0,camrealwidth*viewdiv,camrealheight*viewdiv)
    //draw_surface(tsurface,0,0)
    }
if debug_mode = 1{
    show_debug_overlay(1)
    }
var vfile,vpath,pfile,vnum,vname,vsurface;
vsurface = -1
if takescreenshot = 1 or takevid = 1{
    vsurface = surface_create(__view_get( e__VW.WView, 0 )*viewdiv,__view_get( e__VW.HView, 0 )*viewdiv)
    }
if takescreenshot = 1{
    vfile = file_find_first("*.png",0)
    if vfile != ""{//if it's not an empty string, then determine the file number needed
        vnum = 1
        while vfile != ""{
            pfile = vfile
            vfile = file_find_next()
            vnum += 1
            }
        //vnum += 1
        vname = "screenshot"+string(vnum)+".png"
        }else{
        vname = "screenshot0.png"
        }
    //screen_save(vname)
    surface_set_target(vsurface)
    draw_surface_stretched(tsurface,0,0,__view_get( e__VW.WView, 0 )*viewdiv,__view_get( e__VW.HView, 0 )*viewdiv)
    surface_reset_target()
    surface_save(vsurface,vname)
    }
takescreenshot = 0
if takevid = 1{
    vfile = file_find_first(working_directory+"gif\\*.png",0)
    if vfile != ""{//if it's not an empty string, then determine the file number needed
        vnum = 1
        while vfile != ""{
            pfile = vfile
            vfile = file_find_next()
            vnum += 1
            }
        //vnum += 1
        vname = "screenshot"+string(vnum)+".png"
        }else{
        vname = "screenshot0.png"
        }
    vname = working_directory+"gif\\"+vname
    //screen_save(vname)surface_set_target(vsurface)
    draw_surface_stretched(tsurface,0,0,__view_get( e__VW.WView, 0 )*viewdiv,__view_get( e__VW.HView, 0 )*viewdiv)
    surface_reset_target()
    surface_save(vsurface,vname)
    
    if vnum > 500{
        takevid = 0
        }
    }
if surface_exists(vsurface){
    surface_free(vsurface)
    }
        

