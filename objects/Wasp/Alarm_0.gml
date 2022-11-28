/// @description Fire boss bullets
// You can write your code in this editor
if (global.isPaused) {
	alarm[0]++
	exit
}


// Triple spread shot
var xShift =  x + 3*125.5*dcos(-59.35 + image_angle);
var yShift = y - 3*125.5*dsin(-59.35 + image_angle);
var spread = 250;

instance_create_layer(xShift, yShift, "Instances", EnemyBullet, {
	direction: point_direction(xShift, yShift, Player.x, Player.y),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: 90 + point_direction(xShift, yShift, Player.x, Player.y)
});
instance_create_layer(xShift, yShift, "Instances", EnemyBullet, {
	direction: point_direction(xShift, yShift, Player.x+spread, Player.y+spread),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: 90 + point_direction(xShift, yShift, Player.x, Player.y)
});
instance_create_layer(xShift, yShift, "Instances", EnemyBullet, {
	direction: point_direction(xShift, yShift, Player.x-spread, Player.y-spread),
	speed: 6 * global.pace/global.MINPACE,
	image_angle: 90 + point_direction(xShift, yShift, Player.x, Player.y)
});

alarm[0] = room_speed * 3/(global.pace/global.MINPACE);
