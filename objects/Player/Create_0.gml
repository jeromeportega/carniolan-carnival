/// @description Insert description here
// You can write your code in this editor


playerState = playerStates.normal;

maxHSpeed = 5;


//Shooting variables
FIRERATE = global.FRAMERATE/2; //Shots per second
shootCD = 0;


//Spawn the player at the horizontal center of the screen and the vertical center of its vertical boundaries
x = room_width/2;
y = (global.UPPER_BOUND + global.LOWER_BOUND) /2;


function modulateInputs (input) {
	return input;
}

