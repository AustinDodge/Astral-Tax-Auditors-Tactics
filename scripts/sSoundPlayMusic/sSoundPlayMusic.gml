/// @description sSoundPlayMusic(sound,volume,fadeintime,loop)
/// @param sound
/// @param volume
/// @param fadeintime
/// @param loop
/*Has oSoundControl play a sound from its emitter.
*/

var vsound,vvolume,vloop,vind,vnum,vtime;

vsound = argument0
vvolume = argument1//the volume 
vtime = argument2
vloop = argument3

vind = audio_play_sound_on(oSoundControl.soundemitter1,vsound,vloop,1)
audio_sound_gain(vind,0,0)//set it to silent
audio_sound_gain(vind,vvolume,0)

if oSoundControl.musicsound1 = -1{
    oSoundControl.musicsound1 = vind
    }else{
    oSoundControl.musicsound2 = vind
    }

//see if you can set the volume and have it change with the emitter.

