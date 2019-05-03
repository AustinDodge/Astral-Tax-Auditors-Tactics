/// @description sUnitMakeDebris(unittype)
/// @param unittype
/*Creates the debris particles when a unit is destroyed. Called by the unit.
*/

var vtype,vrangemin,vrangemax,vspeedmin,vspeedmax,vcolumn,vindexes,vlist,vpartsmin,vpartsmax,vspr,i,
vhowmanyparts,vdebris,vind,vtile,vpoints,xoff,yoff,mdirx,mdiry,vdist,vdone,px,py,vx,vy,vdir,vdoit,vtrail,vtrailtime;

vtype = argument0//the type of debris being made
vdoit = 0

switch vtype{
    case 1://robit
        vcolumn = 0//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 1//the minimum number of tiles away the target tile can be
        vrangemax = 3//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 6//the number of different debris particles
        vpartsmin = 5//the minimum number of debris parts
        vpartsmax = 9//the maximum number of debris parts
        vspr = sprobot1debris
        vtrail = oSmallSteamParticle
        vtrailtime = 2
        vdoit = 1
        ; break;
    case 3://spooky robit
        vcolumn = 1//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 1//the minimum number of tiles away the target tile can be
        vrangemax = 3//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 6//the number of different debris particles
        vpartsmin = 5//the minimum number of debris parts
        vpartsmax = 9//the maximum number of debris parts
        vspr = spspookyrobotdebris
        vtrail = oSmallGreenTrailParticle
        vtrailtime = 4
        vdoit = 1
        ; break;
    case 2://electro robit
        vcolumn = 2//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 1//the minimum number of tiles away the target tile can be
        vrangemax = 3//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 6//the number of different debris particles
        vpartsmin = 5//the minimum number of debris parts
        vpartsmax = 9//the maximum number of debris parts
        vspr = spelectrobotdebris
        vtrail = oSmallPlasmaTrailParticle
        vtrailtime = 1
        vdoit = 1
        ; break;
    case 4://skullsplode
        vcolumn = 3//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 1//the minimum number of tiles away the target tile can be
        vrangemax = 3//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 7//the number of different debris particles
        vpartsmin = 8//the minimum number of debris parts
        vpartsmax = 12//the maximum number of debris parts
        vspr = spskullsplodedebris
        vtrail = oSmallGreenTrailParticle
        vtrailtime = 2
        vdoit = 1
        ; break;
    case 5://hoverspark
        vcolumn = 4//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 1//the minimum number of tiles away the target tile can be
        vrangemax = 3//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 7//the number of different debris particles
        vpartsmin = 8//the minimum number of debris parts
        vpartsmax = 12//the maximum number of debris parts
        vspr = sphoversparkdebris
        vtrail = oSmallPlasmaTrailParticle
        vtrailtime = 1
        vdoit = 1
        ; break;
    case 6://cabra
        vcolumn = 5//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 0//the minimum number of tiles away the target tile can be
        vrangemax = 2//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 6//the number of different debris particles
        vpartsmin = 5//the minimum number of debris parts
        vpartsmax = 8//the maximum number of debris parts
        vspr = spcabradebris
        vtrail = oSmallKineticPuffParticle
        vtrailtime = 3
        vdoit = 1
        ; break;
    case 7://decabra
        vcolumn = 6//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 0//the minimum number of tiles away the target tile can be
        vrangemax = 2//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 6//the number of different debris particles
        vpartsmin = 5//the minimum number of debris parts
        vpartsmax = 8//the maximum number of debris parts
        vspr = spdecabradebris
        vtrail = oSmallGreenTrailParticle
        vtrailtime = 4
        vdoit = 1
        ; break;
    case 8://cabracitor
        vcolumn = 7//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 0//the minimum number of tiles away the target tile can be
        vrangemax = 2//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 6//the number of different debris particles
        vpartsmin = 8//the minimum number of debris parts
        vpartsmax = 8//the maximum number of debris parts
        vspr = spcabracitordebris
        vtrail = oSmallPlasmaTrailParticle
        vtrailtime = 2
        vdoit = 1
        ; break;
    case 9://sawbot
        vcolumn = 8//the column in bgunitdebris that holds the tiles for the debris
        vrangemin = 1//the minimum number of tiles away the target tile can be
        vrangemax = 3//the maximum distance for the target tile
        vspeedmin = 4//the minimum speed the particle will fly
        vspeedmax = 6//max particle speed
        vindexes = 7//the number of different debris particles
        vpartsmin = 8//the minimum number of debris parts
        vpartsmax = 12//the maximum number of debris parts
        vspr = spsawbotdebris
        vtrail = oSmallSteamParticle
        vtrailtime = 3
        vdoit = 1
        ; break;
    }
    

