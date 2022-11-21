/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	exit
}

//Disallows player form going to close to the edge of the screen
//Is in end step to ensure it is called after hspeed is applied.
boundPlayerWithinBuffer();

