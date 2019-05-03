

musicemitter1 = audio_emitter_create()//the general music emitter
musicemitter2 = audio_emitter_create()//secondary music emitter

soundemitter1 = audio_emitter_create()//primary effects emitter
soundemitter2 = audio_emitter_create()//secondary effects emitter

audio_emitter_gain(musicemitter1,globalmusicvolume)
audio_emitter_gain(musicemitter2,globalmusicvolume)

audio_emitter_gain(soundemitter1,globaleffectsvolume)
audio_emitter_gain(soundemitter2,globaleffectsvolume)

musicsound1 = -1//the current music that's playing
musicsound2 = -1//the other music that's playing


/*soundoverlaplist holds sounds that are currently playing and shouldn't be repeated
immediately to prevent volume issues. The list holds the index of the sounds that shouldn't
be repeated, with each list position(0-15) corresponding to an alarm that will remove
the sound index from the list and will allow the sound to be played again.
*/
soundoverlaplist = ds_list_create()//up to 16 sounds
while ds_list_size(soundoverlaplist) < 16{
    ds_list_add(soundoverlaplist,-1)
    }



/* */
/*  */
