// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function executePlayerState(state){
	
	switch state {
		case playerStates.normal:
			executeNormal(); break;
			
		case playerStates.infected:
			executeInfected(); break;
			
		case playerStates.respawning:
			executeRespawning(); break;
			
		case playerStates.invincible:
			executeInvincible(); break;
			
		case playerStates.rapidfire:
			executeRapidFire(); break;
			
		default:
			break;	
	}
	
}

function executeNormal() {
	
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed;
	hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	handlePlayerShooting(spdMult * global.pace, 90);
	
}

function executeInfected() {
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed + maxHSpeed*getRandomAmplitude(global.infectedTIME - stateDuration);
	insDebug1 = hspeed;
	hspeed = sign(hspeed) * min(2 * maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	handlePlayerShooting(spdMult * global.pace, 90);
	if (stateDuration <= 0) setState(playerStates.normal);
	else stateDuration--;
}

function executeRespawning() {
	
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed;
	hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	
	handlePlayerShooting(spdMult * global.pace, 90);
	
	if (stateDuration <= 0) setState(playerStates.normal);
	else stateDuration--;
	
}

function executeInvincible() {
	
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed;
	hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	
	handlePlayerShooting(spdMult * global.pace, 90);
	
	if (stateDuration <= 0) setState(playerStates.normal);
	else stateDuration--;
	
}

function executeRapidFire() {
	
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed;
	hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	
	handlePlayerShooting(spdMult * global.pace + (rateIncrease), 90 + random_range(-spread, spread));
	
	if (stateDuration <= 0) {
		FIRERATE *= rateIncrease;
		shootCD = FIRERATE;
		setState(playerStates.normal);
	}
	else stateDuration--;
	
}

//SetUp necessary state variables on entering a state
function setState(state) {
	switch state {
	case playerStates.normal:
		playerState = playerStates.normal;
		break;
			
	case playerStates.infected:
		if (playerState != playerStates.infected)
		{
			playerState = playerStates.infected;
			initInfected();
		}break;
			
	case playerStates.respawning:
		if (playerState != playerStates.respawning) 
		{
			playerState = playerStates.respawning;
			stateDuration = global.respawnTIME; //2 second
		}break;
			
	case playerStates.invincible:
		playerState = playerStates.invincible;
		stateDuration = global.invincibleTIME;
		break;
		
	case playerStates.rapidfire:
		playerState = playerStates.rapidfire;
		stateDuration = global.sprayingTIME;
		shootCD = 0;
		FIRERATE /= rateIncrease;
		break;
			
	default:
		break;	
	}
}

//Set infected duration and create the random coefficients for continuous random motion
function initInfected() {
	stateDuration = global.infectedTIME;
	
	var amplitude = 2.4;
	var phase = 90;
	var freq = 20;
	
	ds_list_clear(oscilateCoeffs);
	ds_list_add(oscilateCoeffs, random_range(-amplitude, amplitude));
	ds_list_add(oscilateCoeffs, random_range(-amplitude, amplitude));
	ds_list_add(oscilateCoeffs, random_range(-amplitude, amplitude));
	ds_list_add(oscilateCoeffs, random_range(-amplitude, amplitude));

	ds_list_clear(oscilateFreqs);
	ds_list_add(oscilateFreqs, random_range(-freq, freq));
	ds_list_add(oscilateFreqs, random_range(-freq, freq));
	ds_list_add(oscilateFreqs, random_range(-freq, freq));
	ds_list_add(oscilateFreqs, random_range(-freq, freq));

	ds_list_clear(oscilatePhases);
	ds_list_add(oscilatePhases, random_range(-phase, phase));
	ds_list_add(oscilatePhases, random_range(-phase, phase));
	ds_list_add(oscilatePhases, random_range(-phase, phase));
	ds_list_add(oscilatePhases, random_range(-phase, phase));
}