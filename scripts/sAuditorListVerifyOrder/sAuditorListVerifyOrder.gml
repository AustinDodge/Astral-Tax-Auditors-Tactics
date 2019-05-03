/// @description sAuditorListVerifyOrder()
/*This script ensures that each auditor attribute list is in the correct place on the
auditor list. It creates a priority list, adds each auditor attribute list to it with
its position being the priority, clears the master list, then re-adds each unit to the
list starting at the lowest priority.*/

var vpriority,vval,vlist;
vpriority = ds_priority_create()

vval = -1
while ds_list_size(playerunitlist) > 0{
    vlist = ds_list_find_value(playerunitlist,0)
    ds_list_delete(playerunitlist,0)
    vval = ds_list_find_value(vlist,36)
    ds_priority_add(vpriority,vlist,vval)
    }
while ds_priority_size(vpriority) > 0{
    vlist = ds_priority_delete_min(vpriority)
    ds_list_add(playerunitlist,vlist)
    }
ds_priority_destroy(vpriority)
