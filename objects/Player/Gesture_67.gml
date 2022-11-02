/// @description Insert description here
// You can write your code in this editor


//If the event is missing the needed info exit
if(!ds_map_exists(event_data, "posX")) exit;
else {
	//current position of finger relative to room
	var currX = event_data[?"posX"];
	var input = room_width/2 - currX; //Get the difference
	playerXInput = modulateInputs(input); //Push the value into a function to attenuate it
	insDebug1 = playerXInput;
}
