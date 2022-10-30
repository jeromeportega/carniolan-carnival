/// @description Insert description here
// You can write your code in this editor


hspeed += sign(playerXInput)*(abs(playerXInput) - .2) * maxHAccel;

hspeed = sign(hspeed) * min(maxHSpeed, abs(hspeed));

if (abs(playerXInput) <= .2) hspeed = sign(hspeed) * max(0, abs(hspeed) - abs(playerXInput/.2)*maxHAccel);


