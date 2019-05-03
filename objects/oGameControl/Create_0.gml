globalvar worldseed,playerunitlist,premadepercentlist,nosavescumming,pausemove,fallfadesteps,
mnamelist,fnamelist,sunit,playerturn,turnstillnemesis,nemesisonmap,nemesistype,lightcirclesides,
globalnoaimode,playermoney,tilemovespeed,musicon,soundeffectson,globalmusicvolume,globaleffectsvolume,
;

//window_set_position(window_get_x()+15,window_get_y())
randomize()
//random_set_seed(1767533280)//tram shadow test room
//random_set_seed(128386479)//set this to test specific issues
worldseed = random_get_seed()

fallfadesteps = 6//how many steps of animation there are in fading a unit to black when
//falling down a pit

turnstillnemesis = 7//the number of turns until the nemesis enters the level
tilemovespeed = 12//the number of steps it takes a unit to move from one tile to another
nemesisonmap = 0//if the nemesis is currently placed on the map
nemesistype = 0//for now only 0= Ocsula
playermoney = 2000//the amount of cash the player currently has

globalnoaimode = 0
//globalnoaimode = 1

sInitSurfaceVariables()


pausemove = 0

nosavescumming = 1
premadepercentlist = ds_list_create()//the list of percent values that combat determinations
for(i = 0;i < 100; i += 1){//are drawn from
    ds_list_add(premadepercentlist,irandom(99))
    }

if !shaders_are_supported(){
    show_message("No shaders! Unfortunately this game will not run on your system.")
    }
pal_swap_init_system(shd_pal_swapper,0)

mnamelist = -1
fnamelist = -1
playerunitlist = ds_list_create()

sunit = -1
playerturn = 1

lightcirclesides = 16//the number of sides in a "circle" drawn for lighting.

globalvar uni_lightprhandle,uni_lightfluxhandle;
uni_lightprhandle = shader_get_uniform(shader_DrawFadeCircle,"u_fLightPositionRadius")
uni_lightfluxhandle = shader_get_uniform(shader_DrawFadeCircle,"u_FluxAmount")


gameispaused = 0


if !instance_exists(oCamera){
    instance_create(x,y,oCamera)
    }else{
    sCameraChangeResolution(oCamera.wreal,oCamera.hreal,window_get_fullscreen())
    }
if !instance_exists(oIMouseControl){
    instance_create(x,y,oIMouseControl)
    }
instance_create(x,y,oIntControl)
instance_create(x,y,oMapControl)
instance_create(x,y,oIconControl)
instance_create(x,y,oLightingControl)
instance_create(x,y,oToolTipControl)

instance_create(x,y,oPlayerControl)
//instance_create(x,y,oUnitWindow)
instance_create(x,y,oDisplayControl)
draw_set_font(fontAuditorShadow)

musicon = 1
soundeffectson = 1
if musicon = 0{
    globalmusicvolume = 0
    }
if soundeffectson = 0{
    globaleffectsvolume = 0
    }

instance_create(x,y,oSoundControl)

takescreenshot = 0
takevid = 0





