/// @description Insert description here
// You can write your code in this editor

var szs = [.75, 1, 1.25];
var pos = irandom_range(0, 2);
size = szs[pos];
hpValue = (1+pos)*round(1+(global.pace/global.MINPACE - 1)/4);//base*scal;
deletionBoundary = room_height + 6*256;  //this number is six times the width of the sprite
honeyChance = 0.8; //honeyChance and mit8Chance will be global variables
miteChance = 0.1*(1 + global.pace/global.MAXPACE);

shouldSpawnGoodies  = true; //Used to track how the Flower was destroyed
rotSpeed = random_range(-1,1);

image_index = irandom_range(0, image_number);
image_speed = 0;

image_xscale = size;
image_yscale = size;
randomize(); //for testing only





