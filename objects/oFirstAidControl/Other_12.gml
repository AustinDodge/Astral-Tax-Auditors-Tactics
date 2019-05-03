var vamount,vpart,vability;

with oHealIcon{
    instance_destroy()
    }
if targetunit != startunit{
    startunit.facing = sUnitFaceUnit(startunit,targetunit)
    }
startunit.didaction = 1
sUnitEndTurnAction(startunit,1)
sUnitSetJump(startunit,3)
startunit.anim = 6
startunit.alarm[9] = animsteps
vpart = sMakeInterfaceParticle(targetunit.x,targetunit.y,targetunit.x,targetunit.y-3,oHealParticleFirstAid1,-9999,0)
vpart.bx = targetunit.x
vpart.by = targetunit.y

vpart.bsteps = 0
vpart.tsteps = 30


//find the proper amount to heal
vability = 1//first aid 1
if ds_list_find_value(startunit.abilitieslist,43) = 1{
    vability = 2//first aid 2
    }
if ds_list_find_value(startunit.abilitieslist,44) = 1{
    vability = 3//first aid 3
    }
switch vability{
    //the cooldown is always applied to the base ability, so it only needs to be checked once.
    case 1: vamount = 10; ds_list_replace(startunit.abilitiescooldownlist,42,2); ds_list_replace(startunit.abilitiesusedlist,42,1); break;
    case 2: vamount = 20; ds_list_replace(startunit.abilitiescooldownlist,42,2); ds_list_replace(startunit.abilitiesusedlist,43,1); break;
    case 3: vamount = targetunit.maxhp; ds_list_replace(startunit.abilitiescooldownlist,42,3); ds_list_replace(startunit.abilitiesusedlist,44,1); break;
    }
sDrawUnitHealHP(targetunit,vamount)

instance_destroy()



