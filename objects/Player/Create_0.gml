/// @description Insert description here
// You can write your code in this editor


//Movement variables
maxHSpeed = 10; //Max speed the player can move in normal state
targetX = room_width/2; //Target location for movement starts middle screen


//Used for debugging info
insDebug1 = 0;
insDebug2 = 0;

//Shooting variables
__NORMAL_FIRERATE = global.FRAMERATE/1.5
FIRERATE = __NORMAL_FIRERATE; //Shots per second
shootCD = 0; //To flag to shoot
spdMult = 1; //To adjust bullet speed

//To time temporary states to return to normal.
stateDuration = 0;

//For infected state
oscilateCoeffs = ds_list_create();
oscilateFreqs = ds_list_create();
oscilatePhases = ds_list_create();

//for Respawn state to vary the speed of the flashing, and its decay rate
flashFrequency = 36;
flashDamping = 3;
flashBias = .25;

//For invince state to vary the speed of the flashing, and its decay rate
invFlashFrequency = 15;
invFlashDamping = 30;
invFlashBias = 0;

//For Spraying state
rateIncrease = 5; //The factor of increase in firerate during rapidFire
spread = 13; //The half angle of spread during rapid fire, 10 means a 20 degree total spread centered around 90 (Up)

playerState = playerStates.normal;
//setState(playerStates.infected); //For testing stateMachine

//Spawn the player at the horizontal center of the screen and the vertical center of its vertical boundaries
x = room_width/2;
y = (global.UPPER_BOUND + global.LOWER_BOUND) /2;



