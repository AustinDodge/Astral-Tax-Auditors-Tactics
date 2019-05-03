/// @description sEnemyGetAttributes(vunit)
/// @param vunit
/*this script takes an enemy unit and sets its attributes to those stored in its list
*/
var vunit;
vunit = argument0
with vunit{
    moverange = 6
    uprange = 2
    team = 1//player team
    unitanimtype = 1//humanoid animation type
    gender = ds_list_find_value(myattributelist,0)
    name = ds_list_find_value(myattributelist,1)
    moverange = ds_list_find_value(myattributelist,24)
    movepoints = moverange
    uprange = ds_list_find_value(myattributelist,25)
    strength = ds_list_find_value(myattributelist,26)
    skill = ds_list_find_value(myattributelist,27)
    accuracy = ds_list_find_value(myattributelist,28)
    hp = ds_list_find_value(myattributelist,29)
    maxhp = ds_list_find_value(myattributelist,30)
    defense = ds_list_find_value(myattributelist,31)
    mspeed = ds_list_find_value(myattributelist,32)
    team = ds_list_find_value(myattributelist,34)
    unittype = ds_list_find_value(myattributelist,35)
    //myattributelistpos = ds_list_find_value(myattributelist,36)//this is set properly when unit instance is made
    inventorylist = ds_list_find_value(myattributelist,67)//inventory list
    myweaponlist = ds_list_find_value(myattributelist,37)
    myweapon = ds_list_find_value(myweaponlist,0)
    if myweaponlist < 0{
        show_message("Unit didn't load a weapon!")
        }
		
	abilitieslist = ds_list_find_value(myattributelist,72)
	abilitiesusedlist = ds_list_find_value(myattributelist,73)
	abilitiescooldownlist = ds_list_find_value(myattributelist,74)
    //ds_list_add(inventorylist,myweaponlist)//weapon was already added to inventorylist on unit creation
    
    visionrange = ds_list_find_value(myattributelist,45)
    intelligence = ds_list_find_value(myattributelist,68)
    
    switch unittype{//get proper shadow sprite
        case 4: shadowsprite = spsmallshadowbounce; break;
        case 5: shadowsprite = spsmallshadowbounce; break;
        case 6: shadowsprite = spsmallshadowbounce; break;
        case 7: shadowsprite = spsmallshadowbounce; break;
        case 8: shadowsprite = spsmallshadowbounce; break;
        case 9: shadowsprite = spsmallshadowbounce; break;
        }
        
    }

