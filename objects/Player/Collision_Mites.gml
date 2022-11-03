/// @description Insert description here
// You can write your code in this editor
if (playerState != playerStates.respawning || playerState != playerStates.invincible)
{
	setState(playerStates.infected);
	instance_destroy(other, true);
}


