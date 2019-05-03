instance_create(x,y,oIMouseControl)
instance_create(0,0,oCamera)
instance_create(10,-80,oDrawMainMenu)

canmovecamera = 1
//center camera
oCamera.x = round(camrealwidth/2)
oCamera.y = round(camrealheight/2)

oDrawMainMenu.xhalf = round(camrealwidth/2)
oDrawMainMenu.yhalf = round(camrealheight/2)

x = __view_get( e__VW.XView, 0 )
y = __view_get( e__VW.YView, 0 )

sMakeMainMenuTop()



