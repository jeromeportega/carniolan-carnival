/// @description Insert description here
// You can write your code in this editor

//If the player is in a damageable state, then damage the player
if (playerState != playerStates.respawning || playerState != playerStates.invincible)
{
	global.lives--; //Remove a life
	other.shouldSpawnGoodies = false; //Setting this to false means the flower will not spawn honey or mites
	setState(playerStates.respawning); //Enter respawn state
	instance_destroy(other, true);
}



