/// @description Insert description here
// You can write your code in this editor


//This is currently drawing some basic info to the screen to validate functionality
if (global.debug) {
	draw_set_font(LivesFont);
	draw_text(40, 0, "FPS: " + string((last5FPS[0]+last5FPS[1]+last5FPS[2]+last5FPS[3]+last5FPS[4])/5));
	draw_text(40, 40, "Lives: " + string(global.lives));
	draw_text(40, 80, "Score: " + string(global.score));
	draw_text(40, 120, "Distance: " + string(floor(global.distance)));
	draw_text(40, 160, "TotalScore: " + string(floor(global.distance) + 100*global.score));
	draw_text(40, 200, "Pace: " + string(global.pace));
	draw_text(40, 240, "FlowerCD: " + string(flowerCD/global.FRAMERATE));
	draw_text(40, 280, "PowerUpCD: " + string(powerUpCD/global.FRAMERATE));
	draw_text(40, 320, "BossCD: " + string(global.bossCD/global.FRAMERATE));
}


