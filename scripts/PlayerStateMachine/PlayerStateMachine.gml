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
			
		default:
			break;	
	}
	
}

function executeNormal() {
	
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed;
	hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	handlePlayerShooting();
	
}

function executeInfected() {
	hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed + maxHSpeed*getRandomAmplitude(global.infectedTIME - infectedDuration);
	insDebug1 = hspeed;
	hspeed = sign(hspeed) * min(2 * maxHSpeed, abs(hspeed));
	if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);
	handlePlayerShooting();
	if (infectedDuration <= 0) setState(playerStates.normal);
	else infectedDuration--;
}

function executeRespawning() {
	
}

function executeInvincible() {
	
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
		break;
			
	case playerStates.invincible:
		break;
			
	default:
		break;	
	}
}

//Set infected duration and create the random coefficients for continuous random motion
function initInfected() {
	randomize();
	infectedDuration = global.infectedTIME;
	
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