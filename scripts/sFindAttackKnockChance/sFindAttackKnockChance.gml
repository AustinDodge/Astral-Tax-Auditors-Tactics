/// @description sFindAttackKnockChance(attacker,attackertile,defender)
/// @param attacker
/// @param attackertile
/// @param defender
/*this script determines what the knockback chance will be in combat between two units. The 
tile the attacker unit attacks from can be changed so this can be used to predict the result
of moving to a different tile.
*/

var knock,aunit,atile,defunit,ediff,epercent,vbonus,fbonus,vhalf,deftile,vtile,ledgebonus,vdir,dheight,vheight,vdiff;

aunit = argument0
atile = argument1
defunit = argument2
deftile = ds_grid_get(tilegrid,defunit.mx,defunit.my)
ledgebonus = 0

vdir = sTileFaceTile(atile,deftile)
vtile = 0
switch vdir{
    case 0: if deftile.my > 0{//unit will be knocked north
        vtile = ds_grid_get(tilegrid,deftile.mx,deftile.my-1)
        }; break;
    case 1: if deftile.mx < roomwidth-1{
        vtile = ds_grid_get(tilegrid,deftile.mx+1,deftile.my)
        }; break;
    case 2: if deftile.my < roomheight-1{
        vtile = ds_grid_get(tilegrid,deftile.mx,deftile.my+1)
        }; break;
    case 3: if deftile. mx > 0{
        vtile = ds_grid_get(tilegrid,deftile.mx-1,deftile.my)
        }; break;
    }

if vtile != 0{//if there's a valid tile to knock to, check the height difference
    dheight = deftile.elevation
    vheight = vtile.elevation
    vdiff = dheight - vheight
    if vdiff > 0{//if deftile is higher than the tile that will be knocked to
        ledgebonus = 10*vdiff
        }
    }

vbonus = sGetWeaponTypeBonus(aunit,defunit)
fbonus = sGetFacingCombatBonus(aunit,defunit)

knock = aunit.strength*10
vhalf = floor(knock/2)


/*if aunit.object_index = oAuditor{
    knock = 0
    }else{
    knock = 100
    }*/
/*//no knock bonus for weapon type
if vbonus = 1{//good weapon type bonus
    knock += vhalf
    }
if vbonus = 2{//bad weapon type bonus
    knock = vhalf
    }*/
if fbonus = 2{//attacking from side
    knock += vhalf
    }
if fbonus = 1{//attacking from rear
    knock += floor(vhalf/2)
    }

knock += ledgebonus

knock = floor(knock)

//knock = 100//debug if we need to check knocks
if defunit.unitisobject = 1{//always knock objects
    knock = 100
    }
if aunit.attackrange > 1{//long range attacks can't knock
    knock = 0
    }
if aunit.knockdist = 0{//if the unit can't knock units, no knock chance
    knock = 0
    }

return knock;
