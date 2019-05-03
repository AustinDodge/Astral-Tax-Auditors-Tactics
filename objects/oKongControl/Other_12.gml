

myunit.didaction = 1

sDestroyRangeTiles()
//myobject.y = unittile.y
sAttackUnitStartKnock(myobject,myunit)
myobject.knockdamage = myobject.hp
myunit.anim = 5
//myunit.turnover = 1
myunit.cancancelmove = 0
instance_create(x,y,oActionControl)
oActionControl.startunit = myunit
oActionControl.relationshipunit = myunit//default
oActionControl.endunitwhendone = 1

objectfalling = 1
objectfallsteps = 6
if throwdir = 0 or throwdir = 1{
    objectfallspeed = 4
    }else{
    objectfallspeed = 5
    }

myunit.alarm[7] = 20//return to default anim

//audio_play_sound(soundWindupSwing1,1,0)
sSoundPlayEffect(soundWindupSwing1,1,0,1)

alarm[0] = 10

