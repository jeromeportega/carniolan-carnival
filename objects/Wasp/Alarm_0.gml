/// @description Fire boss bullets
// You can write your code in this editor
var bullet0 = instance_create_layer(x+140, y+150, "Instances", EnemyBullet);
var bullet1 = instance_create_layer(x+140, y+150, "Instances", EnemyBullet);
var bullet2 = instance_create_layer(x+140, y+150, "Instances", EnemyBullet);

var spread = 250;

with (bullet0)
{
   direction = point_direction(x, y, Player.x, Player.y);
   speed = 6 * global.pace/global.MINPACE;
   image_angle = direction
}
with (bullet1)
{
   direction = point_direction(x, y, Player.x+spread, Player.y+spread);
   speed = 6 * global.pace/global.MINPACE;
   image_angle = direction
}
with (bullet2)
{
   direction = point_direction(x, y, Player.x-spread, Player.y-spread);
   speed = 6 * global.pace/global.MINPACE;
   image_angle = direction
}
alarm[0] = room_speed * 4/(global.pace/global.MINPACE);