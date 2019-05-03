/// @description sGetUnitListPosition(vunit)
/// @param vunit
/*Returns the unit's position on the relevant unit attribute list, for use as an 
identifier when units need to know something about another unit that will pass between
maps. Just so I don't need to keep looking up the list position.*/
var vunit,vlist,vpos;
vunit = argument0
vlist = vunit.myattributelist
vpos = ds_list_find_value(vlist,36)

return vpos;
