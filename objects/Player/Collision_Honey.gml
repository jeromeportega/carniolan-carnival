/// @description Insert description here
// You can write your code in this editor

//Increment score and remove honey
global.score++;
instance_destroy(other, true);
audio_play_sound(sound_honey, 2, 0);




