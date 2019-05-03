var i,vsize,vlist,howmanyauditors;

howmanyauditors = 5

if ds_list_size(playerunitlist) > 0{//if there are any units on the list
    vsize = ds_list_size(playerunitlist)
    for(i = 0; i < vsize; i += 1){
        vlist = ds_list_find_value(playerunitlist,i)
        if ds_exists(vlist,ds_type_list){
            ds_list_destroy(vlist)
            }
        }
    }

ds_list_clear(playerunitlist)
if ds_exists(mnamelist,ds_type_list){
    ds_list_destroy(mnamelist)
    }
if ds_exists(fnamelist,ds_type_list){
    ds_list_destroy(fnamelist)
    }
sMakeAuditorNameList()
for(i = 0; i < howmanyauditors; i += 1){//make lists containing the attributes of all auditors
    ds_list_add(playerunitlist,sMakeAuditorAttributeList())
    }
