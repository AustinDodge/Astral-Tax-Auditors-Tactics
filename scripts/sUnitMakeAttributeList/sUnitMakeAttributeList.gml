/// @description sUnitMakeAttributeList()
/*this script create an entire "attribute list", to be used with saving, storing the
enemies in a room, etc. It can be used by any unit, but will only store color information
if it is an auditor. It returns the list ID. Remember to subtract one from the commented
out number.
*/
var vlist,i;
vlist = ds_list_create()
ds_list_add(vlist,gender)//0 gender
ds_list_add(vlist,name)//1 name
if object_index = oAuditor or object_index = oKOAuditor or object_index = oCorpseAuditor{
    ds_list_add(vlist,haircol1)//2 haircol1
    ds_list_add(vlist,haircol2)//3 haircol2
    ds_list_add(vlist,haircol3)//4 haircol3
    ds_list_add(vlist,haircol4)//5 haircol4
    ds_list_add(vlist,skincol1)//6 skincol1
    ds_list_add(vlist,skincol2)//7 skincol2
    ds_list_add(vlist,skincol3)//8 skincol3
    ds_list_add(vlist,tiecol1)//9 tiecol1
    ds_list_add(vlist,tiecol2)//10 tiecol2
    ds_list_add(vlist,jacketcol1)//11 jacketcol1
    ds_list_add(vlist,jacketcol2)//12 jacketcol2
    ds_list_add(vlist,jacketcol3)//13 jacketcol3
    ds_list_add(vlist,jacketcol4)//14 jacketcol4
    ds_list_add(vlist,jacketcol5)//15 jacketcol5
    ds_list_add(vlist,legcol1)//16 legcol1
    ds_list_add(vlist,legcol2)//17 legcol2
    ds_list_add(vlist,legcol3)//18 legcol3
    ds_list_add(vlist,legcol4)//19 legcol4
    ds_list_add(vlist,shoecol1)//20 shoecol
    ds_list_add(vlist,shirtcol1)//21 shirtcol
    ds_list_add(vlist,bodytype)//22 bodytype
    ds_list_add(vlist,hairtype)//23 hairtype
    
    
    }else{
    for (i = 0; i < 22; i += 1){//add 21 empty values
        ds_list_add(vlist,0)
        }
    }
ds_list_add(vlist,moverange)//24 moverange
ds_list_add(vlist,uprange)//25 uprange
ds_list_add(vlist,strength)//26 strength
ds_list_add(vlist,skill)//27 skill
ds_list_add(vlist,accuracy)//28 accuracy
ds_list_add(vlist,hp)//29 hp
ds_list_add(vlist,maxhp)//30 maxhp
ds_list_add(vlist,defense)//31 defense
ds_list_add(vlist,mspeed)//32 mspeed
ds_list_add(vlist,amidead)//33 is this auditor dead
ds_list_add(vlist,team)//34 if this unit is on the player or enemy team
ds_list_add(vlist,unittype)//35 what type of unit object is this
ds_list_add(vlist,myattributelistpos)//36 the units position on the attribute list
ds_list_add(vlist,myweaponlist)//37 the weapon the unit is carrying
ds_list_add(vlist,strengthchance)//38 the chance that the unit will gain strength when leveling up
ds_list_add(vlist,skillchance)//39 ditto for skill
ds_list_add(vlist,maxhpchance)//40 ditto for maxhp
ds_list_add(vlist,defensechance)//41 ditto for defense
ds_list_add(vlist,mspeedchance)//42 ditto for mspeed
ds_list_add(vlist,xp)//43 xp
ds_list_add(vlist,level)//44 level
ds_list_add(vlist,visionrange)//45 vision range
//more auditor specific
if object_index = oAuditor{
    ds_list_add(vlist,eyecol1)//46 eyecol1
    ds_list_add(vlist,eyecol2)//47 eyecol2
    ds_list_add(vlist,portraitheadindex)//48 portraitheadindex
    ds_list_add(vlist,portraitearindex)//49 portraitearindex
    ds_list_add(vlist,portraitsuitindex)//50 portraitsuitindex
    ds_list_add(vlist,portraitnoseindex)//51 portraitnoseindex
    ds_list_add(vlist,portraitmouthindex)//52 portraitmouthindex
    ds_list_add(vlist,portraiteyebrowsindex)//53 portraiteyebrowsindex
    ds_list_add(vlist,portraiteyesindex)//54 portraiteyesindex
    ds_list_add(vlist,portraiteyeoffset)// 55 portraiteyeoffset
    ds_list_add(vlist,portraitnoseoffset)// 56 portraitnoseoffset
    ds_list_add(vlist,portraitmouthoffset)// 57 portraitmouthoffset
    ds_list_add(vlist,portraiteyebrowoffset)// 58 portraiteyebrowoffset
    ds_list_add(vlist,portraitheightoffset)// 59 portraitheightoffset
    ds_list_add(vlist,portraitneckoffset)//60 portraitneckoffset
    ds_list_add(vlist,unitoutfittype)//61 outfit type
    ds_list_add(vlist,shirtcol2)//62 shirtcol2
    ds_list_add(vlist,skirtorpants)//63 skirtorpants
    ds_list_add(vlist,facialhair)//64 facialhair
    ds_list_add(vlist,glassesindex)//65 glassesindex
    ds_list_add(vlist,shoecol2)//66 shoecol2
    
    }else{
    for (i = 0; i <= 20; i += 1){//add 21 empty values
        ds_list_add(vlist,0)
        }
    }
ds_list_add(vlist,inventorylist)//67 inventorylist
ds_list_add(vlist,intelligence)//68 intelligence
ds_list_add(vlist,relationshipmap)//69 relationshipmap
ds_list_add(vlist,amikod)//70 am I ko'd
ds_list_add(vlist,koturns)//71 how many turns until KO
ds_list_add(vlist,abilitieslist)//72 abilities list
ds_list_add(vlist,abilitiesusedlist)//73 abilitiesusedlist
ds_list_add(vlist,abilitiescooldownlist)//74 abilitiescooldownlist

ds_list_add(vlist,inventoryslots)//75 inventoryslots

return vlist;
























