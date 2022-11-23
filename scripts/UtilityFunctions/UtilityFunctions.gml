// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setDiffProfile(){
	global.pace = 1
}

function spawnHoney(centerX, centerY, radius, number) {
	
	for (var i = 0; i < number; i++) {
		var angle = random_range(0, 360);
		var newX = centerX + radius*dcos(angle);
		var newY = centerY + radius*dsin(angle);
		var hon = instance_create_layer(newX, newY, "Instances", Honey);
		
	}
	
}