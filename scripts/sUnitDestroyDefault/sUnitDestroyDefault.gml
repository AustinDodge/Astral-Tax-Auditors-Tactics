/// @description sUnitDestroyDefault(destroydata)
/// @param destroydata
/*The default unit destruction script. Most enemies will use this.
*/

var destroydata,destroyinventorylist,vlist,vpos;

destroyinventorylist = 1//default to inventory destruction

if ds_exists(myattributelist,ds_type_list){
    ds_list_destroy(myattributelist)
    }


if amidead = 1{
    if ds_exists(mydata,ds_type_list){
    //if an item is killed, destroy the associated data
        ds_list_destroy(mydata)
        }
    if ds_exists(abilitieslist,ds_type_list){
    //destroy the list of abilities if the unit is dead
        ds_list_destroy(abilitieslist)
        }
    ds_list_destroy(abilitiescooldownlist)
    ds_list_destroy(abilitiesusedlist)
    
    }
    
if initialized = 0{
    destroyinventorylist = 0
    }
    
if destroyinventorylist = 1{
    sClearUnitInventoryList(inventorylist)
    ds_list_destroy(inventorylist)
    ds_map_destroy(relationshipmap)
    }
