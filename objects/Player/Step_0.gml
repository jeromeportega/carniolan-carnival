/// @description Insert description here
// You can write your code in this editor


hspeed = sign(playerXInput)*(abs(playerXInput) - .2) * maxHSpeed;//maxHAccel;

hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));

if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);


if (x < global.HORIZONTAL_BUFFER) x = global.HORIZONTAL_BUFFER;
else if (x > room_width - global.HORIZONTAL_BUFFER) x = room_width - global.HORIZONTAL_BUFFER;


if (shootCD == 0) {
	shoot(global.pace, 90);
	shootCD = FIRERATE;
}
else {
	shootCD = max(0, shootCD-1);
	
}

