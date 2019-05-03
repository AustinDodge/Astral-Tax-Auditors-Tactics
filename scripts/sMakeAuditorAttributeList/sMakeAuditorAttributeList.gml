/// @description sMakeAuditorAttributeList()
/*this script returns a list structure that contains all the attributes of the player's
auditor characters. It's run by Control at the start of a new game.
*/
var vlist,nlist,ilist,rmap,
gender, name,
haircol1,haircol2,haircol3,haircol4,
skincol1,skincol2,skincol3,
tiecol1,tiecol2,
jacketcol1,jacketcol2,jacketcol3,jacketcol4,jacketcol5,
legcol1,legcol2,legcol3,legcol4,
shoecol1,
bodytype,hairtype,
moverange,uprange,
strength,skill,accuracy,hp,maxhp,def,mspeed;

//make the list
vlist = ds_list_create()
ilist = ds_list_create()//inventory list for the unit being made
rmap = ds_map_create()
gender = irandom(1)
ds_list_add(vlist,gender)//0 gender

switch gender{
    case 1: nlist = mnamelist; break;
    case 0: nlist = fnamelist; break;
    }
ds_list_shuffle(nlist)
name = ds_list_find_value(nlist,0)
ds_list_delete(nlist,0)
ds_list_add(vlist,name)//1 name
ds_list_add(vlist,0)//2 haircol1
ds_list_add(vlist,0)//3 haircol2
ds_list_add(vlist,0)//4 haircol3
ds_list_add(vlist,0)//5 haircol4
ds_list_add(vlist,0)//6 skincol1
ds_list_add(vlist,0)//7 skincol2
ds_list_add(vlist,0)//8 skincol3
ds_list_add(vlist,0)//9 tiecol1
ds_list_add(vlist,0)//10 tiecol2
ds_list_add(vlist,0)//11 jacketcol1
ds_list_add(vlist,0)//12 jacketcol2
ds_list_add(vlist,0)//13 jacketcol3
ds_list_add(vlist,0)//14 jacketcol4
ds_list_add(vlist,0)//15 jacketcol5
ds_list_add(vlist,0)//16 legcol1
ds_list_add(vlist,0)//17 legcol2
ds_list_add(vlist,0)//18 legcol3
ds_list_add(vlist,0)//19 legcol4
ds_list_add(vlist,0)//20 shoecol
ds_list_add(vlist,0)//21 shirtcol
ds_list_add(vlist,0)//22 bodytype

ds_list_add(vlist,irandom(4))//23 hairtype

ds_list_add(vlist,7)//24 moverange

ds_list_add(vlist,2)//25 uprange
ds_list_add(vlist,5)//26 strength
ds_list_add(vlist,75)//27 skill
ds_list_add(vlist,70)//28 accuracy
ds_list_add(vlist,40)//29 hp
ds_list_add(vlist,40)//30 maxhp
ds_list_add(vlist,5)//31 defense
ds_list_add(vlist,5)//32 mspeed

ds_list_add(vlist,0)//33 is this auditor dead
ds_list_add(vlist,1)//34 if this unit is on the player or enemy team
ds_list_add(vlist,0)//35 what type of unit object is this
ds_list_add(vlist,ds_list_size(playerunitlist))//36 the units position on the attributelist

/******** WEAPON ********************************/

//ds_list_add(vlist,irandom_range(1,6))//37 myweapon
//ds_list_add(vlist,4)//laser saw, debug force
//ds_list_add(vlist,choose(1,2,22,4,21,6))

var vweapon,vweapondata;
vweapon = choose(1,2,22,4,21,6)
//vweapon = 4//laser saw, debug force
vweapondata = sMakeItemData(vweapon,-1)
ds_list_add(vlist,vweapondata)//37 myweapon
ds_list_add(ilist,vweapondata)//add weapon data to inventory list




