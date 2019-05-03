/// @description sUnitKnockReverseDirection()
/*This script is called by a unit while knocking if it needs to reverse direction'
*/
switch knockdir{
    case 0: knockdir = 2; break;
    case 1: knockdir = 3; break;
    case 2: knockdir = 0; break;
    case 3: knockdir = 1; break;
    }
