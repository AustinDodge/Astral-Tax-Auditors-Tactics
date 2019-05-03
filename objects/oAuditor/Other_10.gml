facing = 3
anim = 1
/*
0 is still
1 is idle/walk
2 is short attack
3 is long attack
4 is recoil
5 is item throw
6 is item use
*/

//mypalette = auditormainpalettebase
mypalette = -1
headpalette = -1
hairpalette = -1

moverange = 7
movepoints = moverange
uprange = 2
team = 1//player team
unitmovesound = soundStepMove1
unitanimtype = 1//humanoid animation type
gender = ds_list_find_value(myattributelist,0)
name = ds_list_find_value(myattributelist,1)
elevation = mytile.elevation

bodytype = ds_list_find_value(myattributelist,22)
hairtype = ds_list_find_value(myattributelist,23)

haircol1 = ds_list_find_value(myattributelist,2)
if haircol1 != 0{//if color attributes have already been made, load them
    haircol2 = ds_list_find_value(myattributelist,3)
    haircol3 = ds_list_find_value(myattributelist,4)
    haircol4 = ds_list_find_value(myattributelist,5)
    
    skincol1 = ds_list_find_value(myattributelist,6)
    skincol2 = ds_list_find_value(myattributelist,7)
    skincol3 = ds_list_find_value(myattributelist,8)
    
    

    tiecol1 = ds_list_find_value(myattributelist,9)
    tiecol2 = ds_list_find_value(myattributelist,10)
    
    jacketcol1 = ds_list_find_value(myattributelist,11)
    jacketcol2 = ds_list_find_value(myattributelist,12)
    jacketcol3 = ds_list_find_value(myattributelist,13)
    jacketcol4 = ds_list_find_value(myattributelist,14)
    jacketcol5 = ds_list_find_value(myattributelist,15)
    
    legcol1 = ds_list_find_value(myattributelist,16)
    legcol2 = ds_list_find_value(myattributelist,17)
    legcol3 = ds_list_find_value(myattributelist,18)
    legcol4 = ds_list_find_value(myattributelist,19)
    
    shoecol1 = ds_list_find_value(myattributelist,20)
    shirtcol1 = ds_list_find_value(myattributelist,21)
    
    bodytype = ds_list_find_value(myattributelist,22)
    hairtype = ds_list_find_value(myattributelist,23)
    
    eyecol1 = ds_list_find_value(myattributelist,45)
    eyecol2 = ds_list_find_value(myattributelist,46)
    
    shirtcol2 = ds_list_find_value(myattributelist,62)
    
    shoecol2 = ds_list_find_value(myattributelist,66)
    }else{//otherwise, make them and place them in the list
    //show_message("making colors")
    sAuditorMakeColors()
    ds_list_replace(myattributelist,2,haircol1)
    ds_list_replace(myattributelist,3,haircol2)
    ds_list_replace(myattributelist,4,haircol3)
    ds_list_replace(myattributelist,5,haircol4)
    
    ds_list_replace(myattributelist,6,skincol1)
    ds_list_replace(myattributelist,7,skincol2)
    ds_list_replace(myattributelist,8,skincol3)
    
    
    ds_list_replace(myattributelist,9,tiecol1)
    ds_list_replace(myattributelist,10,tiecol2)
    
    ds_list_replace(myattributelist,11,jacketcol1)
    ds_list_replace(myattributelist,12,jacketcol2)
    ds_list_replace(myattributelist,13,jacketcol3)
    ds_list_replace(myattributelist,14,jacketcol4)
    ds_list_replace(myattributelist,15,jacketcol5)
    
    ds_list_replace(myattributelist,16,legcol1)
    ds_list_replace(myattributelist,17,legcol2)
    ds_list_replace(myattributelist,18,legcol3)
    ds_list_replace(myattributelist,19,legcol4)
    
    ds_list_replace(myattributelist,20,shoecol1)
    ds_list_replace(myattributelist,21,shirtcol1)
    ds_list_replace(myattributelist,22,bodytype)
    ds_list_replace(myattributelist,23,hairtype)
    
    ds_list_replace(myattributelist,46,eyecol1)
    ds_list_replace(myattributelist,47,eyecol2)
    
    ds_list_replace(myattributelist,62,shirtcol2)
    
    ds_list_replace(myattributelist,66,shoecol2)
    }



