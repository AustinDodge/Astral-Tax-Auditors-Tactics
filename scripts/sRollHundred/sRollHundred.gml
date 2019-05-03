/// @description sRollHundred()
/*This script returns a random number between 0 and 99. If save scumming is disabled,
it returns a pre-generated random number, otherwise it just makes on up.
*/
var i;
if nosavescumming = 1{//get a random number, either premade or instantly made
    i = sGetPremadePercent()
    }else{
    i = irandom(99)
    }
return i;
