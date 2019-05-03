/// @description sMakeGenericInfoWindow(target,parent,vstring)
/// @param target
/// @param parent
/// @param vstring
/*Creates a generic info window that positions itself relative to target and is destroyed
with Parent. Returns the ID of the window.
*/

var vstring,vparent,vtarget,vwindow;

vtarget = argument0
vparent = argument1
vstring = argument2


vwindow = instance_create(x,y,oGenericInfoWindow)
vwindow.mytarget = vtarget
vwindow.parent = vparent
vwindow.wstring = vstring

with vwindow{
    event_perform(ev_other,ev_user0)
    }

return vwindow;

