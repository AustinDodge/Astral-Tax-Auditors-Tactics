/// @description sMapCreateFinish()
/*This script performs the final init events that should only happen for a "complete"
room - level number incrementing, making the next room an elevaor, etc.
*/



donemakingroom = 1

sunit = instance_nearest(imouse_x,imouse_y,oAuditor)
if sunit = noone{
    sunit = -1
    }
/*with oDoorTile{
    mydoorpit.depth = depth+1
    }*/

//if the next map should be an elevator, do map specific things
    
if inelevator = 1{
    nextelevator = 0
    sSoundPlayMusic(soundElevatorMusic1,0.5,0,1)
    }else{
    levelnumber += 1
    nextelevator = 1
    }

