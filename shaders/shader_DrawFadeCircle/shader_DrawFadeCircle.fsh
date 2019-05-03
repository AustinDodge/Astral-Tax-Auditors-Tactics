//
/*Now we're going to mess with this shader - instead of drawing black eveywhere on the screen and now drawing when we're close enough to the light,
we're going to to draw black on all pixels close enough to the light source and if they're too far away, just draw them normally.
*/
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 v_vScreenPos;

uniform vec4 u_fLightPositionRadius; //x = lightx, y = lighty, z = light radius, w = "pure" radius

uniform float u_FluxAmount; //the amount to fluctuate the distance by

void main()
    {
    
    
    //in_Position represents the ROOM POSITION of the pixel currently being drawn. It's passed from the vertex shader as
    //v_vScreenPos. Which is weird, as that makes you think that it's the screen position that's being checked, rather than
    //the room position, but whatever.
    //vec2 vect = vec2(v_vScreenPos.xy - u_fLightPositionRadius.xy);
    //so this vector is the difference between the position of the pixel currently being drawn and the position of the light center.
    
    //Now drop some pythagoras on that fool and we'll get the actual distance between the pixel being drawn and the light!
    //float dist = sqrt((vect.x*vect.x) + (vect.y*vect.y));
    
    //GLSL also has a function that does that built-in. Everything above this line is unnecessary, but it was a good learning exercise!
    float dist = distance(v_vScreenPos.xy,u_fLightPositionRadius.xy);
    dist *= u_FluxAmount;
    
    //last thing to do is check if the distance is too far. If it is,draw black, otherwise, draw the pixel's start color.
    if (dist < u_fLightPositionRadius.z){
        //check if the pixel is within the "pure" radius
        if (dist < u_fLightPositionRadius.w){
            //draw pure light color
            //gl_FragColor = vec4(1.0,1.0,1.0,1.0);
            gl_FragColor = v_vColour;
            }else{
            //get the distance between the "pure" border and the total border
            float fdist = dist - u_fLightPositionRadius.w;
            fdist *= u_FluxAmount;
            float pdist = u_fLightPositionRadius.z - u_fLightPositionRadius.w;
            pdist *= u_FluxAmount;
            //convert the distance between the pure border and real border to a value between 0-1, 0 being on, 1 being at the border.
            float falloff = fdist/pdist;
            
            //now get the "regular" color that should be drawn
            gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//this just means "draw the color you started with"
            
            
            //and mix that color with the shadow color.
            gl_FragColor = mix( v_vColour, gl_FragColor, falloff);
            }
        
        }else{
        //if it isn't, draw the usual color.
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//this just means "draw the color you started with"
        
        //it'll throw an error if values in a vec aren't floats.
        }
    }

