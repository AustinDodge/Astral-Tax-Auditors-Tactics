if oSoundControl.musicsound1 = myind{
    oSoundControl.musicsound1 = -1
    }
if oSoundControl.musicsound2 = myind{
    oSoundControl.musicsound2 = -1
    }

audio_stop_sound(myind)
instance_destroy()

