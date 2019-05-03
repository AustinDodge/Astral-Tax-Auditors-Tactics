/*when clicked, destroy the UnitStatsWindow and self, then click on the unit that was being displayed
*/

var vunit;

canclick = oUnitStatsWindow.couldclick
canmovecamera = oUnitStatsWindow.couldmovecamera

vunit = oUnitStatsWindow.myunit

with oAbilityIcon{
	instance_destroy()
	}
with oUnitStatsBondBar{
	instance_destroy()
	}

with oUnitStatsWindow{
	instance_destroy()
	}
instance_destroy()

sClickOnPlayerUnit(vunit)