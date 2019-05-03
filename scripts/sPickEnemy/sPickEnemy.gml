/// @description sPickEnemy(typenum)
/// @param typenum
/*this script returns the enemy object index corresponding to the enemy type number
in argument0.
*/
var typenum,vobj;
typenum = argument0
vobj = oBWBotTest//this enemy should only come up if something goes wrong.

switch typenum{
    case 1: vobj = oKineticRobit; break;//1 kinetic robit
    case 2: vobj = oElectRobit; break;//2 electrobot
    case 3: vobj = oSpookyRobit; break;//3 spookybot
    case 4: vobj = oSkullsplode; break;//4 skullsplode
    case 5: vobj = oHoverSpark; break;//5 hoverspark
    case 6: vobj = oCabra; break;//6 cabra
    case 7: vobj = oDecabra; break;//7 decabra
    case 8: vobj = oCabracitor; break;//8 cabracitor
    case 9: vobj = oSawbot; break;//9 sawbot
    }
    
return vobj;
