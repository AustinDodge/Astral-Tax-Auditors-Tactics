/// @description sUnitPickDestructionScript(objindex,destroydata)
/// @param objindex
/// @param destroydata
/*Makes sure the unit gets the proper destruction script. Defaults to sUnitDestroyDefault.
*/

var whichscript,vtype,destroydata;

vtype = argument0
destroydata = argument1
whichscript = 0//default script type

switch vtype{
    case oAuditor: whichscript = 1; break;//1 auditor destruction
    case oKOAuditor: whichscript = 1; break;//1 auditor destruction
    case oCorpseAuditor: whichscript = 1; break;//1 auditor destruction
    case oOsculaNemesis: whichscript = 2; break;//2 nemesis destruction
    }
    
switch whichscript{
    case 0: sUnitDestroyDefault(destroydata); break;
    case 1: sUnitDestroyAuditor(destroydata); break;
    case 2: sUnitDestroyNemesis(destroydata); break;
    }
