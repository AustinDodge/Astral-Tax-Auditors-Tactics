/// @description sUnitCooldownAbility(abilitynum)
/// @param abilitynum
/*Called in sUnitAbilitiesCooldown to cooldown a single ability. Simple script, but I don't
want to rewrite it a billion times.*/

var vnum,i;
vnum = argument0
i = ds_list_find_value(abilitiescooldownlist,vnum)
if i > 0{
    if ds_list_find_value(abilitiesusedlist,vnum) = 0{//if the unit isn't currently using the ability
        i -= 1
        ds_list_replace(abilitiescooldownlist,vnum,i)
        }
    }
