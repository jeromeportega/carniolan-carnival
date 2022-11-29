/// @description Insert description here
// You can write your code in this editor

if (global.lives > 20) global.lives = 20;

if (global.isPaused) {
	if global.debugToggle1 and global.debugToggle2 {
		global.debug = !global.debug;
		global.debugToggle1 = false;
		global.debugToggle2 = false;
	}
	
	if factCD == 0 {
		factPos++;
		factCD = __factCD;
		if factPos >= ds_list_size(factsList) {
			factPos = 0;
			ds_list_shuffle(factsList);
		}
	}
	else{
		factCD = max(0, factCD - 1);
	}
	
	exit;
}
else if (global.lives <= 0) {
	global.gameOver = true;
	global.adRoll = random(1);
	audio_stop_sound(sound_enemybullet_ouch);
	audio_play_sound(sound_gameover, 2, 0);
	//global.adRoll = 0; //For debug
	pauseGame();
	exit;
}

global.bckgrnd = 5*global.pace/global.MAXPACE;
layer_vspeed(layer_get_id("Background"), global.bckgrnd);
//Tracking the gameDistance traveled as a means of trackign score and increasing difficulty
global.distance += pointsPerSec/global.FRAMERATE;

//If not in debug mode pace scales with distance, otherwise it is not scaled automatically for testing
global.pace = min(global.MAXPACE, global.MINPACE + paceSlope*global.distance);

if (global.gameState == 0){
	handleFlowerSpawning();
	if (global.bossCD == 0){
		global.gameState = 1
		spawnBoss();
		audio_pause_sound(sound_gamemusic);
		audio_play_sound(sound_waspmusic, 10, 1);
	}
	else{
		global.bossCD = max(0, global.bossCD-1);
	}
}
	handlePowerUpSpawning();
	
if (global.debug){
	lastFrame = currFrame
	currFrame = current_time;
	last5FPS[trackPos] = 1000/(currFrame - lastFrame);
	trackPos = (trackPos + 1) % 5;
}
