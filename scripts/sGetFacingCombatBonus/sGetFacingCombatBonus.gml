/// @description sGetFacingCombatBonus(attacker,defender)
/// @param attacker
/// @param defender
/*This script returns the bonus that the attacker will receive for attacking defender
based on the direction that each unit is facing. 0 is front attack, 1 is side, 2 is back
*/
var aface,dface,bonus,vattacker,vdefender;

vattacker = argument0
vdefender = argument1

aface = vattacker.facing
dface = vdefender.facing
bonus = 0

if aface = 0{
    switch dface{
        case 0: bonus = 2; break;//rear attack
        case 1: bonus = 1; break;//side attack
        case 2: bonus = 0; break;//front attack
        case 3: bonus = 1; break;//side attack
        }
    }
if aface = 1{
    switch dface{
        case 1: bonus = 2; break;//rear
        case 2: bonus = 1; break;//side
        case 3: bonus = 0; break;//front
        case 0: bonus = 1; break;//side
        }
    }
if aface = 2{
    switch dface{
        case 2: bonus = 2; break;//rear
        case 3: bonus = 1; break;//side
        case 0: bonus = 0; break;//front
        case 1: bonus = 1; break;//side
        }
    }
if aface = 3{
    switch dface{
        case 3: bonus = 2; break;//rear
        case 0: bonus = 1; break;//side
        case 1: bonus = 0; break;//front
        case 2: bonus = 1; break;//side
        }
    }
    
if vattacker.mytile = vdefender.mytile{
    bonus = 0
    }
if vdefender.unitisobject = 1{
    bonus = 0
    }
    
return bonus;
