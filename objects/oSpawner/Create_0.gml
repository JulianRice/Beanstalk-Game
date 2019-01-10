global.GROUND_RATE = 90;
cooldown = global.GROUND_RATE;
bucketCooldown = 300;
hedgeCooldown = 600;
nextCooldown = 600;
i = 0;
satisfied = false;
currentPlatforms = ds_list_create();

global.cameraW = camera_get_view_width(global.cam);
global.cameraH = camera_get_view_height(global.cam);

objectToUse = oGround1; //Default