/*oAIActivationControl is created by oActionControl if there are any units that
need to be activated - that are close enough to player units to be used
*/

currentunit = 0//the unit that is about to be activated
cameraon = 0//if the camera is centered over the unit
xborder = 40//how close to the center is "centered"
yborder = 30
mylist = -1//set by oActionControl
active = 0//if this object should actually do anything
loopstage = 0//0 is wait, 1 is move camera to unit, 2 is start timer
atime = 10//how many steps to focus on a unit being activated

/* */
/*  */
