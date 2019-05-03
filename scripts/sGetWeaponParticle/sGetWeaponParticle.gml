/// @description sGetWeaponParticle(weaponnum)
/// @param weaponnum
/*this script returns the type of particle that a projectile weapon shoots.
*/
var wnum,i;
wnum = argument0
i = -1

switch wnum{
    //case 0: sNoWeaponStats(); break;
    
    case 4: i = oNailBulletParticle; break;//nail gun
    case 5: i = oSmallPlasmaParticle; break;//weld gun
    case 6: i = oSmallSkullParticle; break;//cursedcutter
    
    //case 11: sSparkChargerStats(); break;
    
    case 20: i = oNailBulletParticle; break;//small revolver
    case 21: i = oSmallPlasmaParticle; break;//stun pistol
    
    //case 24: sPlasmaRifleStats(); break;
    //case 25: sYoricksMawStats(); break;
    //case 26: sHealRayStats(); break;
    }

return i;
