if kostatus = 1{
    anim = 7
    }

switch anim{//pick the proper animation script
    case 0: sDrawAuditorStand(facing,animstep,1); break;//still
    case 1: sDrawAuditorStand(facing,animstep,1); break;//idle/walk
    case 2: sDrawAuditorAttack(facing,animstep,1); break;//short attack
    case 3: sDrawAuditorAttack(facing,animstep,1); break;//long attack
    case 4: sDrawAuditorRecoil(facing,animstep,1); break;//recoil
    case 5: sDrawAuditorThrow(facing,animstep,1); break;//item throw
    case 6: sDrawAuditorHold(facing,animstep,1); break;//item hold
    case 7: sDrawAuditorKO(facing,animstep,1); break;//KOd
    }


