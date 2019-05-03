/// @description sClearMapItemList()
/*This script destroys all the lists contained in the MapItemList. It must be called
before the mapitemlist is destroyed, otherwise there will be no way to access the items
on it!
*/

var vlist;

while ds_list_size(mapitemlist) > 0{
    vlist = ds_list_find_value(mapitemlist,0)
    ds_list_destroy(vlist)
    ds_list_delete(mapitemlist,0)
    }
