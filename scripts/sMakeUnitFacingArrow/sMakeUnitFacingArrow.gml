/// @description sMakeUnitFacingArrow(unit,cancancel)
/// @param unit
/// @param cancancel
/*Creates the unit facing arrows for when a unit's turn is over. Cancancel is if the
player can cancel the facing, for example if they are ending without attacking.
*/

var vunit,varrows,vcancancel;

vunit = argument0
vcancancel = argument1

varrows = instance_create(vunit.x,vunit.y-28,oUnitFacingArrow)
varrows.myunit = vunit
varrows.cancancel = vcancancel

sTileCursorSetPosition(vunit.mytile)

with varrows{
    event_perform(ev_other,ev_user0)
    }

canclick = 0
