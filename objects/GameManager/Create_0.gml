/// @description Insert description here
// You can write your code in this editor

//Global constants
global.FRAMERATE = 60;
global.MAXPACE = 15;
global.MINPACE  = 5;

//Define the boundary the player object can move within
global.HORIZONTAL_BUFFER = 34;
global.LOWER_BOUND = room_height - 128;
global.UPPER_BOUND = room_height - 2 * 128;

//Global variables
global.pace = global.MINPACE;
global.lives = 3;
global.score = 0;
global.distance = 0;

global.isPaused = false;

global.infectedTIME = global.FRAMERATE * 30; // Three second infection at start;

//Enums go here to be run once
enum playerStates {
	normal,
	infected,
	respawning,
	invincible
}


//SetUp



