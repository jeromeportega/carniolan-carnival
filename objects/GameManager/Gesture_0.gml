/// @description Insert description here
// You can write your code in this editor

if (GameManager.paused == true) {
	GameManager.paused = false
	instance_activate_all()
	surface_free(GameManager.paused_surface)
    GameManager.paused_surface = -1
}