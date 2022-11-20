/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	speed = 0
	exit
}

//Calls the appropriate version of code for the current state
//Keeps this event cleaner
executePlayerState(playerState);
