switch anim{//pick the proper animation script
    case 0: sDrawNomodStand(); break;//still
    case 1: sDrawNomodStand(); break;//idle/walk
    case 2: sDrawNomodAttack(); break;//short attack
    case 3: sDrawNomodAttack(); break;//long attack
    case 4: sDrawNomodRecoil(); break;//recoil
    case 5: ; break;//item throw
    case 6: ; break;//item use
    }



