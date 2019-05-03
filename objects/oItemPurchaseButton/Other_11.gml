var vreason;

myprice = sGetItemInfo(itemnumber,7)

vreason = 0//the reason the item can't be purchased.
//0 = no room in inventory, 1 = insufficient funds.

canbeclicked = 0
if ds_list_size(myunit.inventorylist) < myunit.inventoryslots{
    //if the unit has free inventory slots, the item can always be purchased
    canbeclicked = 1
    }

    
if itemtype = 2{
    //if the item is a weapon, it can also be taken if the unit doesn't have a weapon equipped
    if myunit.myweapon <= 0{//if the unit has no weapon equipped
        canbeclicked = 1
        }
    }
if itemtype = 3{
    //if the item is armor, it can be taken if the unit doesn't have armor equipped
    if myunit.myarmor <= 0{
        canbeclicked = 1
        }
    }    
//now we know if the unit can take the item. Check if the player has enough money.

if myprice > playermoney{
    canbeclicked = 0
    vreason = 1
    }
//Grey it out if it cannot be taken.
if canbeclicked = 1{
    blendcolor = c_white
    }else{
    blendcolor = c_gray
    }

image_blend = blendcolor

//determine description string
var vname,vdesc,vhit,vdam,vrange,vtype,vknock,vbreak;

vname = sGetItemInfo(itemnumber,1)

vdesc = sGetItemDescription(itemnumber)
vbreak = @"
"
mystring = vname
mystring += "       $"+string(myprice)
mystring += vbreak
if canbeclicked = 0{
    switch vreason{
        case 0: mystring += "No room in inventory!"; break;
        case 1: mystring += "Insufficient funds!"; break;
        }
    mystring += vbreak
    }
mystring += vdesc
mystring += vbreak

if itemtype = 2{//if the item is a weapon
    sGetWeaponStats(itemnumber)
    vdam = "DAM: "+string(attackstrength)
    if damagescaleswith > 0{
        switch damagescaleswith{
            case 1: vdam += "+STR"; break;
            case 2: vdam += "+SKL"; break;
            }
        }
    if attackminrange > 0{
        vrange = "RANGE: "+string(attackminrange)+"-"+string(attackrange)
        }else{
        vrange = "RANGE: "+string(attackrange)
        }
    vhit = "HIT: "+string(accuracybonus)
    switch damagetype{
        case 0: vtype = "TYPE: KINETIC"; break;
        case 1: vtype = "TYPE: TECH"; break;
        case 2: vtype = "TYPE: ELDRITCH"; break;
        }
    if knockdist > 0{
        vknock = "KNOCK: "+string(knockdist)+" TILES"
        }else{
        vknock = "KNOCK: -"
        }
    mystring += vdam + "    " + vrange + "    " + vhit
    mystring += vbreak
    mystring += vtype + "   " + vknock
    }

tipwidth = 200//width of the tooptip in pixels
draw_set_font(fontSmallPixel)
tipsep = string_height(string_hash_to_newline("L"))//the number of pixels between lines
tipheight = sGetTextPixelFontHeight(mystring,tipsep,tipwidth)
tipborder = 3//the number of pixels for the border
tipheight += tipborder*2//add border



















