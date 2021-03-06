varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform float time;
//uniform vec2 mouse_pos;
//uniform vec2 resolution;
//uniform float brightness_amount;
//uniform float contrast_amount;

uniform float gamma;
uniform float numColors;

void main()
{ 

//float gamma = 0.8; // 0.6
//float numColors = 9.0; // 8.0

  
  vec3 col = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
  //col = pow(abs(col), vec3(gamma, gamma, gamma));
  col = col * numColors;
  col = floor(col);
  col = col / numColors;
  col = pow(abs(col), vec3(1.0/gamma));
  gl_FragColor = vec4(col, texture2D(gm_BaseTexture, v_vTexcoord).a);
  
}
