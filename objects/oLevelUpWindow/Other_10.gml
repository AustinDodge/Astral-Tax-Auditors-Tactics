

starthp = target.maxhp
startstrength = target.strength
startskill = target.skill



var i,v,j,statdone,leveledupone;
leveledupone = 0
//for each level the unit has gained, roll for the chance to add to each stat until the roll fails

for (i = 0; i < levelsup; i += 1){
    leveledupone = 0
    while leveledupone = 0{//loop until at least one stat has gone up
        
        statdone = 0
        hpchance = target.maxhpchance//set start chance
        while statdone = 0{//loop adding HP
            v = sGetPremadePercent()
            if v < hpchance{
                addhp += 1
                leveledupone = 1
                hpchance -= 10//lower the stat chance by 10 for the next loop
                }else{
                statdone = 1
                }
            }
        
        statdone = 0
        strengthchance = target.strengthchance//set start chance
        while statdone = 0{//loop adding strength
            v = sGetPremadePercent()
            if v < strengthchance{
                addstrength += 1
                leveledupone = 1
                strengthchance -= 10//lower the stat chance by 10 for the next loop
                }else{
                statdone = 1
                }
            }
        
        statdone = 0
        skillchance = target.skillchance//set start chance
        while statdone = 0{//loop adding skill
            v = sGetPremadePercent()
            if v < skillchance{
                addskill += 2//add two since skill is a percentage out of 100
                leveledupone = 1
                skillchance -= 10//lower the stat chance by 10 for the next loop
                }else{
                statdone = 1
                }
            }
        }
    }

endhp = starthp + addhp
endstrength = startstrength + addstrength
endskill = startskill + addskill



hpstring = "+ "+string(addhp)
strengthstring = "+ "+string(addstrength)
skillstring = "+ "+string(addskill)

targetnamestring = target.name

startlevel = target.level
levelsadd = levelsup
endlevel = startlevel + levelsadd


//set the units new stats
target.maxhp = endhp
target.hp = endhp//restore all HP on level up
target.strength = endstrength
target.skill = endskill
target.level = endlevel

skillchance = target.skillchance
hpchance = target.maxhpchance
strengthchance = target.strengthchance



