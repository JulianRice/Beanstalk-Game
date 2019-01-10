

object = argument0;

var cameraX = camera_get_view_x(global.cam);
var cameraY = camera_get_view_y(global.cam);
var newX = irandom_range(cameraX + 48, cameraX + global.cameraW - 48);
var newY = irandom_range(cameraY + 48, cameraY + global.cameraH - 48);

object.x = newX;
object.y = newY;