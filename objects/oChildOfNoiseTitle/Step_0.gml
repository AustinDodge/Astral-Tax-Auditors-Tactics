if blackup = 1{
    blacktextamount += 0.25
    }else{
    blacktextamount -= 0.25
    }
if blacktextamount >= 15{
    blackup = 0
    }
if blacktextamount <= -7{
    blackup = 1
    }
    
whitebgamount = round(blacktextamount/2)

