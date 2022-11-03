/// @description Insert description here
// You can write your code in this editor
hpValue = round(random_range(1,5));
size = hpValue/3;
deletionBoundary = room_height + 6*256;  //this number is six times the width of the sprite
honeyChance = 0.8; //honeyChance and mit8Chance will be global variables
miteChance = 0.1;

shouldSpawnGoodies  = true; //Used to track how the Flower was destroyed

image_xscale = size;
image_yscale = size;
randomize(); //for testing only





