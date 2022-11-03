/// @description Insert description here
// You can write your code in this editor
if (playerState != playerStates.respawning || playerState != playerStates.invincible)
{
	global.lives--;
	setState(playerStates.respawning);
	instance_destroy(other, true);
}


