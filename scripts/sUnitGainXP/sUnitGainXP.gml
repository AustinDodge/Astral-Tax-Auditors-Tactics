/// @description sUnitGainXP(amount,giver)
/// @param amount
/// @param giver
/*This script is called whenever a unit should gain XP. The amount of XP gained is
calculated by the calling object before running this script, which transfers that amount
to oXPControl and handles any animation stuff. I'd prefer that it was all handled in this
script, but right now it seems like there are too many confounding factors when determining
XP gain to easily squeeze it into a one-size-fits-all solution. This will at least keep it
simple when I want to mess with the way experience gain animates.
*/
var vamount,vgiver;
vamount = argument0
//vgiver = argument1


    oXPControl.targetxpgain += vamount
    if instance_exists(oDrawXP){
        oDrawXP.totalxp += vamount
        }
