/// @description Insert description here
// You can write your code in this editor


global.gameState = 0;
audio_resume_sound(sound_gamemusic);
audio_stop_sound(sound_waspmusic);
global.bossCD = global.__BOSSSPAWNRATE

for (var i = 0; i < 20; i++) {
	var honey = instance_create_layer(x, y, "Instances", Honey);
	
	honey.hspeed = random_range(-8, 8)
}
audio_play_sound(sound_waspdeath, 2, 0 );

