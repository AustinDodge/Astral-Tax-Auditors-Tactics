varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform float time;
//uniform vec2 mouse_pos;
//uniform vec2 resolution;
//uniform float brightness_amount;
//uniform float contrast_amount;

uniform float gamma;
uniform float numColors;

/*We have two functions in the shader that turn the color to HSV and back, letting us just
limit the value part rather than all the color information. This will give us a nice stepped
brightness without modifying the color!
*/
vec3 rgb2hsv( in vec3 c ){
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), 
                 vec4(c.gb, K.xy), 
                 step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), 
                 vec4(c.r, p.yzx), 
                 step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), 
                d / (q.x + e), 
                q.x);
}

//  Function from Iñigo Quiles 
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsv2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0, 
                     0.0, 
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}

void main()
{ 

//float gamma = 0.8; // 0.6
//float numColors = 9.0; // 8.0
    
    //get the value part of the color
    vec3 col = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
    vec3 colmod = rgb2hsv(col);
    
    //limit the value
    float value = colmod.b;
    value = value*numColors;
    value = floor(value);
    value = value/numColors;
    value = pow(abs(value), (1.0/gamma));
    
    //value = floor(value);
    //value = value/numColors;
    colmod.b = value;
    //turn the HSV back to RGB
    col = hsv2rgb(colmod);
    //draw it
    //gl_FragColor = vec4(col, texture2D(gm_BaseTexture, v_vTexcoord).a);
    gl_FragColor = vec4(col,1.0);
    
    //col = pow(abs(col), vec3(gamma, gamma, gamma));
    /*col = col * numColors;
    col = floor(col);
    col = col / numColors;
    col = pow(abs(col), vec3(1.0/gamma));
    gl_FragColor = vec4(col, texture2D(gm_BaseTexture, v_vTexcoord).a);*/
  
}
























