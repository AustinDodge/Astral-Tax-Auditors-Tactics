/// @description sMapMakeEnemyAttributes()
/*This script checks if enemies have already been created for this room, and if not,
makes attributelists for them like the auditors. It saves these attributes in lists which
it then puts on roomenemieslist, and returns this list to oMapControl. The old script made
instances of all enemies then destroyed them, this one makes lists desctibing all attributes
and lates has real instances load those scripts.
*/

var i,vunit,vlist,possibleenemieslist,vobj,vtype,vlevel,j,alist,vnum,enemytypelist,vdif;
vnum = 0
with oMapTile{
    if ds_grid_get(tiletypegrid,mx,my) = 0{
        vnum += 1
        }
    }
howmanyenemies = ceil(vnum/10)
if maptype = 1{
    howmanyenemies *= 1.6
    howmanyenemies = ceil(howmanyenemies)
    }
if allenemieskilled = 0{//if the player has already killed all enemies in this room
    if roomenemieslist = 0{//if there isn't an enemieslist in oMapControl
        roomenemieslist = ds_list_create()
        enemytypelist = sMapMakeEnemyTypeList()
        possibleenemieslist = sMakePossibleEnemiesListTemp(enemytypelist)
        ds_list_destroy(enemytypelist)
        //for (i = 0; i < howmanyenemies; i += 1){
        i = 0
        while mapdifficulty > 0{
            vtype = ds_list_find_value(possibleenemieslist,0)
			//vtype = 1//debug, force maint robit
            ds_list_delete(possibleenemieslist,0)
            vobj = sPickEnemy(vtype)
            vdif = sGetEnemyDifficulty(vtype)
            mapdifficulty -= vdif
            //make the list
            switch vtype{
                case 1: alist = sEnemyAttributeListMaintBot(); break;//maintenance bot
				case 2: alist = sEnemyAttributeListElectroBot(); break;
				case 3: alist = sEnemyAttributeListSpookyBot(); break;
				case 4: alist = sEnemyAttributeListSkullsplode(); break;
				case 5: alist = sEnemyAttributeListHoverspark(); break;
				case 6: alist = sEnemyAttributeListCabra(); break;
				case 7: alist = sEnemyAttributeListDecabra(); break;
				case 8: alist = sEnemyAttributeListCabracitor(); break;
				case 9: alist = sEnemyAttributeListSawbot(); break;
                }
            ds_list_add(roomenemieslist,alist)//add the units attributes to the list
            i += 1//maintain the list number position
            }
        }else{//if the list of enemies has been made for this room,
        //do nothing yet
        }
        
    }
    
ds_list_destroy(possibleenemieslist)
