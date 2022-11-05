/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < 20; i++) {
	var honey = instance_create_layer(x, y, "Instances", Honey);
	
	honey.hspeed = random_range(-8, 8)
}
