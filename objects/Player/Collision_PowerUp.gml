/// @description Insert description here
// You can write your code in this editor

if (other.powerType == 0) {
	setState(playerStates.invincible);
}
else if (other.powerType == 1) {
	setState(playerStates.rapidfire);
}

instance_destroy(other);