if vdoit = 1{//if this unit type creates debris
    //make the list of possible indexes
    vlist = ds_list_create()
    for(i = 0; i < vindexes; i += 1){
        ds_list_add(vlist,i)
        ds_list_add(vlist,i)
        }
    ds_list_shuffle(vlist)
    
    //cull the list to the proper size
    vhowmanyparts = irandom_range(vpartsmin,vpartsmax)
    while ds_list_size(vlist) > vhowmanyparts{
        ds_list_delete(vlist,0)
        }
    
    //okay! We have a list of various debris with the proper index for all of them. Now make the actual pieces.
    
    while ds_list_size(vlist) > 0{
        vind = ds_list_find_value(vlist,0)
        ds_list_delete(vlist,0)
        
        vdebris = instance_create(x,y-10,oDebrisParticle)
        vdebris.depth = depth+1
        vdebris.sprite_index = vspr
        vdebris.image_index = vind
        vdebris.image_speed = 0
        
        //find the target tile
        vdone = 0
        vx = mx
        vy = my
        while vdone = 0{
            //keep picking random points in range until it's a valid tile
            vrange = irandom_range(vrangemin,vrangemax)
            vdir = irandom(359)
            px = round(lengthdir_x(vrange,vdir))
            py = round(lengthdir_y(vrange,vdir))
            px += mx
            py += my
            if sIsTileLocationValid(px,py){
                vdone = 1
                }
            }
        //done finding target tile
        vtile = ds_grid_get(tilegrid,px,py)
        //target tile found
        //find the offset
        yoff = irandom(5)
        xoff = 5-yoff
        if irandom(1) = 0{//let it be drawn further back if it won't intersect the S or W tile
            yoff = 0-yoff
            yoff -= irandom(3)
            xoff += irandom(5)
            }
        if irandom(1) = 0{
            xoff = 0-xoff
            }
        //offset found!
        //Now make the path that the debris will follow
        var vpath,lx,ly,dx,dy;
        vpath = path_add()
        path_set_closed(vpath,0)//not closed
        path_set_kind(vpath,1)//smooth
        vx = 0//start point
        vy = 0//start point
        px = vtile.x
        py = vtile.y
        px += xoff
        py += yoff
        px -= mytile.x//end points
        py -= mytile.y-10
        
        lx = round(lerp(vx,px,0.2))//curve points closer to start point
        ly = round(lerp(vy,py,0.2))
        ly -= 50//
        
        dx = round(lerp(vx,px,0.6))//curve points closer to end point
        dy = round(lerp(vy,py,0.6))
        dy -= 45//
        
        path_add_point(vpath,vx,vy,150)
        path_add_point(vpath,lx,ly,100)
        path_add_point(vpath,dx,dy,100)
        path_add_point(vpath,px,py,100)
        //show_message(string(vx)+","+string(vy)+"-"+string(lx)+","+string(ly)+"-"+string(dx)+","+string(dy)+"-"+string(px)+","+string(py)+"-")
        
        //path is now made
        
        with vdebris{
            tcolumn = vcolumn
            tindex = vind
            ttile = vtile//the target tile
            mypath = vpath
            path_start(mypath,irandom_range(vspeedmin,vspeedmax),path_action_stop,0)
            if vtrail > 0{
                vdebris.trailpart = vtrail
                vdebris.alarm[0] = vtrailtime
                vdebris.trailtime = vtrailtime
                }
            }
        var vexplode;
        vexplode = instance_create(x,y,oExplosionEffect)
        vexplode.depth = depth-1
        switch vtype{
            case 1://robit
                vexplode.sprite_index = spbotexplosion1
                vexplode.image_speed = 0.5
                ; break;    
            case 2://electrobot
                vexplode.sprite_index = spelectrobotexplosion1
                vexplode.image_speed = 0.5
                ; break;
            case 3://spookybot
                vexplode.sprite_index = spspookybotexplosion1
                vexplode.image_speed = 0.5
                ; break;
            case 4://skullsplode
                vexplode.sprite_index = spskullsplodeexplosion1
                ; break;
            case 5://hoverspark
                vexplode.sprite_index = spgenericsmallexplosion1
                ; break;
            case 6://cabra
                vexplode.sprite_index = spgenericsmallexplosion1
                ; break;
            case 7://decabra
                vexplode.sprite_index = spgenericsmallexplosion1
                ; break;
            case 8://cabracitor
                vexplode.sprite_index = spgenericsmallexplosion1
                ; break;
            case 9://sawbot
                vexplode.sprite_index = spgenericsmallexplosion1
                ; break;
            }
        }
    ds_list_destroy(vlist)
    }



























