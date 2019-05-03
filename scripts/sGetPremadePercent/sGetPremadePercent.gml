/// @description sGetPremadePercent()
/*This script returns the top number from the previously generated percent list. If there
are less than 80 items in the list, it refills the list. This list is saved and used
to prevent savescumming.
*/
var per;

if ds_list_size(premadepercentlist) < 80{
    while ds_list_size(premadepercentlist) < 100{//repopulate the list
        ds_list_add(premadepercentlist,irandom(99))
        }
    }
    
per = ds_list_find_value(premadepercentlist,0)//get the first value
ds_list_delete(premadepercentlist,0)//then remove it from the list

return per;
