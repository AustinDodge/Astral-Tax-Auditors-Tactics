/// @description sAIPickUnitBehavior(unit,tilelist)
/// @param unit
/// @param tilelist
/*this script feeds the information through to the proper unit behavior script based
on the unit type.
*/
var vunit,vlist,vtype,picked;
vunit = argument0
vlist = argument1
vtype = vunit.unittype
picked = 0
switch vtype{
    case 0: sAIUnitDefaultBehavior(vunit,vlist); picked = 1; break;//no type, shouldn't happen
    case 1: sAIUnitDefaultBehavior(vunit,vlist); picked = 1; break;//kinetic robit
    case 2: sAIUnitDefaultBehavior(vunit,vlist); picked = 1; break;//electrobot
    case 3: sAIUnitDefaultBehavior(vunit,vlist); picked = 1; break;//spookybot/nemesistemp
    case 4: sAIUnitExplodeStatusBehavior(vunit,vlist); picked = 1; break;//skullsplode
    case 5: sAIUnitDefaultBehavior(vunit,vlist); picked = 1; break;//hoverspark
    case 6: sAIUnitKnockBehavior(vunit,vlist); picked = 1; break;//capra
    case 7: sAIUnitKnockBehavior(vunit,vlist); picked = 1; break;//decapra
    case 8: sAIUnitKnockBehavior(vunit,vlist); picked = 1; break;//capracitor
    case 9: sAIUnitDefaultBehavior(vunit,vlist); picked = 1; break;//sawbot
    }
if picked = 0{//if no behavior was found
    show_message("!!!!!No behavior found for type "+string(vtype))
    sAIUnitDefaultBehavior(vunit,vlist)//do default behavior
    }
