/*var i,vdist,velev,vtime,vx,vy,vfinaldist,vfinalspeed,velevdist;

if nosavescumming = 1{//get a random number, either premade or instantly made
    i = sGetPremadePercent()
    }else{
    i = irandom(99)
    }
if i < attackerhit{//determine attacker hit
    didattackerhit = 1
    if attacker.explodestatus = 1{
        didattackerhit = 0
        }
    astriketime += attackerdamage
    if attackerdamage >= defender.hp and didattackerhit = 1{
        candefenderattack = 0
        }
    }
        


    

if attacker.aiactivated = 0{
    attacker.aiactivated = 1
    }
if defender.aiactivated = 0{
    defender.aiactivated = 1
    }

if nosavescumming = 1{//get a random number, either premade or instantly made
    i = sGetPremadePercent()
    }else{
    i = irandom(99)
    }
if i < attackerknock{//determine attacker knock
    didattackerknock = 1
    if didattackerhit = 1{//if the attacker hit AND knocked, the defender cannot attack
        candefenderattack = 0
        }else{
        didattackerknock = 0
        }
    }

if nosavescumming = 1{//get a random number, either premade or instantly made
    i = sGetPremadePercent()
    }else{
    i = irandom(99)
    }
if i < attackercrit{//determine attacker crit
    didattackercrit = 1
    attackerdamage *= 2
    if didattackerhit = 1 and attackerdamage >= defender.hp{
        candefenderattack = 0
        }
    }
    
//determine the projectile information
if attacker.weapontraveltime > 0{    
    vdist = point_distance(attacker.mx,attacker.my,defender.mx,defender.my)
    velev = abs(ds_grid_get(mapheightgrid,attacker.mx,attacker.my)-ds_grid_get(mapheightgrid,defender.mx,defender.my))
    velev = round(velev/2)
    vfinaldist = point_distance(0,0,vdist,velev)//the total distance accounting for the height difference in tiles
    //vfinaldist = vdist+velev//the total distance needed to travel in 3D tiles
    
    vfinalspeed = vfinaldist*attacker.weapontraveltime//the non-rounded total travel time in steps
    attackerprojectilespeed = vfinalspeed/vdist//the projectile's final travel speed per step
    atraveltime = round(vfinalspeed)
    //atraveltime = vfinaldist*vdist//the corrected total time it will take the projectile to travel
    
    
    atravelstartx = attacker.x
    atravelstarty = attacker.y-20
    
    switch attacker.facing{
        case 0: atravelstartx -= 15; break;
        case 1: atravelstartx += 15; break;
        case 2: atravelstartx += 15; break;
        case 3: atravelstartx -= 15; break;
        }
    
    atraveldestx = defender.x
    atraveldesty = defender.y-8
    if didattackerhit = 0{
        //add an offset if the attacker missed
        switch irandom(1){
            case 0: atraveldestx += irandom_range(6,15); break;
            case 1: atraveldestx -= irandom_range(6,15); break;
            }
        switch irandom(1){
            case 0: atraveldesty += irandom_range(6,15); break;
            case 1: atraveldesty -= irandom_range(6,15); break;
            }
        }   
    }

    

    
//Done with attacher information, now determine defender stuff
    
if defender.myweapon = 0{//if the defender has no weapon
    candefenderattack = 0
    }
if defender.stunnedstatus > 0{
    candefenderattack = 0
    }

    
if candefenderattack = 1{//if the defender can attack, calculate outcome
//otherwise leave everything at 0
    if nosavescumming = 1{//get a random number, either premade or instantly made
        i = sGetPremadePercent()
        }else{
        i = irandom(99)
        }
    if i < defenderhit{//determine defender hit
        diddefenderhit = 1
        dstriketime += defenderdamage
        if defender.explodestatus = 1{//no hit with explodestatus
            diddefenderhit = 0
            }
        }
    
    if nosavescumming = 1{//get a random number, either premade or instantly made
        i = sGetPremadePercent()
        }else{
        i = irandom(99)
        }
    if i < defenderknock{//determine defender knock
        if diddefenderhit = 1{
            diddefenderknock = 1
            }
        }
    
    if nosavescumming = 1{//get a random number, either premade or instantly made
        i = sGetPremadePercent()
        }else{
        i = irandom(99)
        }
    if i < defendercrit and defenderhit = 1{//determine defender crit
        diddefendercrit = 1
        defenderdamage *= 2
        }
        
    if defender.weapontraveltime > 0{
    
        vdist = point_distance(defender.mx,defender.my,attacker.mx,attacker.my)
        velev = abs(ds_grid_get(mapheightgrid,attacker.mx,attacker.my)-ds_grid_get(mapheightgrid,defender.mx,defender.my))
        velev = round(velev/2)
        vfinaldist = point_distance(0,0,vdist,velev)//the total distance accounting for the height difference in tiles
        //vfinaldist = vdist+velev//the total distance needed to travel
        vfinalspeed = vfinaldist*defender.weapontraveltime//the non-rounded total travel time in steps
        defenderprojectilespeed = vfinalspeed/vdist//the projectile's final travel speed per step
        dtraveltime = round(vfinalspeed)//the total time it will take the projectile to travel
        
        dtravelstartx = attacker.x
        dtravelstarty = attacker.y-20
        
        dtraveldestx = defender.x
        dtraveldesty = defender.y-8
        
        switch sUnitFaceUnit(defender,attacker){
            case 0: dtravelstartx -= 15; break;
            case 1: dtravelstartx += 15; break;
            case 2: dtravelstartx += 15; break;
            case 3: dtravelstartx -= 15; break;
            }
        
        if diddefenderhit = 0{
            //add an offset if the attacker missed
            switch irandom(1){
                case 0: atraveldestx += irandom_range(6,15); break;
                case 1: atraveldestx -= irandom_range(6,15); break;
                }
            switch irandom(1){
                case 0: atraveldesty += irandom_range(6,15); break;
                case 1: atraveldesty -= irandom_range(6,15); break;
                }
            }   
        }
    }

defenderprevface = defender.facing//set the defenders current facing in case it is able to return to the previous facing direction
attackermove = 1//set the animation to the attackers turn
animating = 1//get things started

sDestroyRangeTiles()
with oButton{
    instance_destroy()
    }
    
/*

if attacker.object_index = oAuditor{//if attacker is on player team
    if !instance_exists(oXPControl){
        instance_create(x,y,oXPControl)
        oXPControl.target = attacker
        with oXPControl{
            event_perform(ev_other,ev_user0)
            }
        }else{
        show_message("oXPControl already exists, that's weird you should check that out")
        }
    }else{
    if defender.object_index = oAuditor{
        if !instance_exists(oXPControl){
            instance_create(x,y,oXPControl)
            oXPControl.target = defender
            with oXPControl{
                event_perform(ev_other,ev_user0)
                }
            }else{
            show_message("oXPControl already exists, that's weird you should check that out")
            }
        }
    }
    
instance_create(x,y,oActionControl)
oActionControl.startunit = attacker
    
























/* */
/*  */