bodysprite = maleauditorjacketnoarm
backarmsprite = maleauditorjacketbody

headsprite = auditorhead
hairsprite = maleauditorhair1
frontarmsprite = maleauditorjacketjustarm
fronthandsprite = maleauditorjacketjusthand
lowerbodysprite = maleauditorpants1

facialhairsprite = sauditorbeard1
facialhairportraitsprite = 0

//load stats

moverange = ds_list_find_value(myattributelist,24)
movepoints = moverange
uprange = ds_list_find_value(myattributelist,25)
strength = ds_list_find_value(myattributelist,26)
skill = ds_list_find_value(myattributelist,27)
intelligence = ds_list_find_value(myattributelist,68)
accuracy = ds_list_find_value(myattributelist,28)
hp = ds_list_find_value(myattributelist,29)
maxhp = ds_list_find_value(myattributelist,30)
defense = ds_list_find_value(myattributelist,31)
mspeed = ds_list_find_value(myattributelist,32)

amidead = ds_list_find_value(myattributelist,33)
team = ds_list_find_value(myattributelist,34)
unittype = ds_list_find_value(myattributelist,35)

myweaponlist = ds_list_find_value(myattributelist,37)
if ds_exists(myweaponlist,ds_type_list){
    myweapon = ds_list_find_value(myweaponlist,0)
    }

strengthchance = ds_list_find_value(myattributelist,38)
skillchance = ds_list_find_value(myattributelist,39)
maxhpchance = ds_list_find_value(myattributelist,40)
defensechance = ds_list_find_value(myattributelist,41)
mspeedchance = ds_list_find_value(myattributelist,42)

xp = ds_list_find_value(myattributelist,43)
level = ds_list_find_value(myattributelist,44)
visionrange = ds_list_find_value(myattributelist,45)

//break in number sequence for eye colors, see above

portraitheadindex = ds_list_find_value(myattributelist,48)
portraitearindex = ds_list_find_value(myattributelist,49)
portraitsuitindex = ds_list_find_value(myattributelist,50)
portraitnoseindex = ds_list_find_value(myattributelist,51)
portraitmouthindex = ds_list_find_value(myattributelist,52)
portraiteyebrowsindex = ds_list_find_value(myattributelist,53)
portraiteyesindex = ds_list_find_value(myattributelist,54)

portraiteyeoffset = ds_list_find_value(myattributelist,55)
portraitnoseoffset = ds_list_find_value(myattributelist,56)
portraitmouthoffset = ds_list_find_value(myattributelist,57)
portraiteyebrowoffset = ds_list_find_value(myattributelist,58)
portraitheightoffset = ds_list_find_value(myattributelist,59)
portraitneckoffset = ds_list_find_value(myattributelist,60)
unitoutfittype = ds_list_find_value(myattributelist,61)
//break in sequence for shirtcol2

skirtorpants = ds_list_find_value(myattributelist,63)
facialhair = ds_list_find_value(myattributelist,64)
glassesindex = ds_list_find_value(myattributelist,65)

//break 66 shoecol 2

inventorylist = ds_list_find_value(myattributelist,67)
intelligence = ds_list_find_value(myattributelist,68)
relationshipmap = ds_list_find_value(myattributelist,69)

abilitieslist = ds_list_find_value(myattributelist,72)
abilitiesusedlist = ds_list_find_value(myattributelist,73)
abilitiescooldownlist = ds_list_find_value(myattributelist,74)
inventoryslots = ds_list_find_value(myattributelist,75)


drawear = 1//not in the list, determined in sAuditorPickSprites



initialized = 1



sGetWeaponStats(myweapon)
canmakefriends = 1

sDrawAuditorPickSprites()





/* */
/*  */
