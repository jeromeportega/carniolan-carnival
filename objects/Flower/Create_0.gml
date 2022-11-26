/// @description Insert description here
// You can write your code in this editor
var low = 1
var high = 5
var scal = floor(1 + (global.pace/global.MINPACE)/4);
var base = round(irandom_range(1,5));
var szs = [.75, 1, 1.25];
var pos = irandom_range(0, 2);
size = szs[pos];
hpValue = (1+pos)*(1 + round(global.pace/global.MAXPACE/2 - .5));//base*scal;
//size = (.6 + .6*((base/((high+low)/2)) - (low/((high+low)/2)))/((high/((high+low)/2)) - (low/((high+low)/2))));
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





