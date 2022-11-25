/// @description Insert description here
// You can write your code in this editor

homing = true; //Used as a flag to stop tracking the player

//How long the mites will track the player, scaling with game pace
homingDuration = global.FRAMERATE*1.25 / (global.pace/global.MINPACE); //.5s - (MAXPACE/MINPACE/2)s
deletionBoundary = 128; //Distance off screen to delete

