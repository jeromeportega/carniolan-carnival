/// @description Insert description here
// You can write your code in this editor
if (y >= deletionBoundary) instance_destroy(id, false);
if (hspeed != 0) hspeed = sign(hspeed)* max((abs(hspeed) - breaking), 0);
if (x < 32) { //32 is half the width of sprite
	x = 32
	hspeed = 0
}; //cant go off left side of screen
else if ( x > room_width - 32) {
	x = room_width - 32;
	hspeed = 0;
};
	



