maxhitpoints = 0//the max HP of the calling unit
starthitpoints = 0//the number of hitpoints when the unit starts the animation
actualhitpoints = 0//the number of hitpoints when animation is finished
hpdifference = 0//the difference between the start and end HP
myunit = 0//the unit whose HP is being drawn
greenpoints = 0//how many to draw in green
redpoints = 0//how many to draw red
//draw the remainder gray
damage = 0//how much damage will be done to the unit
heal = 0//how much the unit will be healed

animstage = -1//the stage of the animation
/*
0 is draw actual HP and change points to be subtracted to red one by one
1 is draw finish HP and points being subtracted in red, deleting red HP
2 is draw just finish HP
*/

hpperrow = 10//how many HP to draw per row
alarmon = 0//if an alarm is counting down

/* */
/*  */
