/// @description Insert description here
// You can write your code in this editor
var bullet0 = instance_create_layer(x+140, y+150, "Instances", EnemyBullet);
var bullet1 = instance_create_layer(x+140, y+150, "Instances", EnemyBullet);
var bullet2 = instance_create_layer(x+140, y+150, "Instances", EnemyBullet);
with (bullet0)
{
   direction = point_direction(x, y, Player.x, Player.y);
   speed = 6;
   image_angle = direction
}
with (bullet1)
{
   direction = point_direction(x, y, Player.x+90, Player.y+90);
   speed = 6;
   image_angle = direction
}
with (bullet2)
{
   direction = point_direction(x, y, Player.x-90, Player.y-90);
   speed = 6;
   image_angle = direction
}
alarm[0] = room_speed;