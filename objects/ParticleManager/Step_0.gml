/// @description Insert description here
// You can write your code in this editor

part_type_speed( particle_Bullet, global.MINPACE, global.MAXPACE, -.1, 0);
part_type_life(particle_Bullet, 10/min(2, (global.pace/global.MINPACE)), 20/min(2, (global.pace/global.MINPACE)));

