/// @description sGetWeaponTypeBonus(attacker,defender)
/// @param attacker
/// @param defender
/*This script returns the bonus type that attacker will receive for attacking defender
based on the weapon type they're both using. It returns 0 for no bonus, 1 for bonus
and 2 for penalty. Kinetic beats energy beats spooky beats kinetic.
*/

var vattacker,vdefender,vattackertype,vdefendertype,vbonus,vblessed,vtech,vsolid,vlist;
vattacker = argument0
vdefender = argument1

vattackertype = vattacker.damagetype
vdefendertype = vdefender.damagetype

vblessed = 0
vtech = 0
vsolid = 0

vlist =  vdefender.abilitieslist
if ds_list_find_value(vlist,12) = 1{
    vblessed = 1
    }
if ds_list_find_value(vlist,13) = 1{
    vtech = 1
    }
if ds_list_find_value(vlist,14) = 1{
    vsolid = 1
    }


vbonus = 0

if vattackertype = 0{//if attacker is using kinetic weapon
    switch vdefendertype{
        case 0: vbonus = 0; break;
        case 1: if vsolid = 0{vbonus = 1}; break;//bonus
        case 2: vbonus = 2; break;//penalty
        }
    }
if vattackertype = 1{//if attacker is using energy weapon
    switch vdefendertype{
        case 0: vbonus = 2; break;
        case 1: vbonus = 0; break;
        case 2: if vtech = 0{vbonus = 1}; break;
        }
    }
if vattackertype = 2{//if attacker is using eldritch weapons
    switch vdefendertype{
        case 0: if vblessed = 0{vbonus = 1}; break;
        case 1: vbonus = 2; break;
        case 2: vbonus = 0; break;
        }
    }
if vdefendertype = -1{//no weapon gives all attackers full bonus
    vbonus = 2
    }
return vbonus;
