shadowsurface = surface_create(camrealwidth,camrealheight)
drawsurface = surface_create(camrealwidth,camrealheight)
shadowalpha = 0.4
color1 = make_color_hsv(170,60,225)

uni_gammahandle = shader_get_uniform(shade_ColorLimit,"gamma")
//uni_gammahandle = shader_get_uniform(shade_ValueLimit,"gamma")
uni_numcolorshandle = shader_get_uniform(shade_ColorLimit, "numColors")
//uni_numcolorshandle = shader_get_uniform(shade_ValueLimit, "numColors")

gamma = 0.8
numcolors = 9.3

