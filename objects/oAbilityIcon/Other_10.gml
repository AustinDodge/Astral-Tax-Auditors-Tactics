sprite_index = sAbilityFindIcon(abilitynum)

gx = x - oUnitStatsWindow.x//x relationship to oUnitStatsWindow
gy = y - oUnitStatsWindow.y//y relationship to oUnitStatsWindow

depth = oUnitStatsWindow.depth-1

tipstring = sAbilityFindTooltip(abilitynum)
namestring = sAbilityFindNameString(abilitynum)
tipwidth = 200//width of the tooptip in pixels
draw_set_font(fontSmallPixel)
tipsep = string_height(string_hash_to_newline("L"))//the number of pixels between lines
tipstring = namestring + @"
" + tipstring
tipheight = sGetTextPixelFontHeight(tipstring,tipsep,tipwidth)
tipborder = 3//the number of pixels for the border
tipheight += tipborder*2//add border

tipx = x+12
tipy = y+12

if tipy+tipheight > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ){
    while tipy+tipheight > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ){
        tipy -= 10
        }
    }
    
tipx -= x
tipy -= y

mydepth = depth



