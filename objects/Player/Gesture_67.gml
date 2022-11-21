/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	exit
}

//If the event is missing the needed info exit
if(!ds_map_exists(event_data, "posX")) exit;
else {
	//Set the target to the room relative X position of the Player's finger
	targetX = event_data[?"posX"];
}
