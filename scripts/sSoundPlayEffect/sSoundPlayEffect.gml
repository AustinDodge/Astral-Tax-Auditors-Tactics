/// @description sSoundPlayEffect(sound,volume,loop?,allowduplicates)
/// @param sound
/// @param volume
/// @param loop?
/// @param allowduplicates
/*Has oSoundControl play a sound from its emitter.
*/

var vsound,vvolume,vloop,vind,vdupes,i,vlist,vpos,vend;

vsound = argument0
vvolume = argument1//the volume 
vloop = argument2
vdupes = argument3//if simultaneous dumlicates of the same sound are allowed

vvolume *= globaleffectsvolume

if vdupes = 1{
    vind = audio_play_sound_on(oSoundControl.soundemitter1,vsound,vloop,1)
    audio_sound_gain(vind,vvolume,0)
    }else{
    //process for not allowing duplicates of a sound to play immediately
    vlist = oSoundControl.soundoverlaplist
    vpos = 0
    vend = 0
    if ds_list_find_index(vlist,vsound) >= 0{//if the sound is on the list, don't play it
        vend = 1
        }
    i = ds_list_find_value(vlist,vpos)
    while i > -1{//find a free spot on the list if 16 isn't free
        vpos += 1
        i = ds_list_find_value(vlist,vpos)
        if vpos > 6{
            vend = 1
            i = -1
            }
        }
    if vend = 0{//if the end of the list hasn't been reached and the sound isn't already playing
        ds_list_replace(vlist,vpos,vsound)
        oSoundControl.alarm[vpos] = 20
        vind = audio_play_sound_on(oSoundControl.soundemitter1,vsound,vloop,1)
        audio_sound_gain(vind,vvolume,0)
        }
    }

//see if you can set the volume and have it change with the emitter.

