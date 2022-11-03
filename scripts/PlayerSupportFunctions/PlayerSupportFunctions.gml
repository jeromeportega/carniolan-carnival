// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function shoot(spd, dir) {
	var bullet = instance_create_layer(x, y, "Instances", Bullet);
	with (bullet) {
		speed = spd;
		direction = dir;
		image_angle = dir;
	}
}


function handlePlayerShooting(spd, dir) {
	if (shootCD == 0) {
		shoot(spd, dir);
		shootCD = FIRERATE;
	}
	else {
		shootCD = max(0, shootCD-1);
	
	}
}

function boundPlayerWithinBuffer() {
	if (x < global.HORIZONTAL_BUFFER) x = global.HORIZONTAL_BUFFER;
	else if (x > room_width - global.HORIZONTAL_BUFFER) x = room_width - global.HORIZONTAL_BUFFER;
}


function getRandomAmplitude(time) {
	var sum = 0;
	for (var i = 0; i < ds_list_size(oscilateCoeffs); i++) {
		if (i % 2 == 0) sum += ds_list_find_value(oscilateCoeffs, i) * dsin((time * ds_list_find_value(oscilateFreqs, i)) + ds_list_find_value(oscilatePhases, i));
		else sum += ds_list_find_value(oscilateCoeffs, i) * dcos((time * ds_list_find_value(oscilateFreqs, i)) + ds_list_find_value(oscilatePhases, i));
	}
	
	return sum;
}


function configurePlayerShader() {
	if (playerState == playerStates.respawning)
	{
		shader_set(respawnBlink);
		var shader_params = shader_get_uniform(respawnBlink, "mask");
		var a = (dsin((flashFrequency*flashDamping*global.respawnTIME/((flashDamping+1+flashBias)*global.respawnTIME - stateDuration))*(2*global.FRAMERATE - stateDuration))+1)/2;
		shader_set_uniform_f(shader_params, a);
	}
	else if (playerState == playerStates.invincible)
	{
		shader_set(invinceBlink);
		var shader_params = shader_get_uniform(respawnBlink, "mask");
		var a = (dsin((invFlashFrequency*invFlashDamping*global.invincibleTIME/((invFlashDamping+1+invFlashBias)*global.invincibleTIME - stateDuration))*(2*global.FRAMERATE - stateDuration))+1)/2;
		shader_set_uniform_f(shader_params, a);
	}
	else shader_reset();
}

function handlePlayerMovement() {
	hspeed = sign(targetX - x)*maxHSpeed*(min(room_width/10, abs(targetX - x))/(room_width/10));
	if (abs(hspeed) > abs(targetX - x)) hspeed = sign(hspeed)*abs(targetX - x);
}