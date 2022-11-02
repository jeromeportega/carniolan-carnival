/// @description Insert description here
// You can write your code in this editor


if(!ds_map_exists(event_data, "posX")) exit;
else {
	var currX = event_data[?"posX"];
	var input = room_width/2 - currX;//startX - currX;
	if (input != pointer_null && abs(input) > room_width/2 ) startX = currX + sign(input)*room_width/2;
	playerXInput = modulateInputs(input);
	insDebug1 = modulateInputs(input);
}