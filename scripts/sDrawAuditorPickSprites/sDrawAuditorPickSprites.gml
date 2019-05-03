/// @description sDrawAuditorPickSprites()

/*This script sets the proper sprite variables for characters based on facing, gender,
etc
*/
if gender = 1{//if male
    switch unitoutfittype{
        case 0:
            bodysprite = maleauditorjacketnoarm
            backarmsprite = maleauditorjacketbody
			frontarmsprite = maleauditorjacketjustarm
            ; break;
        case 1:
            bodysprite = maleauditorjacketbowtienoarm
            backarmsprite = maleauditorjacketbowtiebody
			frontarmsprite = maleauditorjacketjustarm
            ; break;
		case 2:
			bodysprite = maleauditorvestnoarm
			backarmsprite = maleauditorvestbody
			frontarmsprite = maleauditorvestjustarm
			; break;
		case 3:
			bodysprite = maleauditorvestbowtienoarm
			backarmsprite = maleauditorvestbowtiebody
			frontarmsprite = maleauditorvestjustarm
			; break;
        }
    hairsprite = maleauditorhair1
    fronthandsprite = maleauditorjacketjusthand
    lowerbodysprite = maleauditorpants1
    }else{//if female
    switch unitoutfittype{
        case 0:
            bodysprite = femaleauditorjacketnoarm
            backarmsprite = femaleauditorjacketbody
			frontarmsprite = femaleauditorskirtjustarm
            ; break;
        case 1:
            bodysprite = femaleauditorjacketbowtienoarm
            backarmsprite = femaleauditorjacketbowtiebody
			frontarmsprite = femaleauditorskirtjustarm
            ; break;
		case 2:
			bodysprite = femaleauditorvestnoarm
			backarmsprite = femaleauditorvestbody
			frontarmsprite = femaleauditorvestjustarm
			; break;
		case 3:
			bodysprite = femaleauditorvestbowtienoarm
			backarmsprite = femaleauditorvestbowtiebody
			frontarmsprite = femaleauditorvestjustarm
			; break;
        }
    headsprite = auditorhead
    hairsprite = femaleauditorhair1
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
