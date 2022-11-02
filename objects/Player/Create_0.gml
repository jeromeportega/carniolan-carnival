/// @description Insert description here
// You can write your code in this editor


playerState = playerStates.normal;

//Movement variables
maxHSpeed = 5;
maxHAccel = 1;
playerXInput = 0;


//Used for debugging info
insDebug1 = 0;
insDebug2 = 0;

//Shooting variables
FIRERATE = global.FRAMERATE/2; //Shots per second
shootCD = 0;



//Spawn the player at the horizontal center of the screen and the vertical center of its vertical boundaries
x = room_width/2;
y = (global.UPPER_BOUND + global.LOWER_BOUND) /2;


function modulateInputs (input) {
	input = 2 * input/room_width;
	input = 1.2 * max(-1, min(input, 1));
	return -input;
}

function shoot(spd, dir) {
	var bullet = instance_create_layer(x, y, "Instances", Bullet);
	with (bullet) {
		speed = spd;
		direction = dir;
		image_angle = dir;
	}
}

