// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Calls the appropriate state function given current state
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

//Execute the players normal state routine
function executeNormal() {
	handlePlayerMovement(); 
	handlePlayerShooting(spdMult * global.pace, 90);
	
}

//Execute the players infected state routine for stateDuration then returns to normal
function executeInfected() {
	
	handlePlayerMovement(); //This is for the movement inputs
	
	//Shake the player's x location for the duration 
	x += maxHSpeed*getRandomAmplitude(global.infectedTIME - stateDuration);
	
	handlePlayerShooting(spdMult * global.pace, 90);
	if (stateDuration <= 0) setState(playerStates.normal); //When duration is over return to normal
	else stateDuration--;
}

//Execute the players respawn state routine for stateDuration then returns to normal
function executeRespawning() {
	//The state calls a different shader and prevents hostile collisions otherwise it is identical to normal
	handlePlayerMovement();	
	handlePlayerShooting(spdMult * global.pace, 90);
	
	if (stateDuration <= 0) setState(playerStates.normal);
	else stateDuration--;
	
}

//Execute the players invincible state routine for stateDuration then returns to normal
function executeInvincible() {
	
	//The state calls a different shader and prevents hostile collisions otherwise it is identical to normal
	handlePlayerMovement();
	handlePlayerShooting(spdMult * global.pace, 90);
	
	if (stateDuration <= 0) setState(playerStates.normal);
	else stateDuration--;
	
}

//Execute the players rapidFire state routine for stateDuration then returns to normal
function executeRapidFire() {
	
	handlePlayerMovement();
	
	//Shoot faster bullets, more often, but with a significant amount of spread
	handlePlayerShooting(spdMult * global.pace + (rateIncrease), 90 + random_range(-spread, spread));
	
	if (stateDuration <= 0) { //When duration is over, put shooting on cooldown, reset the FIRERATE to normal return to normal state
		FIRERATE *= rateIncrease;
		shootCD = FIRERATE;
		setState(playerStates.normal);
	}
	else stateDuration--;
	
}

//SetUp necessary state variables on entering a state
//Code that should only happen once when entering a state ideally goes here
function setState(state) {
	switch state {
	case playerStates.normal:
		playerState = playerStates.normal;
		break;
			
	case playerStates.infected:
		if (playerState != playerStates.infected) //We are disallowing chaining of infected state
		{
			playerState = playerStates.infected;
			initInfected();
		}break;
			
	case playerStates.respawning:
		if (playerState != playerStates.respawning) //Entering respawn while in respawn should never happen, this is a catch just in case
		{
			playerState = playerStates.respawning;
			stateDuration = global.respawnTIME; //2 second
		}break;
			
	case playerStates.invincible: //We are allowing powerUp chaining, its a buff to the player although unlikely/impossible to happen
		playerState = playerStates.invincible;
		stateDuration = global.invincibleTIME;
		break;
		
	case playerStates.rapidfire: //We are allowing powerUp chaining, its a buff to the player although unlikely/impossible to happen
		playerState = playerStates.rapidfire;
		stateDuration = global.sprayingTIME;
		if (playerState == playerStates.rapidfire) //Although we are allwoing chaining of the state, we cannot allow stacking of the rateIncrease
		{
			shootCD = 0; //When entering the state we refresh the cooldown to have an immediate impact
			FIRERATE /= rateIncrease; //We are increasing the firerate bya factor of rateIncrease
		}break;
			
	default:
		break;	
	}
}

//Set infected duration and create the random coefficients for continuous random motion
function initInfected() {
	stateDuration = global.infectedTIME;
	
	//These vary how chaotic and powerful the shaking is for being infected
	var amplitude = 8/4;
	var phase = 90;
	var freq = 20;
	
	//Clear the existing coefficients and randomly generate new ones
	//This makes each infection use a different wave function
	
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