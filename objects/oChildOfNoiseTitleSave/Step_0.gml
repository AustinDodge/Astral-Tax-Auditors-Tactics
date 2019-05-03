if blackup = 1{
    blacktextamount += 0.15
    }else{
    blacktextamount -= 0.15
    }
if blacktextamount >= 15{
    blackup = 0
    }
if blacktextamount <= -7{
    blackup = 1
    }
    
whitebgamount = round(blacktextamount/2)

if fadein = 1{
    fadealpha -= 0.01
    if fadealpha <= 0{
        fadein = 0
        alarm[0] = 200
        }
    }
if fadeout = 1{
    fadealpha += 0.04
    if fadealpha >= 1{
        fadeout = 0
        alarm[1] = 30
        //room_goto(roomStartMenu)
        }
    }

