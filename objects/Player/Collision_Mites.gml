/// @description Insert description here
// You can write your code in this editor

//If the player is inan inectable state, then infect and destroy mites
if (playerState != playerStates.respawning || playerState != playerStates.invincible)
{
	setState(playerStates.infected);
	instance_destroy(other, true);
}


