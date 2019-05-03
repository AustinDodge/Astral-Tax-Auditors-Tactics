/// @description sUnitSetShudder(vunit,shuddercount)
/// @param vunit
/// @param shuddercount
/*this script makes a unit shudder argument1 times
*/
var vunit,howmany;

vunit = argument0
howmany = argument1

with vunit{
    bx = x
    by = y
    shuddering = 1
    shudderstep = 0
    shuddercount = howmany
    }
