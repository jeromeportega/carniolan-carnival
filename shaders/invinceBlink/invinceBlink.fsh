//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float mask;

void main()
{
    gl_FragColor =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4((1.0 - mask)*gl_FragColor.r, (1.0 - mask)*gl_FragColor.g, mask-(mask - 1.0)*gl_FragColor.b, gl_FragColor.a*((2.0 - mask)/2.0));
}
