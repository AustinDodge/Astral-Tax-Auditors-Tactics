/// @description sUnitDestroyAuditor(destroyinfo)
/// @param destroyinfo
/*called by an oAuditor,oKOAuditor, or oCorpseAuditor when it's destroyed in the game.
*/

var doko,docorpse,vlist,vpos,destroyinfo,destroyinventorylist;

destroyinfo = argument0

doko = 0
docorpse = 0
destroyinventorylist = 0

vpos = myattributelistpos
vlist = ds_list_find_value(playerunitlist,vpos)

if object_index = oAuditor{
    if amikod = 1{
        //don't KO if the unit is being moved to a new map
        doko = 1
        koturns = ds_list_find_value(vlist,71)//get the proper number of turns till KO
        }
    ds_list_delete(playerunitlist,vpos)
    ds_list_destroy(vlist)
    vlist = sUnitMakeAttributeList()//make a new attribute list reflecting hp, xp, etc
    ds_list_insert(playerunitlist,vpos,vlist)//and put it in the list
    
    }
    
if object_index = oKOAuditor{
    if amidead = 1{
        docorpse = 1
        amidead = 1
        ds_list_replace(vlist,33,1)//set amidead to 1, keep all other values
        }else{//if it's a knocked out unit being carried to the next map
        ds_list_replace(vlist,71,koturns)        
        }
    }

if initialized = 0{
    //uninitialized units shouldn't leave behind a corpse
    doko = 0
    docorpse = 0
    destroyinventorylist = 1
    }
 
if doko = 1{
    sMapKOAuditor(id)
    }
if docorpse = 1{
    sMapMakeAuditorCorpse(id)
    }

if destroyinventorylist = 1{
    sClearUnitInventoryList(inventorylist)
    ds_list_destroy(inventorylist)
    ds_map_destroy(relationshipmap)
    }


