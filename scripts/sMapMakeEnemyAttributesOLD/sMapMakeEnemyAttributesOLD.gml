/// @description sMapMakeEnemyAttributes()
/*This script checks if enemies have already been created for this room, and if not,
makes attributelists for them like the auditors. It saves these attributes in lists which
it then puts on roomenemieslist, and returns this list to oMapControl. The enemies made in
this script are destroyed, to be remade by another script.
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
            ds_list_delete(possibleenemieslist,0)
            vobj = sPickEnemy(vtype)
            vdif = sGetEnemyDifficulty(vtype)
            mapdifficulty -= vdif
            vunit = instance_create(x,y,vobj)
            vlevel = 3//there will be something to actually pick the level in the future
            
            with vunit{
                listnum = i
                event_perform(ev_other,ev_user0)//perform init
                for (j = 0; j < vlevel; j += 1){//level up
                    //event_perform(ev_other,ev_user1)
                    }
                alist = sUnitMakeAttributeList()
                instance_destroy()
                }//end with vunit
            ds_list_add(roomenemieslist,alist)//add the units attributes to the list
            i += 1//maintain the list number position
            }
        }else{//if the list of enemies has been made for this room,
        //do nothing yet
        }
        
    }
    
ds_list_destroy(possibleenemieslist)
