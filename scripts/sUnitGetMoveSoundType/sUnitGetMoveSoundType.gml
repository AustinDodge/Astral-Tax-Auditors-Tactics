/// @description sUnitGetMoveSoundType(unittype)
/// @param unittype
/*This script assigns the unit the bank of sounds it will draw from when it moves.
It returns the index of the sound bank the unit will use.
0 = human footsteps
1 = robot sounds
2 = squish sounds
3 = hover sounds
*/

var i,j;
i = argument0
switch i{
    case 1: j = soundRoboMove1; break;//1 kinetic robit
    case 2: j = soundRoboMove1; break;//2 electrobot
    case 3: j = soundRoboMove1; break;//3 spookybot
    case 4: j = soundSquishMove1; break;//4 skullsplode
    case 5: j = soundHoverMove1; break;//5 hoverspark
    case 6: j = soundSquishMove1; break;//6 cabra
    case 7: j = soundSquishMove1; break;//7 decabra
    case 8: j = soundSquishMove1; break;//8 cabracitor
    case 9: j = -1; break;//9 sawbot
    }
    
return j;
