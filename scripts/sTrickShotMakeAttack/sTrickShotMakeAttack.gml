/// @description sTrickShotMakeAttack(unit)
/// @param unit
/*Checks if Trick Shot is active, if it should be activated, and handles that if so. Is
called in sUnitMoveKnockTilesDefault and depends on the unit being attacked already having
set mytile to the tile that it's being knocked into.
*/

var vunit,vtile,vcontrol,vinjector,vdam,varray;

vunit = argument0
vtile = vunit.mytile
vcontrol = -1
if instance_exists(oTrickShotControl){
    with oTrickShotControl{
        if vtile = targettile{
            vcontrol = id
            }
        }
    if vcontrol > 0{
        //we now have the proper oTrickShotControl selected. Start doing stuff.
        //stop all animations
        pausemove = 1
        varray = sFindAttackDamage(vcontrol.myunit,(vcontrol.myunit).mytile,vunit,0)
		vdam = varray[0]
        vdam *= 2
        if instance_exists(vcontrol.myindicator){
            with vcontrol.myindicator{
                instance_destroy()
                }
            }
        (vcontrol.myunit).didaction = 1
        sSpecialAttackStartAttack(vcontrol.myunit,vunit,200,vdam,0,0,vcontrol,0)
        with vcontrol{
            instance_destroy()
            }
        }
    }







