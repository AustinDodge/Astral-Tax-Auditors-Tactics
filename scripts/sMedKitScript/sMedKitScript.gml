/// @description sMedKitScript()
/*This script is run by an item when that item is used.
*/

var vstandin,vunit,vhealamount;
vunit = targetunit//the unit that these effects will happen to

vhealamount = 10//the amount that this will heal a unit - 
    
vstandin = instance_create(x,y,oUseItemStandIn)
vstandin.sprite_index = sprite_index
vstandin.image_index = 1
vstandin.depth = depth
vstandin.fadeout = 1
//can't heal a corpse and KO units are revived

if targetunit != startunit{
    sRelationshipAddUnit(targetunit)
    }

if vunit.object_index != oCorpseAuditor{
    vunit.anim = 6
    sDrawUnitHealHP(vunit,10)//medkit heals 10 hp
    }
/*
if vunit.object_index != oKOAuditor and vunit.object_index != oCorpseAuditor{
    //if the unit will take the regular heal stuff
    
    if targetunit != startunit{
        sRelationshipAddUnit(targetunit)
        }
    
    
    //instance_destroy()
    }else{
    //nothing happens when you try to heal a corpse
    if vunit.object_index = oKOAuditor{
        sMapReviveAuditor(vunit,5)
        }
    }*/
instance_destroy()
