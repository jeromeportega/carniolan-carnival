/// @description Insert description here
// You can write your code in this editor

//If this collision should be allowed to spawn Honey/Mites
if(shouldSpawnGoodies) {
	instance_create_layer(x,y, "Instances", Honey);
	if (random_range(0,1) <= honeyChance) instance_create_layer(x,y, "Instances", Honey);
	if (random_range(0,1) <= miteChance) instance_create_layer(x,y, "Instances", Mites);
}
