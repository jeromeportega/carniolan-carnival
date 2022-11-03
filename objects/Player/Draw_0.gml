/// @description Insert description here
// You can write your code in this editor

configurePlayerShader();

draw_self();
shader_reset();
//Drawing debug info for movement
draw_text(room_width/2, 100, string(playerState));


