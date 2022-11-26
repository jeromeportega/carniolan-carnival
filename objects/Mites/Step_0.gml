/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	speed = 0
	exit
}

time += 1;

//If we are homing and player exists, then adjust direction to chase player
if (homing && instance_exists(Player)) {
	//Move directly towards the player
	move_towards_point(Player.x, Player.y, global.pace);
	image_angle = direction - 90;
	homingDuration--;
	if (homingDuration <= 0) homing = false; //Cancel homing after duration
}
else {
	speed = global.pace;
}


//If we go off screen destroy

if (x < -deletionBoundary || x > room_width + deletionBoundary || y < - deletionBoundary || y > room_height + deletionBoundary) instance_destroy(id, false);

