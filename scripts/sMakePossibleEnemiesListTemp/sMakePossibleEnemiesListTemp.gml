/// @description sMakePossibleEnemiesListTemp(enemytypelist)
/// @param enemytypelist
/*this script just makes a list with one hundred entries of 1, or whatever is specified.
Future versions of this will take into consideration several variables to make a list
of possible enemy types, added to the list in proportion with how likely they are.
*/

var vlist,i,clist,j;
clist = argument0//the list of possible enemy types
vlist = ds_list_create()
for (i = 0; i < 100; i += 1){
    ds_list_shuffle(clist)
    j = ds_list_find_value(clist,0)//the type of eney picked
    //j = 1//debug, force maint bot
    ds_list_add(vlist,j)//add the type of enemy selected from the list
    //ds_list_add(vlist,irandom_range(1,9))//add the type of enemy
    //ds_list_add(vlist,irandom_range(1,5))//add all 
    //ds_list_add(vlist,9)//except cabras
    //ds_list_add(vlist,irandom_range(6,8))//only cabras type enemies
    }
ds_list_shuffle(vlist)
return vlist;