ds_list_add(vlist,irandom_range(5,50)+irandom_range(5,40))//38 strengthchance
ds_list_add(vlist,irandom_range(5,50)+irandom_range(5,40))//39 skillchance
ds_list_add(vlist,irandom_range(5,50)+irandom_range(5,40))//40 maxhpchance
ds_list_add(vlist,irandom_range(5,50)+irandom_range(5,40))//41 defensechance
ds_list_add(vlist,irandom_range(5,50)+irandom_range(5,40))//42 mspeedchance

ds_list_add(vlist,0)//43 xp

ds_list_add(vlist,1)//44 level
ds_list_add(vlist,7)//45 vision range

ds_list_add(vlist,0)//46 eyecol1
ds_list_add(vlist,0)//47 eyecol2

ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitPartsHead)-1))//48 portrait head index
ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitPartsEar)-1))//49 portrait ear index
//ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitMaleSuit)-1))//50 portrait suit index
ds_list_add(vlist,irandom(1))//50 suit type index
ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitPartsNose)-1))//51 portrait nose index
ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitPartsMouth)-1))//52 portrait mouth index
ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitEyebrows)-1))//53 portrait eyebrows index
ds_list_add(vlist,irandom(sprite_get_number(sAuditorPortraitEyes)-1))//54 portrait eyes index

ds_list_add(vlist,irandom_range(0,-2))// 55 portrait eye offset
ds_list_add(vlist,irandom_range(0,2))// 56 portrait nose offset
ds_list_add(vlist,irandom_range(0,1))// 57 portrait mouth offset
ds_list_add(vlist,irandom_range(-1,1))// 58 portrait eyebrow offset
if irandom(6) < 6{
    ds_list_add(vlist,irandom_range(-3,6))//59 portrait height offset
    }else{
    ds_list_add(vlist,irandom_range(-8,11))//59 small chance to be very short or tall
    }
ds_list_add(vlist,irandom_range(2,-1))//60 unit neck length
ds_list_add(vlist,ds_list_find_value(vlist,50))//61 outfit type
ds_list_add(vlist,0)//62 shirtcol2
if irandom(2)<2{
    //ds_list_add(vlist,irandom(1))//skirtorpants
    ds_list_add(vlist,0)//63 skirtorpants
    }else{
    ds_list_add(vlist,1)//63 skirtorpants
    }
if irandom(2) < 1{
    ds_list_add(vlist,irandom_range(1,2))//64 facial hair
    }else{
    ds_list_add(vlist,0)//64 facial hair
    }
if irandom(2)<1{
    ds_list_add(vlist,irandom_range(1,2))//65 glasses index
    }else{
    ds_list_add(vlist,0)//65 glasses index
    }
    
ds_list_add(vlist,0)//66 shoecol 2
ds_list_add(vlist,ilist)//67 inventorylist
var vitemnum,vitemdata;
if irandom(1) = 1{
    //ds_list_add(ilist,7)//randomly add a medkit
    vitemnum = 7
    }else{
    //ds_list_add(ilist,8)//add a grenade
    vitemnum = 8
    }
vitemdata = sMakeItemData(vitemnum,-1)
ds_list_add(ilist,vitemdata)
    
ds_list_add(vlist,irandom_range(3,6))//68 intelligence
ds_list_add(vlist,rmap)//69 relationshipmap
ds_list_add(vlist,0)//70 am I KO'd
ds_list_add(vlist,-1)//71 ko turns

ds_list_add(vlist,sUnitMakeAbilitiesListInit())//72 abilitieslist
sAuditorInitAbilitiesList(ds_list_find_value(vlist,72))//init abilitieslist debug
ds_list_add(vlist,sUnitMakeAbilitiesListInit())//73 abilitiesusedlist
ds_list_add(vlist,sUnitMakeAbilitiesListInit())//74 abilitiescooldownlist

ds_list_add(vlist,4)//75 inventoryslots

return vlist;



















