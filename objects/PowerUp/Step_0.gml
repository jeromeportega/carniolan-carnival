/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	speed = 0
	exit
} else {
	speed = unpause_speed
}

image_angle += rotationSpeed*(global.pace/global.MINPACE); //This causes the icon to rotate by rotSpeed degrees per frame

//Destroy if we go off screen
if (y > room_height + 128) instance_destroy(id, false);