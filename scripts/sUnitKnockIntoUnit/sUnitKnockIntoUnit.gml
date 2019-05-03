/// @description sUnitKnockIntoUnit(knocker,knocked,explosionknockdir)
/// @param knocker
/// @param knocked
/// @param explosionknockdir
/*This script is called when one unit that's currently knocked bumps into another unit,
knocking that unit in turn.
*/
var vunit,vknocked,vdir,vrolling,vknockdir;

vunit = argument0
vknocked = argument1
vknockdir = argument2
if vknockdir = -1{
    vknockdir = vunit.knockdir
    }
vrolling = 0

vknocked.lasttile = vknocked.mytile

if vunit.rollingknock = 1{//if the knocking unit rolls
    vdir = vunit.knockdir
    if vunit.knockaxis = 0{
        vrolling = 1//0 axis means that this unit always rolls when knocked
        }
    if vunit.knockaxis = 1{//if vknocked can go north or south
        switch vdir{
            case 0: vrolling = 1; break;
            case 2: vrolling = 1; break;
            }
        }
    if vunit.knockaxis = 2{//if vknocked can go east or west
        switch vdir{
            case 1: vrolling = 1; break;
            case 3: vrolling = 1; break;
            }
        }
    }



if vknocked.knockable = 1{
    if vrolling = 0{//if vunit is not rolling
        vknocked.amknocked = 1//transfer the current knock force to that unit
        vknocked.knockforce += vunit.knockforce
        vknocked.knockdir = vunit.knockdir
        vknocked.moving = 1
        vknocked.knockstep = 0
        }else{
        vknocked.alarm[4] = 20
        }
    if vknocked.rollingknock = 0{
        vknocked.facing = sUnitFaceUnit(vknocked,id)
        }
    sAddUnitToKnockedList(vknocked)
    if vknocked.rollingknock = 1{//if the knocked unit can roll
        vdir = vunit.knockdir
        if vknocked.knockaxis = 0{
            vknocked.knockforce = 1000
            vknocked.amknocked = 1//transfer the current knock force to that unit
            vknocked.knockdir = vunit.knockdir
            vknocked.moving = 1
            }
        if vknocked.knockaxis = 1{//if vknocked can go north or south
            switch vdir{
                case 0: vknocked.knockforce = 1000; break;
                case 1: vknocked.knockforce = 0; break;
                case 2: vknocked.knockforce = 1000; break;
                case 3: vknocked.knockforce = 0; break;
                }
            vknocked.amknocked = 1//transfer the current knock force to that unit
            vknocked.knockdir = vunit.knockdir
            vknocked.moving = 1
            }
        if vknocked.knockaxis = 2{//if vknocked can go east or west
            switch vdir{
                case 0: vknocked.knockforce = 0; break;
                case 1: vknocked.knockforce = 1000; break;
                case 2: vknocked.knockforce = 0; break;
                case 3: vknocked.knockforce = 1000; break;
                }
            vknocked.amknocked = 1//transfer the current knock force to that unit
            vknocked.knockdir = vunit.knockdir
            vknocked.moving = 1
            }
        }//end rollingknock stuff
    }
vunit.knockforce = 0
