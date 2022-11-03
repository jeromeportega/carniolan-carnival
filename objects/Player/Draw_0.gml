/// @description Insert description here
// You can write your code in this editor

if (playerState == playerStates.respawning)
{
	shader_set(respawnBlink);
	var shader_params = shader_get_uniform(respawnBlink, "mask");
	var a = (dsin((flashFrequency*flashDamping*global.respawnTIME/((flashDamping+1+flashBias)*global.respawnTIME - stateDuration))*(2*global.FRAMERATE - stateDuration))+1)/2;
	shader_set_uniform_f(shader_params, 1.0, 0.0, 0.0, a);
}

draw_self();
shader_reset();
//Drawing debug info for movement
draw_text(room_width/2, 100, string(playerState));


