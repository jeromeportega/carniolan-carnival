/// @description Insert description here
// You can write your code in this editor

if (other.type == 0) {
	setState(playerStates.invincible);
}
else if (other.type == 1) {
	setState(playerStates.spraying);
}

instance_destroy(other);

