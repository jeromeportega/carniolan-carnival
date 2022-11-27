/// @description Fire boss bullets
// You can write your code in this editor
if (global.isPaused) {
	alarm[0]++
	exit
}


// Triple spread shot
var xShift =  x + image_xscale*dcos(image_angle)*128/2;
var yShift = y - image_yscale*dsin(-45 + image_angle)*108;
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
	image_angle: 90 + point_direction(x, yShift, Player.x, Player.y)
});

alarm[0] = room_speed * 3/(global.pace/global.MINPACE);
