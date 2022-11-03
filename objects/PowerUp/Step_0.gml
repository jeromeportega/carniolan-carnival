/// @description Insert description here
// You can write your code in this editor

image_angle += rotationSpeed; //This causes the icon to rotate by rotSpeed degrees per frame

//Destroy if we go off screen
if (y > room_height + 128) instance_destroy(id, false);


