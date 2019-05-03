/*This script creates a list of the possible enemy types that can be in the map.
Currently, it randomly selects between three and five of the various enemy types available.
Returns a list of possible enemy types for the map.
*/

var howmanyenemytypes,howmanyenemies,vlist,clist,i;

vlist = ds_list_create()//the list of enemy types
clist = ds_list_create()//a list of all available enemy types

howmanyenemytypes = 9

for (i = 1; i <= howmanyenemytypes; i += 1){
    ds_list_add(clist,i)
    }
ds_list_shuffle(clist)
// clist now contains all valid enemy types for this map

howmanyenemies = irandom_range(3,5)//the number of enemy types in the room
for(i = 0; i < howmanyenemies; i += 1){
    ds_list_add(vlist,ds_list_find_value(clist,0))
    ds_list_delete(clist,0)
    
    if ds_list_empty(clist){//end loop if clist is empty
        i = howmanyenemies
        }
    }
    
ds_list_destroy(clist)
return vlist;
