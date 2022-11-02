// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function modulateInputs (input) {
	input = 2 * input/room_width;
	input = 1.2 * max(-1, min(input, 1));
	return -input;
}

function shoot(spd, dir) {
	var bullet = instance_create_layer(x, y, "Instances", Bullet);
	with (bullet) {
		speed = spd;
		direction = dir;
		image_angle = dir;
	}
}


function handlePlayerShooting() {
	if (shootCD == 0) {
		shoot(2 * global.pace, 90);
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




