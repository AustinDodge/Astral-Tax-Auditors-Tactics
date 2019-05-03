var vtile;

if canclick = 1{
    sRelationshipAddProximity(myunit)
    myunit.turnover = 1
    myterminal.locked = 0
    exitlocked = 0
    with oDoorTerminal{
        if locked = 1{
            exitlocked = 1
            }
        }
        
    sDestroyRangeTiles()
    with oButton{
        instance_destroy()
        }
    }

