//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float mask;

void main()
{
	//Default shader is being multiblie by a solid red channel with alpha varrying by mask. This turns the sprite red
	//And changes its opacity in real time.
    gl_FragColor = vec4(1.0, 0.0, 0.0, mask) * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
