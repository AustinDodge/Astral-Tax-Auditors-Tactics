/// @description sMakeInterfaceParticle(startx,starty,destx,desty,particle,depth,speed)
/// @param startx
/// @param starty
/// @param destx
/// @param desty
/// @param particle
/// @param depth
/// @param speed
/*This script creates an interface particle that will travel along a specific path. Returns the ID of the particle.
*/

var vpart,vattacker,vdefender,vtravelstartx,vtravelstarty,vtraveldestx,vtraveldesty,
vprojectilespeed,vtraveltime,vdist,velev,vfinaldist,vfinalspeed,vdidhit;

vtravelstartx = argument0
vtravelstarty = argument1
vtraveldestx = argument2
vtraveldesty = argument3
vpart = argument4
vdepth = argument5
vmyspeed = argument6

//generate the particle travel information

vfinaldist = point_distance(vtravelstartx,vtravelstarty,vtraveldestx,vtraveldesty)//the total distance between the two tiles, including height difference.

//vfinalspeed = vfinaldist*vmyspeed//the non-rounded total travel time in steps
//vprojectilespeed = vfinalspeed/vdist
//vfinalspeed = vmyspeed
//vtraveltime = round(vfinalspeed)//the actual number of steps it will take the projectile to travel

vtraveltime = round(vfinaldist/vmyspeed)


//travel information is found
        
//make the "launch" particle

if vpart > 0{
    vpart = instance_create(vtravelstartx,vtravelstarty,vpart)
    vpart.isreal = 0
    
    vpart.bx = vtravelstartx
    vpart.by = vtravelstarty
    
    if vtraveltime > 0{
        vpart.tsteps = vtraveltime
        }else{
        vpart.tsteps = 2
        }
    vpart.bsteps = 0
    
    vpart.xspeed = (vtraveldestx-vtravelstartx)/vtraveltime
    vpart.yspeed = (vtraveldesty-vtravelstarty)/vtraveltime
    
    with vpart{
        event_perform(ev_other,ev_user0)
        }
    }


return vpart;















