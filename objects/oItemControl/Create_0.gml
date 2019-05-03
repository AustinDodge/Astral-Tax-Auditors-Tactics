actionmode = 0//0 is use consumable, 1 is use trap, 2 is give item, 3 is discard item
findingtarget = 0//if the player is currently selecting a target unit or tile
ptargetunit = 0//the possible target unit under the cursor
ptargettile = 0//the possible target tile under the cursor
startunit = 0//the unit that was holding the item at creation
cursorbounce = 0//the image index of spunitselect cursor
pitem = 0//the item that's being considered

useconsumestring = "Right-click the unit you want to use this item on"
usetrapstring = "Right-click the tile you want to use this item on"
giveitemstring = "Right-click the unit you want to give this item to"
discarditemstring = "Right-click the tile you want to discard this item to"
itemdone = 0//if oItemControl should be destroyed
endunit = 0//if the unit's turn should be ended when the item is over
endanim = 1//if the unit's animation should be manually changed on destruction

itemtype = 0//0 if item is item, 1 if item is weapon, 2 if item is armor

throwingitem = 0//if an item is currently being thrown
ptargettile = 0

alarm[0] = 2

