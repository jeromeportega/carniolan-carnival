/// @description Insert description here
// You can write your code in this editor

partSys = part_system_create_layer("Particles", false);


particle_Bullet = part_type_create();

part_type_sprite(particle_Bullet, s_Dust, 0, 0 , 0);
part_type_size(particle_Bullet, 1, 2, .1, 0);
part_type_life(particle_Bullet, 10, 20);
part_type_alpha3(particle_Bullet, 1, 0.7, .2);
part_type_orientation( particle_Bullet, 0, 360, 0, 1, 0);

part_type_direction( particle_Bullet, 100, 440, 0, 1);



particle_Flower_Small = part_type_create();

part_type_sprite(particle_Flower_Small, s_Dust, 0, 0 , 0);
part_type_size(particle_Flower_Small, 1, 4, .1, 0);
part_type_life(particle_Flower_Small, 10, 40);
part_type_alpha3(particle_Flower_Small, 1, 0.4, 0);
part_type_orientation( particle_Flower_Small, 0, 360, 0, 1, 0);
part_type_speed( particle_Flower_Small, global.MINPACE/2, global.MINPACE*2, -.1, 0);
part_type_direction( particle_Flower_Small, 0, 360, 1, .1);
part_type_color3(particle_Flower_Small, c_green, c_yellow, c_white);

particle_Flower_Big = part_type_create();

part_type_sprite(particle_Flower_Big, s_Chunk, 0, 0 , 0);
part_type_size(particle_Flower_Big, 1, 4, .1, 0);
part_type_life(particle_Flower_Big, 20, 40);
part_type_alpha3(particle_Flower_Big, 1, 0.6, 0);
part_type_orientation( particle_Flower_Big, 0, 360, 1, 1, 1);
part_type_speed( particle_Flower_Big, global.MINPACE/2, global.MINPACE, -.1, 0);
part_type_direction( particle_Flower_Big, 0, 360, 1, 1);
part_type_color2(particle_Flower_Big, c_green, c_yellow);