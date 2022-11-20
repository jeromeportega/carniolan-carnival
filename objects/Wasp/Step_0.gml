/// @description Boss Movement
// You can write your code in this editor
if (global.isPaused) {
	speed = 0
	exit
}

wasp_movement(5 * global.pace/global.MINPACE,5);
image_angle = point_direction(x, y, Player.x, Player.y) + 90;
