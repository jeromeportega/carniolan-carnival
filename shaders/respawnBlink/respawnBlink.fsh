//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float mask;

void main()
{
    gl_FragColor = vec4(1.0, 0.0, 0.0, mask) * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
