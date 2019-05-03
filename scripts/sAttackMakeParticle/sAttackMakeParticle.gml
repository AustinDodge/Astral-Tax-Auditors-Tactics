/// @description sAttackMakeParticle(vattacker,vdefender)
/// @param vattacker
/// @param vdefender
/*This script is called by oAttackControl to make a weapon particle. It returns the travel time
of the particle.
*/

var vpart,vunit,vattacker,vdefender,vtravelstartx,vtravelstarty,vtraveldestx,vtraveldesty,
vprojectilespeed,vtraveltime,vdist,velev,vfinaldist,vfinalspeed,vdidhit;

vattacker = argument0
vdefender = argument1

vunit = vattacker

//generate the particle travel information
vdist = point_distance(vattacker.mx,vattacker.my,vdefender.mx,vdefender.my)
velev = abs(ds_grid_get(mapheightgrid,vattacker.mx,vattacker.my)-ds_grid_get(mapheightgrid,vdefender.mx,vdefender.my))
velev = round(velev/2)
vfinaldist = point_distance(0,0,vdist,velev)//the total distance between the two tiles, including height difference.

vfinalspeed = vfinaldist*vattacker.weapontraveltime//the non-rounded total travel time in steps
vprojectilespeed = vfinalspeed/vdist
vtraveltime = round(vfinalspeed)//the actual number of steps it will take the projectile to travel

vtravelstartx = vattacker.x
vtravelstarty = vattacker.y-20

switch vattacker.facing{
    case 0: vtravelstartx -= 15; break;
    case 1: vtravelstartx += 15; break;
    case 2: vtravelstartx += 15; break;
    case 3: vtravelstartx -= 15; break;
    }
    
vtraveldestx = vdefender.x
vtraveldesty = vdefender.y-8

vdidhit = ds_map_find_value(hitmap,vdefender)
if vdidhit = 0{
    //add an offset if the attack misses
    switch irandom(1){
        case 0: vtraveldestx += irandom_range(8,15); break;
        case 1: vtraveldestx -= irandom_range(8,15); break;
        }
    switch irandom(1){
        case 0: vtraveldesty += irandom_range(8,15); break;
        case 1: vtraveldesty -= irandom_range(8,15); break;
        }
    }
//travel information is found
        
//make the "launch" particle
vpart = sGetWeaponLaunchParticle(vunit.myweapon)
if vpart > 0{
    vpart = instance_create(vtravelstartx,vtravelstarty,vpart)
    vpart.myparent = vunit
    with vpart{
        event_perform(ev_other,ev_user10)//position properly
        }
    }
    
//make the "bullet" particle
vpart = sGetWeaponParticle(vunit.myweapon)

if vpart > 0{
    vpart = instance_create(vtravelstartx,vtravelstarty,vpart)
    vpart.mx = vunit.mx+0.5
    vpart.my = vunit.my+0.5
    
    vpart.bx = vtravelstartx
    vpart.by = vtravelstarty
    
    vpart.tsteps = vtraveltime
    
    vpart.xspeed = (vtraveldestx-vtravelstartx)/vtraveltime
    vpart.yspeed = (vtraveldesty-vtravelstarty)/vtraveltime
    var vx,vy,gx,gy,vxdist,vydist,fx,fy;
    vx = vattacker.mx
    vy = vattacker.my
    gx = vdefender.mx
    gy = vdefender.my
    
    vxdist = gx-vx
    vydist = gy-vy
    
    fx = vxdist/vtraveltime
    fy = vydist/vtraveltime
    
    vpart.gxspeed = fx
    vpart.gyspeed = fy
    
    with vpart{
        event_perform(ev_other,ev_user0)
        }
    }


return vtraveltime;















