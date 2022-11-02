/// @description Insert description here
// You can write your code in this editor



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

//For infected state
infectedDuration = 0;
oscilateCoeffs = ds_list_create();
oscilateFreqs = ds_list_create();
oscilatePhases = ds_list_create();

playerState = playerStates.normal;
setState(playerStates.infected);

//Spawn the player at the horizontal center of the screen and the vertical center of its vertical boundaries
x = room_width/2;
y = (global.UPPER_BOUND + global.LOWER_BOUND) /2;



