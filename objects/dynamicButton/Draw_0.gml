/// @description Insert description here
// You can write your code in this editor


if (global.gameOver and AdMob_RewardedVideo_IsLoaded() and current_time - global.lastAdTime >= global.rewardedLimiter and global.adRoll <= power(.8, global.numRevives)*global.baseOfferChance) {
	sprite_index = s_watch;
	draw_self();
}
else if global.gameOver {
	
}
else {
	sprite_index = s_Continue;
	draw_self();
}



