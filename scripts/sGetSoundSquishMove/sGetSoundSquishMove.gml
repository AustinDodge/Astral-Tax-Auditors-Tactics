/// @description sMakeSoundSquishMove()
/*Plays the squish sound when a squishy unit moves.
*/
var i,vsound;
i = irandom(3)
switch i{
    case 0: vsound = soundSquishMove1; break;
    case 1: vsound = soundSquishMove2; break;
    case 2: vsound = soundSquishMove3; break;
    case 3: vsound = soundSquishMove4; break;
    }
