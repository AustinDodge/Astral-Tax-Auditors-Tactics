/// @description sUnitMakeLightSource(unit,pureradius,fullradius)
/// @param unit
/// @param pureradius
/// @param fullradius
/*This script can be called whenever a unit needs a light source made.
*/

var vunit,vpradius,vfradius,alreadymade,vlight;

vunit = argument0
vpradius = argument1
vfradius = argument2

alreadymade = 0

//check if a light source already exists
if vunit.mylightsource > 0{
    if instance_exists(vunit.mylightsource){
        alreadymade = 1
        }
    }
    
if alreadymade = 0{
    vlight = instance_create(vunit.x,vunit.y,oLightSource)
    vlight.pureradius = vpradius
    vlight.radius = vfradius
    vlight.parent = vunit
    vunit.mylightsource = vlight
    with vlight{
        event_perform(ev_other,ev_user0)
        }
    }
