/// @description Insert description here
// You can write your code in this editor

randomize();
factsFile = file_text_open_read("beefacts.json");
facts = file_text_read_string(factsFile);
file_text_close(factsFile);
facts = json_parse(facts).BeeFacts;

factsList = ds_list_create();

for (var i = 0; i < array_length(facts); i++) {
	ds_list_add(factsList, facts[i]);
}


//Debug related
global.debug = false;
global.debugToggle1 = false;
global.debugToggle2 = false;
lastFrame = 0;
currFrame = current_time;
trackPos = 0;
last5FPS = [60, 60, 60, 60, 60]

//Global constants
global.FRAMERATE = 60;
global.MAXPACE = 30;
global.MINPACE  = 5;
global.bckgrnd = 1;

__factCD = global.FRAMERATE*10;
factCD = __factCD;
factPos = 0; 

//Define the boundary the player object can move within
global.HORIZONTAL_BUFFER = 34;
global.LOWER_BOUND = room_height - 256;
global.UPPER_BOUND = room_height - 2 * 256;

//State vars
pointsPerSec = 100
global.gameState = 0;
global.__BOSSSPAWNRATE = global.FRAMERATE * 60 * 1.5;
global.bossCD = global.__BOSSSPAWNRATE;
paceSlope = (global.MAXPACE - global.MINPACE)/(pointsPerSec*60*10); // Reach max diff in 10 minutes

//Global variables
global.pace = global.MINPACE;
global.lives = 3;
global.score = 0;
global.distance = 0;

global.isPaused = false;
global.gameOver = false;

global.infectedTIME = global.FRAMERATE * 3; // Ten second infection at start;
global.respawnTIME = global.FRAMERATE *1;
global.invincibleTIME = global.FRAMERATE * 5;
global.sprayingTIME = global.FRAMERATE * 3;

//For spawning powerUps and initial powerUp
nextPowerUp = instance_create_layer(x,y,"Instances", PowerUp);
global.nextPowerUpType = nextPowerUp.powerType;
instance_deactivate_object(nextPowerUp);
POWER_UP_SPAWNRATE = global.FRAMERATE * 45; //For testing 10 is aggressive
powerUpCD = POWER_UP_SPAWNRATE;
FLOWER_SPAWNRATE = global.FRAMERATE * 1.4; //For testing 10 is aggressive
flowerCD = FLOWER_SPAWNRATE


//Enums go here to be run once
enum playerStates {
	normal,
	infected,
	respawning,
	invincible,
	rapidfire
}

enum powerUps {
	shield,
	rapid	
}

//Resets the relevant variables to starta new game, and clears the gameRoom of all unimportant objects
function restartGame(){
	global.pace = global.MINPACE;
	global.lives = 3;
	global.score = 0;
	global.distance = 0;
	global.gameOver = false;
	global.gameState = 0;
	global.bossCD = global.__BOSSSPAWNRATE;
	global.bckgrnd = 5;
	//Ad stuff
	global.numRevives = 0;

	instance_destroy(Player, false);
	instance_destroy(Flower, false);
	instance_destroy(Honey, false);
	instance_destroy(Bullet, false);
	instance_destroy(EnemyBullet, false);
	instance_destroy(Mites, false);
	instance_destroy(HummingBird, false);
	instance_destroy(Wasp, false);
	instance_destroy(PowerUp, false);

	instance_create_layer(x, y,"Instances", Player);
	
	unpauseGame();
}

//Creates a new powerUp saves its ID and type, then deactivates it to spawn it ata random location at the right moment. 
function generateNextPowerUp() {
	nextPowerUp = instance_create_layer(x,y,"Instances", PowerUp);
	global.nextPowerUpType = nextPowerUp.powerType;
	instance_deactivate_object(nextPowerUp);
}


//Executes the code to check if a powerUp should be spawned, spawn it, generatea new one, or decrement the timer
function handlePowerUpSpawning() {
	if (powerUpCD == 0) {
		instance_activate_object(nextPowerUp);
		nextPowerUp.x = irandom_range(32, room_width - 32);
		nextPowerUp.y = -100;
	
		generateNextPowerUp();
	
		powerUpCD = POWER_UP_SPAWNRATE/(global.pace/global.MINPACE);
	}
	else powerUpCD = max(0, powerUpCD - 1);	
}

//Executes the code to check if a powerUp should be spawned, spawn it, generatea new one, or decrement the timer
function handleFlowerSpawning() {
	if (flowerCD == 0) {
		var nextFlower = instance_create_layer(x,y,"Instances", Flower);
		nextFlower.x = irandom_range(32, room_width - 32);
		nextFlower.y = -256;
	
		flowerCD = FLOWER_SPAWNRATE/(global.pace/global.MINPACE);
	}
	else flowerCD = max(0, flowerCD - 1);
}

function spawnBoss() {
	var boss = instance_create_layer(room_width/2, room_height/8,"Instances", Wasp);
	boss.enemy_health = 10 *  (global.pace/global.MINPACE);
}


if (global.debug) {
	//instance_create_layer(896, 736, "Instances", testingIncrementer);
	//instance_create_layer(896, 992, "Instances", testingDecrementer);
}

audio_play_sound(sound_gamemusic, 10, 1);

myRestartButton = instance_create_layer(room_width/2, room_height/2, "GUI", restartButton);
myDynamicButton = instance_create_layer(room_width/2, room_height/2 + 128, "GUI", dynamicButton);
myDebugButton1 = instance_create_layer(room_width/2 - 200, room_height/2 - 128, "GUI", secretButtonOne);
myDebugButton2 = instance_create_layer(room_width/2 + 200, room_height/2 - 128, "GUI", secretButtonTwo);


instance_deactivate_object(myRestartButton);
instance_deactivate_object(myDynamicButton);
instance_deactivate_object(myDebugButton1);
instance_deactivate_object(myDebugButton2);

function pauseGame() {
	global.isPaused = true
	layer_vspeed(layer_get_id("Background"), 0);
	instance_activate_object(myRestartButton);
	instance_activate_object(myDynamicButton);
	instance_activate_object(myDebugButton1);
	instance_activate_object(myDebugButton2);
	audio_pause_sound(sound_gamemusic);
	audio_pause_sound(sound_waspmusic);
}

function unpauseGame() {
	global.isPaused = false
	layer_vspeed(layer_get_id("Background"), global.bckgrnd);
	instance_deactivate_object(myRestartButton);
	instance_deactivate_object(myDynamicButton);
	instance_deactivate_object(myDebugButton1);
	instance_deactivate_object(myDebugButton2);
	audio_resume_sound(sound_gamemusic);
	audio_resume_sound(sound_waspmusic);
}


function factFormat(index) {
	var og = ds_list_find_value(factsList, index);
	var threshold = 15;
	var lastSpace = 0;
	var result = "";
	for (var i = 1; i <= string_length(og); i++) {
		
		if i + threshold > string_length(og) {
			result += string_copy(og, i, string_length(og));
			break;
		}
		
		var temp = string_copy(og, i, min(string_length(og), i + threshold));
		lastSpace = string_last_pos(" ", temp);
		if string_char_at(temp, string_length(temp)) != " " {
			result += string_copy(temp, 1, lastSpace-1) + "\n";
			i += lastSpace - 1;
		}
		else {
			result += string_copy(temp, 1, string_length(temp)-1) + "\n";
			i += threshold;
		}
		
	}
	return result;
}

