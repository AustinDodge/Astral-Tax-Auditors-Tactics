globalvar playergrid;

playerturn = 1//the current turn, GLOBAL VARIABLE!
players = 2//the number of players; this should stay 2 unless something weird happens

allowaiturns = 1//if the AI will be allowed to go. If zero, the turn will always jump
//immediately back to the player with the units reset.

playergrid = ds_grid_create(4,4)/*a grid that details the relationships between different
teams - whether units of one team will try to attack units of another team. The place
where two teams meet shows the relationship between them, 0 is ignore, 1 is attack.*/
animatingtransition = 0//if oPlayerControl is currently animating the transition between turns
elevatorlist = ds_list_create()//the list of elevator tiles, when this is empty all elevator tiles
transitiondone = 0//if the transision is complete
elevatorsdone = 1//if the elevators have finished moving
//have moved

willchangeplayer = 0//oPlayerControl is waiting for something to finish before switching
//the player turn

/* */
/*  */
