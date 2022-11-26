/// @description Fire boss bullets
// You can write your code in this editor
if (global.isPaused) {
	alarm[0]++
	exit
}

var spread = 250;
// Triple spread shot
instance_create_layer(x+140, y+150, "Instances", EnemyBullet, {
	direction: point_direction(x, y, Player.x, Player.y),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: direction+90
});
instance_create_layer(x+140, y+150, "Instances", EnemyBullet, {
	direction: point_direction(x, y, Player.x+spread, Player.y+spread),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: direction+90
});
instance_create_layer(x+140, y+150, "Instances", EnemyBullet, {
	direction: point_direction(x, y, Player.x-spread, Player.y-spread),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: direction+90
});

alarm[0] = room_speed * 4/(global.pace/global.MINPACE);
