switch anim{//pick the proper animation script
    case 0: sDrawRobitStand(); break;//still
    case 1: sDrawRobitStand(); break;//idle/walk
    case 2: sDrawRobitAttack(); break;//short attack
    case 3: sDrawRobitAttack(); break;//long attack
    case 4: sDrawRobitRecoil(); break;//recoil
    case 5: ; break;//item throw
    case 6: ; break;//item use
    }


