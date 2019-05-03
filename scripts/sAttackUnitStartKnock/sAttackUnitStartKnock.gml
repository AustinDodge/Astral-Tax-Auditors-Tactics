/// @description sAttackUnitStartKnock(knocked,knocker)
/// @param knocked
/// @param knocker
/*this script is called by oAttackControl when a unit is knocked in combat.
*/
var vknocked,vknocker,ntile,vdir,vdist;

vknocked = argument0
vknocker = argument1

sAddUnitToKnockedList(vknocked)

if vknocked.aiactivated = 0{
    vknocked.aiactivated = 1
    sUnitMakeLightSource(vknocked,10,40)
    }
    
vknocked.lasttile = vknocked.mytile//set lasttile

vknocked.alarm[4] = 20
if vknocked.unitisitem = 0{//if the knocked unit isn't an item
    vknocked.amknocked = 1
    vknocked.moving = 1
    vknocked.knockdir = vknocker.facing
    if vknocked.mx = vknocker.mx and vknocked.my = vknocker.my{//if the knockee is on the same tile as the knocker, like a grenade, no knock happens
        if !instance_exists(oKongControl){//unless the unit is using Kong!
            vknocked.knockdir = -1
            }
        }
    if sIsKnockPossible(vknocked,vknocked.knockdir) = 0{
        vknocked.knockdir = -1
        }
    vdir = vknocker.facing
   
    if vknocked.rollingknock = 0{
        vdist = vknocker.knockdist
        if ds_list_find_value(vknocker.abilitieslist,23) = 1{
            vdist += 1
            }
        vknocked.knockforce = vdist
        }else{
        vdist = 0
        if ds_list_find_value(vknocker.abilitieslist,23) = 1{
            vdist += 1
            }
        if vknocked.knockaxis = 0{
             vknocked.knockforce = 1000//0 axis means that this unit always rolls when knocked
            }
        if vknocked.knockaxis = 1{//if vknocked can go north or south
            switch vdir{
                case 0: vknocked.knockforce = 1000; break;
                case 1: vknocked.knockforce = vdist; break;
                case 2: vknocked.knockforce = 1000; break;
                case 3: vknocked.knockforce = vdist; break;
                }
            }
        if vknocked.knockaxis = 2{//if vknocked can go east or west
            switch vdir{
                case 0: vknocked.knockforce = vdist; break;
                case 1: vknocked.knockforce = 1000; break;
                case 2: vknocked.knockforce = vdist; break;
                case 3: vknocked.knockforce = 1000; break;
                }
            }
        }
    
    vknocked.walkstep = 0
    vknocked.waswalking = 0
    
    with vknocked{
        ntile = 0
        switch knockdir{//find the next tile it will be knocked to
            case 0: 
                if mytile.my > 0{
                    ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my-1); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 1: 
                if mytile.mx < roomwidth-1{
                    ntile = ds_grid_get(tilegrid,mytile.mx+1,mytile.my); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 2: 
                if mytile.my < roomheight-1{
                    ntile = ds_grid_get(tilegrid,mytile.mx,mytile.my+1); 
                    }else{
                    ntile = 0
                    }
                ;break;
            case 3: 
                if mytile.mx > 0{
                    ntile = ds_grid_get(tilegrid,mytile.mx-1,mytile.my); 
                    }else{
                    ntile = 0
                    }
                ;break;
            }
        if ntile > 0{
            if ntile.depth < mytile.depth{
                depth = ntile.depth-5
                }else{
                depth = mytile.depth-1
                }
            nexttile = ntile
            }
        }
    }else{//if the knocked unit is an item
    }
