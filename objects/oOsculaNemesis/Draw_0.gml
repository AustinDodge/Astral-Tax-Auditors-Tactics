switch anim{//pick the proper animation script
    case 0: sDrawOsculaStand(); break;//still
    case 1: sDrawOsculaStand(); break;//idle/walk
    case 2: sDrawOsculaAttack(); break;//short attack
    case 3: sDrawOsculaAttack(); break;//long attack
    case 4: sDrawOsculaRecoil(); break;//recoil
    case 5: ; break;//item throw
    case 6: ; break;//item use
    }


