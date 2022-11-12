/// @description Insert description here
// You can write your code in this editor

partSys = part_system_create_layer("Instances", false);


particle_Bullet = part_type_create();

part_type_sprite(particle_Bullet, s_Dust, 0, 0 , 0);
part_type_size(particle_Bullet, 1, 2, .1, 0);
part_type_life(particle_Bullet, 10, 20);
part_type_alpha3(particle_Bullet, 1, 0.7, .2);
part_type_orientation( particle_Bullet, 0, 360, 0, 1, 0);

part_type_direction( particle_Bullet, 100, 440, 0, 1);
//part_type_color3(particle_Bullet, c_white, c_gray, c_black);
