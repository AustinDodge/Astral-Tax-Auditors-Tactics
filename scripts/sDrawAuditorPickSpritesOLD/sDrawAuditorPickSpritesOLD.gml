/// @description sDrawAuditorPickSprites()

/*This script sets the proper sprite variables for characters based on facing, gender,
etc
*/
if gender = 1{//if male
    switch unitoutfittype{
        case 0:
            if facing = 0 or facing = 1{//if facing away from the camera
                bodysprite = maleauditorjacketnoarm
                backarmsprite = maleauditorjacketbody
                }else{//if facing the camera
                bodysprite = maleauditorjacketnoarm
                backarmsprite = maleauditorjacketbody
                }
            ; break;
        case 1:
            if facing = 0 or facing = 1{//if facing away from the camera
                bodysprite = maleauditorjacketbowtienoarm
                backarmsprite = maleauditorjacketbowtiebody
                }else{//if facing the camera
                bodysprite = maleauditorjacketbowtienoarm
                backarmsprite = maleauditorjacketbowtiebody
                }
            ; break;
        }
    hairsprite = maleauditorhair1
    frontarmsprite = maleauditorjacketjustarm
    fronthandsprite = maleauditorjacketjusthand
    lowerbodysprite = maleauditorpants1
    }else{//if female
    switch unitoutfittype{
        case 0:
            if facing = 0 or facing = 1{//if facing away from the camera
                bodysprite = femaleauditorjacketnoarm
                backarmsprite = femaleauditorjacketbody
                }else{//if facing the camera
                bodysprite = femaleauditorjacketnoarm
                backarmsprite = femaleauditorjacketbody
                }
            ; break;
        case 1:
            if facing = 0 or facing = 1{//if facing away from the camera
                bodysprite = femaleauditorjacketbowtienoarm
                backarmsprite = femaleauditorjacketbowtiebody
                }else{//if facing the camera
                bodysprite = femaleauditorjacketbowtienoarm
                backarmsprite = femaleauditorjacketbowtiebody
                }
            ; break;
        }
    headsprite = auditorhead
    hairsprite = femaleauditorhair1
    frontarmsprite = femaleauditorskirtjustarm
    fronthandsprite = femaleauditorskirtjusthand
    switch skirtorpants{
        case 0: lowerbodysprite = femaleauditorskirt1; break;
        case 1: lowerbodysprite = femaleauditorpants1; break;
        }
    }
    
if anim != 4{//if not flinching
    headsprite = auditorhead
    }else{
    headsprite = auditorheadflinch
    }

hairsprite = sAuditorFindHairSprite(id)
mouthunder = 0
if facialhair > 0{
    if gender = 1{
        switch facialhair{
            case 1: facialhairsprite = sauditorbeard1; mouthunder = 0; break;
            case 2: facialhairsprite = sauditormustache1; mouthunder = 1; break;
            }
        }else{
        facialhair = 0
        }
    }
