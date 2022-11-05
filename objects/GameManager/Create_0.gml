/// @description Insert description here
// You can write your code in this editor

randomize();

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

global.infectedTIME = global.FRAMERATE * 10; // Ten second infection at start;
global.respawnTIME = global.FRAMERATE *1;
global.invincibleTIME = global.FRAMERATE * 5;
global.sprayingTIME = global.FRAMERATE * 5;

//For spawning powerUps and initial powerUp
nextPowerUp = instance_create_layer(x,y,"Instances", PowerUp);
global.nextPowerUpType = nextPowerUp.powerType;
instance_deactivate_object(nextPowerUp);
POWER_UP_SPAWNRATE = global.FRAMERATE * 10; //For testing 10 is aggressive
powerUpCD = POWER_UP_SPAWNRATE;


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
global.isPaused = false;

instance_destroy(Player, true);
instance_destroy(Flower, true);
instance_destroy(Honey, true);
instance_destroy(Bullet, true);
instance_destroy(EnemyBullet, true);
instance_destroy(Mites, true);
instance_destroy(HummingBird, true);
instance_destroy(Wasp, true);
instance_destroy(PowerUp, true);

instance_create_layer(x, y,"Instances", Player);
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
	
		powerUpCD = POWER_UP_SPAWNRATE;
	}
	else powerUpCD = max(0, powerUpCD - 1);	
}

//SetUp



