/// @description sSoundStopMusic(sound,fade time milliseconds)
/// @param sound
/// @param fade time milliseconds
/*Stops a sound that's being played with the specified time delay
*/

var vsound,vvolume,vfadetimevind,vcontrol,vmsperstep,vsteps;

vsound = argument0
vfadetime = argument1//the volume

vmsperstep = floor(1000/room_speed)//the number of milliseconds in a step
vsteps = vfadetime/vmsperstep//the number of steps it will take for the fade to happen
if vsteps <= 0{
    vsteps = 1
    }


audio_sound_gain(vsound,0,vfadetime)
vcontrol = instance_create(x,y,oSoundControl)
vcontrol.myind = vsound
vcontrol.mytime = vsteps
vcontrol.alarm[0] = vsteps



//see if you can set the volume and have it change with the emitter.

