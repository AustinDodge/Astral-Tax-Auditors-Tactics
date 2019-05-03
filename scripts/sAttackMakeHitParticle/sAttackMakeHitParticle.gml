/// @description sAttackMakeHitParticle(vattacker,vdefender)
/// @param vattacker
/// @param vdefender
/*Makes the particle that signifies a weapon hit the enemy.
*/

var vattacker,vdefender,vpart;

vattacker = argument0
vdefender = argument1

vpart = sGetWeaponHitParticle(vattacker.myweapon)

if vpart > 0{
    vpart = instance_create(vdefender.x,vdefender.y-8,vpart)
    vpart.depth = vdefender.depth-1
    }
