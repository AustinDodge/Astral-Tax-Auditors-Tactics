/// @description sVendorMakeInventoryList(levelnum,type)
/// @param levelnum
/// @param type
/*Creates and returns a list containing the inventory of a vending machine. Right now
the arguments don't do anything, all lists contain every available item.*/

var vlevel,vtype,vlist;

vlevel = argument0
vtype = argument1

vlist = ds_list_create()
ds_list_add(vlist,7,8,1,2,3,4,5,6,16,17,19)
ds_list_add(vlist,20,21,22,23,24,25,26)

return vlist;
