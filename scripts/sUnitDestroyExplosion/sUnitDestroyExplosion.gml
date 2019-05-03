/// @description sUnitDestroyExplosion()
/*If a unit should explode when it dies, it'll run this.
*/


var vunit,vsize,i,vtile,vitem,velevation,pelevation,vdiff,checklist,vx,vy,vrange,varray;
checklist = ds_list_create()
vlist = ds_list_create()
vx = mx
vy = my
vrange = exploderange
velevation = mytile.elevation


if startunit > 0{
    if instance_exists(startunit){
        if ds_list_find_value(startunit.abilitieslist,22) = 1{
            attackstrength *= 2
            sDrawAbilityUsed(22,x,y)
            }
        }
    }
        

//audio_play_sound(soundExplosion1,2,0)
sSoundPlayEffect(soundExplosion1,1,0,0)
with oMapTile{//add all map tiles close enough to checklist
    if (abs(vx-mx)+abs(vy-my)) <= vrange{
        ds_list_add(checklist,id)
        }
    }
vsize = ds_list_size(checklist)
for(i = 0; i < vsize; i += 1){//the blow up the tiles on checklist
    vtile = ds_list_find_value(checklist,i)
    pelevation = vtile.elevation
    vdiff = abs(velevation - pelevation)
    if vdiff <= uprange{//only make explosions if they're close enough in height
        vunit = ds_grid_get(unitposgrid,vtile.mx,vtile.my)
        if vunit != id{
            if vunit > 0{
                ds_list_add(vlist,vunit)
                }
            }
        vitem = ds_grid_get(mapitemgrid,vtile.mx,vtile.my)
        if vitem > 0{
            ds_list_add(vlist,vitem)
            }
        instance_create(vtile.x,vtile.y,oExplosionEffect)
        if vtile.object_index != oPitTile{
            vtile.scarred = 1
            }
        }
    }//end for loop
ds_list_destroy(checklist)
if ds_list_size(vlist) > 0{//now blow up the units
    vsize = ds_list_size(vlist)
    for (i = 0; i < vsize; i += 1){
        vunit = ds_list_find_value(vlist,i)
        facing = sUnitFaceUnit(id,vunit)
        //vunit.knockdamage += attackstrength
		varray = sFindAttackDamage(id,mytile,vunit,0)
        vunit.knockdamage += varray[0]
        sAttackUnitStartKnock(vunit,id)
        vunit.anim = 4
        if !audio_is_playing(soundHit1){
            //audio_play_sound(soundHit1,2,0)
            sSoundPlayEffect(soundHit1,1,0,1)
            }
        }
    }
ds_list_destroy(vlist)
