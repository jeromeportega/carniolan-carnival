//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float mask; //Uniform for passing in a time component

void main()
{
    gl_FragColor =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ); //Default shader, FragColor now IS the sprite textureMap
	
	//Performa multiplicative image blend to hue shift the sprite blue by mask. Then oscilate aplha between original aplha and half that value by mask
	//Understand this is by pixel in the textureMap
	gl_FragColor = vec4((1.0 - mask)*gl_FragColor.r, (1.0 - mask)*gl_FragColor.g, mask-(mask - 1.0)*gl_FragColor.b, gl_FragColor.a*((2.0 - mask)/2.0));
}
