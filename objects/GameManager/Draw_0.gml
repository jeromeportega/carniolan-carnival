/// @description Insert description here
// You can write your code in this editor


//This is currently drawing some basic info to the screen to validate functionality
draw_set_font(LivesFont);
draw_text(40, 40, "Lives: " + string(global.lives));
draw_text(40, 80, "Score: " + string(global.score));
draw_text(40, 120, "Distance: " + string(floor(global.distance)));
draw_text(40, 160, "TotalScore: " + string(floor(global.distance) + 100*global.score));

