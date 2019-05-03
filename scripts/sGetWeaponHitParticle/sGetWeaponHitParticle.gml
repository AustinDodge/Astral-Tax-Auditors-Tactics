/// @description sGetWeaponHitParticle(weaponnum)
/// @param weaponnum
/*this script calls the script that sets the stats of the weapon
*/
var wnum,i;
wnum = argument0
i = -1

switch wnum{
    //case 0: sNoWeaponStats(); break;
    case 1: i = oSmallKineticHitParticle; break;//crowbar
    case 2: i = oSmallEnergyHitParticle; break;//stun prod
    case 3: i = oSmallEldritchHitParticle; break;//tentacle weapon
    case 4: i = oSmallKineticHitParticle; break;//nail gun
    case 5: i = oSmallEnergyHitParticle; break;//weld gun
    case 6: i = oSmallEldritchHitParticle; break;//cursed cutter
    //case 7: ; break;//medkit item
    //case 8: ; break;//grenade item
    case 9: i = oSmallEldritchHitParticle; break;//oscula weapon//oscula short range
    //case 10: sVolatileMixStats(); break;//volatilemix, skullsplode
    case 11: i = oSmallEnergyHitParticle; break;//sparkcharger, hoverspark
    case 12: i = oSmallKineticHitParticle; break;//regular goat
    case 13: i = oSmallEldritchHitParticle; break;//devil goat
    case 14: i = oSmallEnergyHitParticle; break;//electro goat
    case 15: i = oSmallKineticHitParticle; break;//rotary saw, sawbot
    case 16: i = oSmallKineticHitParticle; break;//two by four
    case 17: i = oSmallKineticHitParticle;   break;//fire axe
    case 18: i = oSmallEnergyHitParticle; break;// live wires
    case 19: i = oSmallEnergyHitParticle; break;//laser saw
    case 20: i = oSmallKineticHitParticle; break;//small revolver
    case 21: i = oSmallEnergyHitParticle; break;//stun pistol
    case 22: i = oSmallEldritchHitParticle; break;//resin chunk
    case 23: i = oSmallEldritchHitParticle; break;//ritual knife
    case 24: i = oSmallEnergyHitParticle; break;//plasma rifle
    case 25: i = oSmallEldritchHitParticle; break;//yoricks maw
    //case 26: sHealRayStats(); break;//heal ray
    }
    
return i;

