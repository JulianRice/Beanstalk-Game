y -= global.RATE;

global.RATE += 0.0001;

camera_set_view_pos(global.cam, x, y-camera_get_view_height(global.cam)/2 - 16);