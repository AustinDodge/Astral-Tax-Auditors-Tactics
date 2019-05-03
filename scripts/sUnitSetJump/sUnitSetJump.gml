/// @description sUnitSetJump(vunit,jumpcount)
/// @param vunit
/// @param jumpcount
/*this script makes a unit jump argument1 times
*/
var vunit,howmany;

vunit = argument0
howmany = argument1

with vunit{
    bx = x
    by = y
    jumping = 1
    shudderstep = 0
    shuddercount = howmany
    }
