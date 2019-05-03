/// @description Insert description here
// You can write your code in this editor
var vsurf;
while !ds_list_empty(surfacelist){
	vsurf = ds_list_find_value(surfacelist,0)
	ds_list_delete(surfacelist,0)
	surface_free(vsurf)
	}
ds_list_destroy(surfacelist)