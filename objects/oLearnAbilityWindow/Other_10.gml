var vx,vwidth,vy,vability,howmanyabilities,i;

abilitylist = sUnitLearnAbilityListDebug(myunit)

ds_list_shuffle(abilitylist)


howmanyabilities = 2//default unit gets two choices
if ds_list_find_value(myunit.abilitieslist,11) = 1{
    howmanyabilities += 1//get one more choice for ability Renaissance
    }
    
vwidth = round(sprite_width/(howmanyabilities+1))//the spacing between abilities
vx = x-8
vx += vwidth
vy = y+24
for (i = 0; i < howmanyabilities; i += 1){
    if ds_list_size(abilitylist) > 0{
        vability = instance_create(vx,vy,oAbilityLearnButton)
        vability.abilitynum = ds_list_find_value(abilitylist,0)
        //vability.abilitynum = 52//debug deep pockets
        vability.myunit = myunit
        ds_list_delete(abilitylist,0)
        vx += vwidth
        vability.parent = id
        if i = 0{
            myability = vability
            }
        }
    }
ds_list_destroy(abilitylist)

with oButton{
    canbeclicked = 0
    }
    
with oAbilityLearnButton{
    sprite_index = sAbilityFindIcon(abilitynum)
    tooltip = sAbilityFindTooltip(abilitynum)
    depth = oLearnAbilityWindow.depth-1
    event_perform(ev_other,ev_user15)
    canbeclicked = 1
    }


