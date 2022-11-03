/// @description Insert description here
// You can write your code in this editor

//Sets the appropriate shader for the player for the current frame, based on playerState
configurePlayerShader();

//Actually draw the sprite
draw_self();

//Clears the select shader and restores to default. Effectively like closing a scanner.
//If forgotten shader will be applied to all subsequent draw calls.
shader_reset();

//Drawing debug info for stateMachine
draw_text(room_width/2, 100, string(playerState));


