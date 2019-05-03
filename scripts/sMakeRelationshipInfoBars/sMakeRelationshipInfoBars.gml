///sMakeRelationshipInfoBars()
/*called by oUnitStatsWindow to create the bars that show the bond between its unit and
others. First the bars are made, and then they are positioned, with the strongest bonds at the top.
myunit is oStatWindow's who's stats are being displayed, vbar.myunit is the unit being
compared
*/

var vprio,vlist,vbar,vunit,i,j,vx,vy,vyup,vbondlevel;

vprio = ds_priority_create()
vunit = -4

j = ds_list_size(playerunitlist)



for (i = 0; i < j; i += 1){
	vbar = instance_create_depth(x,y,depth-1,oUnitStatsBondBar)
	vlist = ds_list_find_value(playerunitlist,i)//the playerunitlist stores where that units attributes are stored, not the units instance id
	with oUnitParent{
		if myattributelist = vlist{
			vunit = id
			}
		}
	if vunit != myunit{//don't do anything for the unit whos stats are being displayed
		vbar.myunit = vunit
		vbar.mylist = vlist
		if instance_exists(vunit){//if the unit is dead, don't display a relationship for now
			vbondlevel = sGetUnitRelationshipLevel(myunit,vunit,0)
			}else{
			vbondlevel = 0
			}
		vbar.bondlevel = vbondlevel
		ds_priority_add(vprio,vbar,vbondlevel)
		}else{
		with vbar{
			instance_destroy()
			}
		}
	}

//after all bars are made, posiion them
vx = x + 150
vy = y + 40
vyup = 30

while !ds_priority_empty(vprio){
	vbar = ds_priority_delete_max(vprio)
	vbar.x = vx
	vbar.y = vy
	vy += vyup
	}

with oUnitStatsBondBar{
	parent = oUnitStatsWindow
	event_perform(ev_other,ev_user15)
	}
	

