/// @description sAnimWalk(walkstep)
/// @param walkstep
/*this script is called by all units and returns the proper x and y anim values based on
that unit's animtype. animtype is found by the unit during its init event.
*/
var animstep;
animstep = argument0

switch unitanimtype{
    case 1: return sAnimHumanWalkNESW(animstep); break;//human type calling
    }
    
