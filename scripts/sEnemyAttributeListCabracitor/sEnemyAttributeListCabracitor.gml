/// @description sMakeEnemyAttributeListKBot()
/*this script returns a list structure that contains all the attributes of enemy unit
Maintenance Robot. That structure is used to make the unit itself.
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

name = "Cabracitor"
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

ds_list_add(vlist,irandom(3))//23 hairtype

ds_list_add(vlist,6)//24 moverange

ds_list_add(vlist,2)//25 uprange
ds_list_add(vlist,2)//26 strength
ds_list_add(vlist,70)//27 skill
ds_list_add(vlist,70)//28 accuracy
ds_list_add(vlist,20)//29 hp
ds_list_add(vlist,20)//30 maxhp
ds_list_add(vlist,2)//31 defense
ds_list_add(vlist,2)//32 mspeed

ds_list_add(vlist,0)//33 is this unit dead
ds_list_add(vlist,2)//34 if this unit is on the player or enemy team
ds_list_add(vlist,1)//35 unittype, kinetic robit
ds_list_add(vlist,ds_list_size(roomenemieslist))//36 the units position on the attributelist

/******** WEAPON ********************************/

//ds_list_add(vlist,irandom_range(1,6))//37 myweapon
//ds_list_add(vlist,4)//laser saw, debug force
//ds_list_add(vlist,choose(1,2,22,4,21,6))

var vweapon,vweapondata;





ds_list_add(vlist,0)//36 placeholders, these will be replaced at the end with unit-specific stuff
ds_list_add(ilist,0)//37




ds_list_add(vlist,50)//38 strengthchance
ds_list_add(vlist,70)//39 skillchance
ds_list_add(vlist,60)//40 maxhpchance
ds_list_add(vlist,50)//41 defensechance
ds_list_add(vlist,50)//42 mspeedchance
ds_list_add(vlist,0)//43 xp
ds_list_add(vlist,1)//44 level
ds_list_add(vlist,7)//45 vision range

//next twenty things aren't used in enemies
ds_list_add(vlist,0)//46 eyecol1
ds_list_add(vlist,0)//47 eyecol2
ds_list_add(vlist,0)//48 portrait head index
ds_list_add(vlist,0)//49 portrait ear index
ds_list_add(vlist,0)//50 portrait suit index
ds_list_add(vlist,0)//51 portrait nose index
ds_list_add(vlist,0)//52 portrait mouth index
ds_list_add(vlist,0)//53 portrait eyebrows index
ds_list_add(vlist,0)//54 portrait eyes index
ds_list_add(vlist,0)// 55 portrait eye offset
ds_list_add(vlist,0)// 56 portrait nose offset
ds_list_add(vlist,0)// 57 portrait mouth offset
ds_list_add(vlist,0)// 58 portrait eyebrow offset
ds_list_add(vlist,0)//59 small chance to be very short or tall
ds_list_add(vlist,0)//60 unit neck length
ds_list_add(vlist,0)//61 outfit type
ds_list_add(vlist,0)//62 shirtcol2
ds_list_add(vlist,0)//63 skirtorpants
ds_list_add(vlist,0)//64 facial hair
ds_list_add(vlist,0)//65 glasses index
ds_list_add(vlist,0)//66 shoecol 2


ds_list_add(vlist,ilist)//67 inventorylist
//fill inventorylist in unit specific stuff
    
ds_list_add(vlist,irandom_range(3,6))//68 intelligence
ds_list_add(vlist,rmap)//69 relationshipmap
ds_list_add(vlist,0)//70 am I KO'd
ds_list_add(vlist,-1)//71 ko turns

ds_list_add(vlist,sUnitMakeAbilitiesListInit())//72 abilitieslist, empty
ds_list_add(vlist,sUnitMakeAbilitiesListInit())//73 abilitiesusedlist
ds_list_add(vlist,sUnitMakeAbilitiesListInit())//74 abilitiescooldownlist

ds_list_add(vlist,2)//75 inventoryslots

//these are all the things that need to be replaced for each new type of enemy. It would be more efficient
//to set them initially to the proper value, but the potential for undetected errors is much greater,
//so just replace them her instead.

name = "Cabracitor"
ds_list_replace(vlist,1,name)//1 name


vweapon = 14//Electro horns
//vweapon = 4//laser saw, debug force
vweapondata = sMakeItemData(vweapon,-1)
ds_list_replace(vlist,37,vweapondata)//37 myweapon
ds_list_replace(ilist,0,vweapondata)//add weapon data to inventory list


ds_list_replace(vlist,26,6)//26 strength
ds_list_replace(vlist,27,60)//27 skill
ds_list_replace(vlist,28,60)//28 accuracy
ds_list_replace(vlist,30,20)//30 maxhp
ds_list_replace(vlist,29,20)//29 hp
ds_list_replace(vlist,31,4)//31 defense
ds_list_replace(vlist,32,2)//32 mspeed
ds_list_replace(vlist,68,irandom_range(3,6))//68 intelligence



ds_list_replace(vlist,38,50)//38 strengthchance
ds_list_replace(vlist,39,70)//39 skillchance
ds_list_replace(vlist,40,60)//40 maxhpchance
ds_list_replace(vlist,41,50)//41 defensechance
ds_list_replace(vlist,42,50)//42 mspeedchance

ds_list_add(vlist,5)//24 moverange
ds_list_replace(vlist,45,7)//45 vision range
ds_list_replace(vlist,25,2)//25 uprange

ds_list_replace(vlist,35,8)//35 unittype, cabra
ds_list_replace(vlist,43,0)//43 xp
ds_list_replace(vlist,44,1)//44 level




ds_list_replace(vlist,75,2)//75 how many inventoryslots
/*//no items for Cabra
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
*/


return vlist;



















