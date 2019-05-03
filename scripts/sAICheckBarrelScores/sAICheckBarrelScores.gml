/// @description sAICheckBarrelScores(exploder,vlist,ktile)
/// @param exploder
/// @param vlist
/// @param ktile
/*This script takes a list of tiles that a barrel or other object would affect when it
explodes, and determines the score for detonating the barrel at that point. It's simple,
only accounting for the amount of damage that would be done to enemy units vs the amount
of damage that would be done to friently units, but is separate so it can be player with
easily.
*/

var vlist,vexploder,vtile,aunit,atile,vdam,vscore,willkill,klist,ktile,varray;

vexploder = argument0
vlist = argument1
ktile = argument2//the tile that the barrel will explode on

vscore = 0
willkill = 0
if ktile.object_index != oPitTile{
    while ds_list_size(vlist) > 0{
        atile = ds_list_find_value(vlist,0)
        ds_list_delete(vlist,0)
        aunit = atile.occupied
        if aunit > 0{
            if ds_list_find_value(aunit.abilitiesusedlist,47) = 0{//if the unis isn't using the ability Blend In
                varray = sFindAttackDamage(vexploder,atile,aunit,0)
				vdam = varray[0]
                vdam += sFindKnockDamage(aunit,ktile,vexploder.knockdist)
                vdam *= 5//multiply because it's guaranteed to hit
                if vdam >= aunit.maxhp{
                    vdam *= 10
                    }
                if aunit.team = 1{
                    vscore += vdam
                    }
                if aunit.team = 2{
                    vscore -= vdam*1.5
                    }
                sAIModifyAttackScore(aunit,vscore)
                }
            }
        }
    }else{
    //no explosion damage if the barrel would fall into a pit
    vscore = 0
    }
    
return vscore;
