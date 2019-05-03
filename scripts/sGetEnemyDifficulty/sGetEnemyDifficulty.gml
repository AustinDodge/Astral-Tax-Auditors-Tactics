/// @description sGetEnemyDifficulty(typenum)
/// @param typenum
/*this script returns the difficulty score of the specified enemy type
*/
var typenum,vscore;
typenum = argument0
vscore = 1//this enemy should only come up if something goes wrong.

switch typenum{
    case 1: vscore = 27; break;//1 kinetic robit
    case 2: vscore = 27; break;//2 electrobot
    case 3: vscore = 27; break;//3 spookybot
    case 4: vscore = 28; break;//4 skullsplode
    case 5: vscore = 30; break;//5 hoverspark
    case 6: vscore = 30; break;//6 cabra
    case 7: vscore = 30; break;//7 decabra
    case 8: vscore = 30; break;//8 cabracitor
    case 9: vscore = 25; break;//9 sawbot
    }
    
return vscore;
