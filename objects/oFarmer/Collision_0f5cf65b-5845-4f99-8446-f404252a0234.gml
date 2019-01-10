keyAttack = keyboard_check(vk_space);
if (keyAttack) {
	instance_create_layer(other.x, other.y, layer, oFly1Dead);
	instance_destroy(other);
	global._score += 8;
}
else
	room_goto(3);