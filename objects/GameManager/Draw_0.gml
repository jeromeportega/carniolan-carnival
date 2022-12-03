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
	draw_text(x_align, 400 + y_offset, "RewardedLoaded: " + string(AdMob_RewardedVideo_IsLoaded()));
	draw_text(x_align, 440 + y_offset, "LimiterTime: " + string(current_time - global.lastAdTime));
}


//Drawing lives counter
draw_sprite_ext(s_Player, 0, 64, 64, 4, 4, 0, c_white, 1);
draw_set_color(c_white);
draw_set_font(LivesFont);
draw_text(96, 64, "  X  " + string(global.lives));


if(global.gameOver) {
	var xalign = -98;
	var yalign = -150;
	draw_sprite(s_GameOver, 0, room_width/2 + xalign, room_height/2 + yalign);
	draw_set_font(gameoverPointsFont);
	draw_text(room_width/2 + xalign -16, room_height/2 + yalign, string(floor(global.distance) + 100*global.score))
}
else
{
	var xalign = -210;
	var yalign = -200;
	draw_set_font(LivesFont);
	draw_text(room_width/2 - 96, 64, string(floor(global.distance) + 100*global.score));
	
	draw_set_font(gameoverPointsFont);
	draw_set_color(c_black);
	if (global.isPaused)
	{
		draw_sprite(s_Blank, 0, room_width/2, room_height/2 - 350)
		draw_text(room_width/2 + xalign -16, room_height/2 + yalign - 120, "High Score: \n" + string(global.highScore));
		
	}
	draw_set_color(c_white);
}

if global.isPaused {
	var xOff = 256+96;
	var yOff = 300;
	draw_set_font(LivesFont);
	draw_sprite(s_TextBack2,0, room_width/2, room_height/2 + yOff);
	draw_set_color(c_black);
	draw_text(room_width/2 - xOff, room_height/2 + yOff+32, factFormat(factPos));
	draw_set_color(c_white);
	

	
	
}
