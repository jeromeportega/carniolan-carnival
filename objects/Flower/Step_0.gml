 /// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	vspeed = 0
	exit
}

vspeed = global.pace;
if (hpValue <= 0) instance_destroy(id, true);
image_angle += rotSpeed;



if (y >= deletionBoundary) instance_destroy(id, false);

