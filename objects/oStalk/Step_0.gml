if (image_index == 12) {
	if (y - 16 != 0) {
		image_speed = 0;
		image_index = image_number - 1;
		with (instance_create_layer(x, y-16, layer, oStalk)) {
			activated = true;
		}
	}
}