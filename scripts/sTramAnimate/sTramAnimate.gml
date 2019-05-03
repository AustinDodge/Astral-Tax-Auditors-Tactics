/// @description sTramAnimate(inorout)
/// @param inorout
/*This script creates the oTramAnimationControl object and starts the animation of the
tram doors.
*/

var inorout,vt;
inorout = argument0
sDestroyRangeTiles()
vt = instance_create(x,y,oTramAnimControl)
switch inorout{
    case 0:vt.tramanimin = 1; break;//in
    case 1:vt.tramanimout = 1; break;//out
    }
    
with vt{
    event_perform(ev_other,ev_user0)
    }
