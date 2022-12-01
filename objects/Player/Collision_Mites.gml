/// @description Insert description here
// You can write your code in this editor

//If the player is inan inectable state, then infect and destroy mites
if (playerState != playerStates.respawning && playerState != playerStates.invincible)
{
	audio_play_sound(sound_mitestouchplayer, 3, 0);
	setState(playerStates.infected);
	instance_destroy(other, true);
}


