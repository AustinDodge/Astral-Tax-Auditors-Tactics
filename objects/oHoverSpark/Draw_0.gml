switch anim{//pick the proper animation script
    case 0: sDrawNomodStand(); break;//still
    case 1: sDrawNomodStand(); break;//idle/walk
    case 2: sDrawSkullsplodeAttack(); break;//short attack
    case 3: sDrawSkullsplodeAttack(); break;//long attack
    case 4: sDrawSkullsplodeRecoil(); break;//recoil
    case 5: ; break;//item throw
    case 6: ; break;//item use
    }



