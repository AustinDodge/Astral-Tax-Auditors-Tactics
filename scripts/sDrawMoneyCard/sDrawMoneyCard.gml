/// @description sDrawMoneyCard(ymod)
/// @param ymod
/*Draws the interface element that displays the amount of money the player currently has.
ymod is the amount that the card should be retracted vertically by, so it can be pulled
away from the screen.
*/

var vx,vy,vmod;

vmod = argument0

vx = __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )
vx -= sprite_get_width(spmoneycard)
vy = __view_get( e__VW.YView, 0 )
my -= vmod

draw_sprite(spmoneycard,0,vx,vy)
vx += 12
vy += 3
sDrawTextPixelFont(vx,vy,c_white,string(playermoney))
