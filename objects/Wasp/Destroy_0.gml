/// @description Insert description here
// You can write your code in this editor


global.gameState = 0;
audio_resume_sound(sound_gamemusic);
audio_stop_sound(sound_waspmusic);
global.bossCD = global.__BOSSSPAWNRATE

global.lives = min(20, global.lives + 1);

spawnHoney(x,y, 64, 20);
audio_play_sound(sound_waspdeath, 2, 0 );

