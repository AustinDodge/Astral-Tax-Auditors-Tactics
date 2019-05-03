/// @description sFindKnockDamage(attackee,ktile,knockdist)
/// @param attackee
/// @param ktile
/// @param knockdist
/*This script finds how much damage will be done to a unit that's being knocked
due to the path it's being knocked along - falls, etc. 
It takes as arguments the unit that will be knocked and the tile it will be knocked from.
It returns the total amount of
HP the unit will lose, and returns the unit's maxhp if the knock will kill the unit.
*/

//start accounting for knocking ability
var vtile,aunit,atile,kdir,jtile,klist,kdist,kdamage,vdiff,willkill,vdamage,ktile,kelevation,jelevation;

aunit = argument0
vtile = argument1
kdist = argument2

atile = aunit.mytile

vdamage = 0
willkill = 0
if atile != vtile{//won't knock if the explosion is on the same tile.
    kdir = sTileFaceTile(vtile,atile)
    jtile = vtile//the "previous" tile for calculating fall damage
    if sIsKnockPossible(aunit,kdir){
        kdamage = 0
        klist = sMakeKnockRange(aunit,kdist,kdir,0)
        while ds_list_size(klist) > 0{
            ktile = ds_list_find_value(klist,0)
            ktile = ktile.mytile
            ds_list_delete(klist,0)
            if ds_grid_get(tiletypegrid,ktile.mx,ktile.my) = -1{
                willkill = 1
                }
            kelevation = ktile.elevation//the tile being knocked to
            jelevation = jtile.elevation//the tile being knocked from
            vdiff = (jelevation - kelevation)
            if vdiff > aunit.vertdist{
                vdamage += sFindKnockFallDamage(vdiff,aunit.vertdist)
                }
            }
        with oKnockRange{
            instance_destroy()
            }
        ds_list_destroy(klist)
        }
    }
if willkill = 1{
    vdamage = aunit.maxhp
    }
return vdamage;
