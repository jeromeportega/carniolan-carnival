/// @description Insert description here
// You can write your code in this editor

//Tracking the gameDistance traveled as a means of trackign score and increasing difficulty
global.distance += pointsPerSec/global.FRAMERATE;

//If not in debug mode pace scales with distance, otherwise it is not scaled automatically for testing
if (!global.debug) global.pace = global.MINPACE + paceSlope*global.distance;

if (global.gameState == 0){
	handleFlowerSpawning();
	if (global.bossCD == 0){
		global.gameState = 1
		spawnBoss();
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

if (paused) {
	alarm[0]++
}
