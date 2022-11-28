/// @description Insert description here
// You can write your code in this editor
draw_self();
for (var i = 0; i < 3; i++) {
	var myX = x + 50*dcos(5*(2*time + 30*i))*dcos(2*time+30*i);
	var myY = y + 50*dcos(5*(2*time + 30*i))*dsin(2*time+30*i);
	draw_sprite_ext(s_Mites, image_index, myX, myY, scale, scale, image_angle, c_white, 1);	
}