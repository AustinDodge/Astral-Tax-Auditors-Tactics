var vfile,vpath,pfile,vnum,vname;
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
    screen_save(vname)
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
    screen_save(vname)
    
    if vnum > 500{
        takevid = 0
        }
    }
        

