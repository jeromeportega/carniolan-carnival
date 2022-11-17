/// @description Insert description here
// You can write your code in this editor

//If the player is ina damageable state, damage them
audio_play_sound(sound_enemybullet_ouch, 2, 0);
if (playerState != playerStates.respawning && playerState != playerStates.invincible)
{
	global.lives--; //Takea  life
	setState(playerStates.respawning); //Enter respawn state
	instance_destroy(other, true);
}


