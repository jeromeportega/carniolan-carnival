/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	if global.debugToggle1 and global.debugToggle2 {
		global.debug = !global.debug;
		global.debugToggle1 = false;
		global.debugToggle2 = false;
	}
	exit
}
else if (global.lives <= 0) {
	global.gameOver = true;
	global.adRoll = random(1);
	audio_stop_sound(sound_enemybullet_ouch);
	audio_play_sound(sound_gameover, 2, 0);
	//global.adRoll = 0; //For debug
	pauseGame();
	
}
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
