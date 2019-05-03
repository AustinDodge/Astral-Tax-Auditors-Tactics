///sMakeUnitStatsWindow
var vwindow;
with oUnitStatsWindow{
	instance_destroy()
	}
with oButton{
	instance_destroy()
	}
	
vwindow = instance_create_depth(x,y,-10001,oUnitStatsWindow)
vwindow.myunit = sunit
with vwindow{
	event_perform(ev_other,ev_user0)
	}
