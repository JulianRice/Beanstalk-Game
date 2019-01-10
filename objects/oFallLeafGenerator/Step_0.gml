if (counter == cooldown) {
	instance_create_layer(x, y, layer, oFallLeaf);
	counter = 0;
	cooldown = irandom_range(60, 160);
}
else
	counter++;