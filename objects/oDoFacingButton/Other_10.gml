//The player can click this button to prematurely end the unit's turn without taking
//and actions and pick a direction for the unit to face.
sDestroyRangeTiles()
sMakeUnitFacingArrow(myunit,1)
with oButton{
    instance_destroy()
    }

