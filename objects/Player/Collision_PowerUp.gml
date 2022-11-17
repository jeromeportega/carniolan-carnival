/// @description Insert description here
// You can write your code in this editor

//Set playerstate to corresponding state to the powerup type
if (other.powerType == powerUps.shield) {
	setState(playerStates.invincible);
	audio_play_sound(sound_invinicible, 10, 0);
}
else if (other.powerType == powerUps.rapid) {
	setState(playerStates.rapidfire);
	audio_play_sound(sound_rapidfire, 10, 0);
}

instance_destroy(other);

