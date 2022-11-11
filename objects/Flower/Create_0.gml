/// @description Insert description here
// You can write your code in this editor
var low = 1
var high = 5
var scal = floor(1 + (global.pace/global.MINPACE)/4);
var base = round(irandom_range(1,5));
hpValue = base*scal;
size = (.6 + .6*((base/((high+low)/2)) - (low/((high+low)/2)))/((high/((high+low)/2)) - (low/((high+low)/2))));
deletionBoundary = room_height + 6*256;  //this number is six times the width of the sprite
honeyChance = 0.8; //honeyChance and mit8Chance will be global variables
miteChance = 0.1*(1 + global.pace/global.MAXPACE);

shouldSpawnGoodies  = true; //Used to track how the Flower was destroyed

image_xscale = size;
image_yscale = size;
randomize(); //for testing only





