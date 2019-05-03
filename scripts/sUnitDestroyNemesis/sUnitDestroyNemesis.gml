/// @description sUnitDestroyDefault(destroydata)
/// @param destroydata
/*The default unit destruction script. Most enemies will use this.
*/

var destroydata,destroyinventorylist,vlist,vpos;

destroydata = argument0

if amidead = 1{
    turnstillnemesis += 5
    }
//call the default destruction afterwards   
sUnitDestroyDefault(destroydata)
