/// @description sEnemyGetStartStatus(vtype)
/// @param vtype
/*This script is called when placing enemies on the map. Enemies that start with a status
effect will have it enabled in this script.
*/

var vtype;
vtype = argument0

switch vtype{
    case 4: explodestatus = 1; showexplodestatus = 0; exploderange = 1; break;//skullsplode
    }
