/// @description Fire boss bullets
// You can write your code in this editor
if (global.isPaused) {
	alarm[0]++
	exit
}

// Triple spread shot
instance_create_layer(x+140, y+150, "Instances", EnemyBullet, {
	direction: point_direction(x, y, Player.x, Player.y),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: direction
});
instance_create_layer(x+140, y+150, "Instances", EnemyBullet, {
	direction: point_direction(x, y, Player.x+180, Player.y+180),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: direction
});
instance_create_layer(x+140, y+150, "Instances", EnemyBullet, {
	direction: point_direction(x, y, Player.x-180, Player.y-180),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: direction
});

alarm[0] = room_speed;