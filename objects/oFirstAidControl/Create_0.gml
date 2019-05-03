

canclick = 0

startunit = 0//the unit using the First Aid ability
targetunit = 0// the unit being healed

targetfound = 0//if the player has clicked a unit to heal

animstage = 0//the current stage of animation
animstep = 0//the current step of animation
animsteps = 40//the total number of animation steps

unitlist = ds_list_create()//the list of units that can be healed


var vstring;
vstring = "Right-click a unit to heal. Eligible units have a green cursor on them. Left-click to cancel."
mywindow = sMakeGenericInfoWindow(oTileCursor,id,vstring)

