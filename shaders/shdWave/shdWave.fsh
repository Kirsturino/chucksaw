//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform float frequency;
uniform float intensity;

void main()
{
	//This makes the effect less intense on lower y coordinates
	//vec2 Coord = v_vTexcoord + vec2(cos(v_vTexcoord.y*frequency + time*6.2831)/intensity,0)*(1.0-v_vTexcoord.y);
	
	vec2 Coord = v_vTexcoord + vec2(cos(v_vTexcoord.y*frequency + time*6.2831)/intensity,0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord );
}
