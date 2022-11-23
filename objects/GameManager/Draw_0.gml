/// @description Insert description here
// You can write your code in this editor


//This is currently drawing some basic info to the screen to validate functionality
if (global.debug) {
	draw_set_font(LivesFont);
	var x_align = 50;
	var y_offset = 150;
	draw_text(x_align, 0 + y_offset, "FPS: " + string((last5FPS[0]+last5FPS[1]+last5FPS[2]+last5FPS[3]+last5FPS[4])/5));
	draw_text(x_align, 40 + y_offset, "Lives: " + string(global.lives));
	draw_text(x_align, 80 + y_offset, "Score: " + string(global.score));
	draw_text(x_align, 120 + y_offset, "Distance: " + string(floor(global.distance)));
	draw_text(x_align, 160 + y_offset, "TotalScore: " + string(floor(global.distance) + 100*global.score));
	draw_text(x_align, 200 + y_offset, "Pace: " + string(global.pace));
	draw_text(x_align, 240 + y_offset, "FlowerCD: " + string(flowerCD/global.FRAMERATE));
	draw_text(x_align, 280 + y_offset, "PowerUpCD: " + string(powerUpCD/global.FRAMERATE));
	draw_text(x_align, 320 + y_offset, "BossCD: " + string(global.bossCD/global.FRAMERATE));
	draw_text(x_align, 360 + y_offset, "Room: " + string(room == Room1));
}


//Drawing lives counter
draw_sprite_ext(s_Player, 0, 64, 64, 2, 2, 0, c_white, 1);
draw_set_font(LivesFont)
draw_text(96, 64, "  X  " + string(global.lives));