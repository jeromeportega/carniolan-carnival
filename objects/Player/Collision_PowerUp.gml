/// @description Insert description here
// You can write your code in this editor

//Set playerstate to corresponding state to the powerup type
if (other.powerType == powerUps.shield) {
	setState(playerStates.invincible);
	
}
else if (other.powerType == powerUps.rapid) {
	setState(playerStates.rapidfire);
	
}
else{
	global.lives = min(20, global.lives + 2);	
	audio_play_sound(sound_healthUp, 3, 0);
}
instance_destroy(other);

