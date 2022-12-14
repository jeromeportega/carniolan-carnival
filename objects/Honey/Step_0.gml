/// @description Insert description here
// You can write your code in this editor

if (global.isPaused) {
	speed = 0
	exit
}

speed = global.pace;//*spdMult;

if (y >= deletionBoundary) instance_destroy(id, false);

var xspeed = dcos(direction)*speed;
var yspeed = -1*speed*dsin(direction);

xspeed = sign(xspeed)*max(0, (abs(xspeed) - .1));
yspeed = min(global.pace, (yspeed + .1));

if (xspeed != 0) {
	var dir = darctan(-yspeed/xspeed);
	if (sign(xspeed) == -1) dir += 180;
	direction = dir;
	speed = sqrt(power(xspeed, 2) + power(yspeed, 2));
} else {
	direction = 270;
	speed = global.pace;
}

/*
if direction != 270 {
	if direction >= 90 {
		direction = min(270, direction + dirBreak);
	}
	else if direction > 270 {
		direction = max(270, direction - dirBreak);	
	}
	else if direction > 0 {
		direction = max(0, direction - dirBreak);	
	}
	else {
		direction = 360;	
	}
}
*/

if (rotsign) image_angle +=1;
else image_angle -= 1;


if (x < 32) { //32 is half the width of sprite
	x = 32
	move_towards_point(room_width/2, room_height, global.pace*spdMult);
}; //cant go off left side of screen
else if ( x > room_width - 32) {
	x = room_width - 32;
	move_towards_point(room_width/2, room_height, global.pace*spdMult);
};
	



