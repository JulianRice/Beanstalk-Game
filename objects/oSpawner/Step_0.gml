//Initialization
i = 0;
if (cooldown >= global.GROUND_RATE) {
	ds_list_shuffle(currentPlatforms);
	var number = irandom_range(1, 4);
	var sound = irandom_range(1, 3);
	while (!satisfied) {
		randomize();
		var cameraX = camera_get_view_x(global.cam);
		var cameraY = camera_get_view_y(global.cam);
		var newX = irandom_range(cameraX + 48, cameraX + global.cameraW - 48);
		var newY = irandom_range(cameraY + 48, cameraY + global.cameraH - 48);
		var playerX = oFarmer.x;
		var playerY = oFarmer.y;
		if (ds_list_size(currentPlatforms) == 0) {
				break;
		}
		else {
			for (i = 0; i < ds_list_size(currentPlatforms); i++) {
				if (instance_exists(currentPlatforms[| i])) {
					var oldX = currentPlatforms[| i].x;
					var oldY = currentPlatforms[| i].y;
					show_debug_message("OldX - NewX: " + string(oldX) + " and " + string(newX));
					if (abs(oldX - newX) < 32 && abs(oldY - newY) < 32)
						break;
				
					else if (abs(newY - playerY) > 140 || newY - playerY > 64)
						break;
				
					else if (abs(newX - playerX) < 24 || abs(newY - playerY) < 8)
						break;
					
					else
						satisfied = true;
				}
			}
		}
	}
	switch (number) {
		case 1:
			objectToUse = oGround1;
			instance_create_layer(newX, newY, layer, oCutEffect);
			instance_create_layer(newX-16, newY, layer, oCutEffect);
			instance_create_layer(newX-32, newY, layer, oCutEffect);
			instance_create_layer(newX+16, newY, layer, oCutEffect);
			break;
		case 2:
			objectToUse = oGround2;
			instance_create_layer(newX+8, newY, layer, oCutEffect);
			instance_create_layer(newX-8, newY, layer, oCutEffect);
			instance_create_layer(newX-24, newY, layer, oCutEffect);
			break;
		case 3:
			objectToUse = oGround3;
			instance_create_layer(newX, newY, layer, oCutEffect);
			instance_create_layer(newX-16, newY, layer, oCutEffect);
			break;
		case 4:
			objectToUse = oGround4;
			instance_create_layer(newX, newY, layer, oCutEffect);
			instance_create_layer(newX-16, newY, layer, oCutEffect);
			instance_create_layer(newX-32, newY, layer, oCutEffect);
			instance_create_layer(newX+16, newY, layer, oCutEffect);
			break;
		case 5:
			objectToUse = oGround5;
			break;
		case 6:
			objectToUse = oGround6;
			break; 
	}
	
	switch (sound) {
		case 1: 
			soundToPlay = sound_plant_grow_1;
			break;
		case 2:
			soundToPlay = sound_plant_grow_2;
			break;
		case 3: 
			soundToPlay = sound_plant_grow_3;
			break;
	}
	
	with (instance_create_layer(newX, newY, layer, objectToUse)) {
		ds_list_add(other.currentPlatforms, object_index);	
	}
	audio_play_sound(soundToPlay, 3, false);
	
	cooldown = 0;
	global.GROUND_RATE -= 1;
	if (global.GROUND_RATE <= 45)
		global.GROUND_RATE = 45;
	satisfied = false;
}
else 
	cooldown++;

if (bucketCooldown == nextCooldown/2) {
	nextCooldown = irandom_range(530, 800);
	nextCooldown = floor(nextCooldown);
	if (nextCooldown % 2 != 0)
		nextCooldown -= 1;
	var yesNo = irandom_range(0, 1);
	if (yesNo == 1) {
		with instance_create_layer(x, y, layer, oWaterBucket) {
			GenerateCoord(id);	
		}
	}
	bucketCooldown = 0;
}
else 
	bucketCooldown ++;

if (hedgeCooldown == nextCooldown) {
	var yesNo = irandom_range(0, 3);
	nextCooldown = irandom_range(550, 650);
	nextCooldown = floor(nextCooldown);
	if (nextCooldown % 2 != 0)
		nextCooldown -= 1;
	if (yesNo == 1) { //Yes 
		with instance_create_layer(x, y, layer, oScissors) {
			GenerateCoord(id);	
		}
	}
	hedgeCooldown = 0;
}
else
	hedgeCooldown++;