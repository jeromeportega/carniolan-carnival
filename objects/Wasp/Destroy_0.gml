/// @description Insert description here
// You can write your code in this editor


global.gameState = 0;
global.bossCD = global.__BOSSSPAWNRATE

for (var i = 0; i < 20; i++) {
	var honey = instance_create_layer(x, y, "Instances", Honey);
	
	honey.hspeed = random_range(-8, 8)
}
