/// @description Collision with Player Bullet

// Enemy takes a damage, bullet is removed from room.
enemy_health -= 1
instance_destroy(other.id)
audio_play_sound(sound_hit_flower_or_boss, 1, 0);

// Destroy wasp if wasp health below zero.
if (enemy_health  <= 0) {
	instance_destroy(id)
}

