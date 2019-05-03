/// @description sForceDiscardItem(unit,inventorypos or -1/-2 for weapon/armor,tile)
/// @param unit
/// @param inventorypos or -1/-2 for weapon/armor
/// @param tile
/*This script is ran to force a unit to discard an item, for example if a unit equips a new
weapon and has no room to store the old one, or an enemy special attack.
IMPORTANT: This doesn't make oActionControl, to prevent conflicts with other instances
that call oActionControl, and neither does the user event with oItemControl! Call it 
from the script that calls this. If there is a valid tile to discard the item to, it's thrown there,
otherwise it's destroyed.
*/

var vunit,vpos,vtile,vitem,vitemtype,vitemdata,vstandin,vprio,i,vdestroycurrent,vcontrol;

vunit = argument0
vpos = argument1
vtile = argument2

vdestroycurrent = 0//if there is no valid tile to discard the current item to, destroy it

if vtile = 0{//if there's no tile specified
    vtile = vunit.mytile
    if ds_grid_get(mapitemgrid,vtile.mx,vtile.my) != -1{//make sure there's no item on the tile
        //vtile = 0
        vprio = ds_priority_create()
        with oMapTile{
            if object_index != oPitTile and myobject = 0{
                if ds_grid_get(mapitemgrid,mx,my) = -1{
                    i = abs(mx-vtile.mx)+abs(my-vtile.my)
                    ds_priority_add(vprio,id,i)
                    }
                }
            }
        if ds_priority_size(vprio) > 0{
            vtile = ds_priority_find_min(vprio)
            }else{
            vdestroycurrent = 1
            vtile = 0
            }
        }
    }
        

if vpos >= 0{
    vitemdata = ds_list_find_value(vunit.inventorylist,vpos)
    vitemtype = ds_list_find_value(vitemdata,0)
    sRemoveItemFromInventory(vunit,vpos)
    }else{
    switch vpos{
        case -1:
            vitemtype = vunit.myweapon
            vitemdata = vunit.myweaponlist
            vunit.myweapon = 0
            vunit.myweaponlist = -1
            with vunit{
                sGetWeaponStats(myweapon)
                }
            ;break;
        case -2:
            vitemtype = vunit.myarmor
            vitemdata = vunit.myarmorlist
            vunit.myarmor = 0
            vunit.myarmorlist = -1
            with vunit{
                sGetArmorStats(myarmor)
                }
            ; break;
        }
    }
if vitemtype != 0{//make sure there's a item to discard
    if vtile = vunit.mytile{//if discarding to the same tile, no animation
        with vunit{
            vstandin = instance_create(x,y-10,oContainerItemStandin)
            vstandin.depth = depth-2
            vstandin.mx = mx
            vstandin.my = my
            vstandin.mytype = vitemtype
            vstandin.fadeout = 1
            vstandin.targety = mytile.y
            vstandin.sprite_index = sGetItemInfo(vitemtype,2)
            vstandin.mydata = vitemdata
            }
        }else{
        if vtile != 0{//discard the item if possible, otherwise it's destroyed
            vitem = sMakeUnitMapItem(vunit,vitemtype,vunit)
            vitem.mycontrol = -2
            var vx,vy,gx,gy,vpath;
            vx = vitem.x
            vy = vitem.y
            gx = vtile.x
            gy = vtile.y-3
            
            vpath = sItemMakeThrowPath(vx,vy,gx,gy)
            with vitem{
                mypath = vpath
                path_start(vpath,3,path_action_stop,0)
                }
            vitem.target = vtile
            vitem.targettile = vtile
            vitem.thrown = 1
            vitem.mycontrol = -1
            vitem.mydata = vitemdata
            
            
            /*vcontrol = instance_create(x,y,oItemControl)
            vitem.mycontrol = vcontrol
            vcontrol.startunit = vunit
            vcontrol.pitem = vitem
            vcontrol.findingtarget = 0
            vcontrol.actionmode = 3
            vcontrol.ptargettile = vtile
            with vcontrol{
                event_perform(ev_other,ev_user2)
                }*/
            }        
        }
    }


    
    
    
    
    



