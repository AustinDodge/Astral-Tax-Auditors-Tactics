/// @description sStartGNoise(width,height,shapedensity,scale,iterations,fcol,bcol)
/// @param width
/// @param height
/// @param shapedensity
/// @param scale
/// @param iterations
/// @param fcol
/// @param bcol
/*Creates a gnoise generator at the specified spot. Returns the ID of the generator
*/
var vnoise,vheight,vwidth,vdensity,vratio,viterations,fcol,bcol;

vwidth = argument0
vheight = argument1
vdensity = argument2
vratio = argument3
viterations = argument4
fcol = argument5
bcol = argument6

vnoise = instance_create(0,0,oGNoiseGenerator)
vnoise.multiplescale = vratio
vnoise.shapedensity = vdensity
vnoise.width = vwidth
vnoise.height = vheight
vnoise.iterations = viterations

vnoise.forecol = fcol
vnoise.backcol = bcol

with vnoise{
    event_perform(ev_other,ev_user0)//init
    }

    
return vnoise;
