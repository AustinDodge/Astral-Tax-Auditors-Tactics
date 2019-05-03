/// @description sMakeAttackRange(hurtorheal)
/// @param hurtorheal
/*this script makes the actual attack ranges located in sFindAttackRange. It's made
in a seperate script so there's no overlap. Hurtorheal is if the unit is using a weapon
that will hurt units, or heal them. It's almost always 0, hurt.
*/
var vicon,vunit,vtile,vteam,vhurtorheal;

vhurtorheal = argument0



with oAttackIcon{
    instance_destroy()
    }
with oHealIcon{
    instance_destroy()
    }
with oMapTile{//make the attack ranges
    if canattack = 1{
        //if cango = 0 or sunit.attackrange > 1{//if the has a long-range attack, draw the attackrange over moverange
            vtile = instance_create(x,y,oAttackRange)
            vtile.depth = depth - 2
            vtile.mx = mx
            vtile.my = my
            vtile.elevation = elevation
            vtile.active = 0
            attackable = 0
            vtile.parent = id
            
            
            if occupied > 0 and sunit.attacked = 0{//if there's a unit on the tile and current unit hasn't attacked
                if vhurtorheal = 0{//if the unit is attacking
                    if occupied.team != playerturn and sunit.team = playerturn{//if the occupied unit isn't on the player's team, i.e. is attackable
                        if ds_list_find_value(occupied.abilitiesusedlist,47) = 0{//if the unit isn't using the Blend In ability
                            attackable = 1
                            vunit = occupied
                            if vunit.unitisitem = 0 and vunit.objectiscrate = 0{
                                vicon = instance_create(vunit.x,vunit.y,oAttackIcon)
                                vicon.myunit = vunit
                                }
                            if sIsTileInAttackRange(id,sunit){
                                vtile.active = 1//make the tile actually clickable
                                //vicon.depth = vunit.depth-1
                                }
                            }
                        }
                    }else{
                    if occupied.team = playerturn and sunit.team = playerturn{//if the occupied unit isn't on the player's team, i.e. is attackable
                        attackable = 1
                        vunit = occupied
                        if vunit.unitisitem = 0 and vunit.objectiscrate = 0{
                            vicon = instance_create(vunit.x,vunit.y,oHealIcon)
                            vicon.myunit = vunit
                            }
                        if sIsTileInAttackRange(id,sunit){
                            vtile.active = 1//make the tile actually clickable
                            //vicon.depth = vunit.depth-1
                            }
                        }
                    }
                }
            //}
        }
    }

