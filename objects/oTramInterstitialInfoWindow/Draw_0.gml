var vx,vy,vwidth,vactions;

if instance_exists(oElevatorInterstitialControl){
    vactions = oElevatorInterstitialControl.maxactions - oElevatorInterstitialControl.actionsused
    }else{
    vactions = -1
    }

draw_set_color(windowcolor)
draw_set_alpha(0.78)
draw_rectangle(x,y,x+wwidth,y+wheight,0)


draw_set_color(c_white)
draw_set_alpha(1)
vx = x+10
vy = y+10
vwidth = sDrawTextPixelFont(vx,vy,c_white,"Use ")
vx += vwidth+6
vwidth = sDrawTextAuditorFont(vx,vy,c_white,c_red,string(vactions))
vx += vwidth
sDrawTextPixelFont(vx,vy,c_white," more actions")

