/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	speed = 0
} else {
	speed = unpause_speed
}

if (y <= deletionBoundary) instance_destroy(id, false);
if (x <= -128) instance_destroy(id, false);
else if (x >= room_width + 128) instance_destroy(id, false);
