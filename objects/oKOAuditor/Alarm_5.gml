var vko;

with oKOAuditor{
    alarm[5] = kotime
    }

if drawko = 1{
    drawko = 0
    }else{
    drawko = 1
    }

//synch all KOauditors
vko = drawko
with oKOAuditor{
    drawko = vko
    }


