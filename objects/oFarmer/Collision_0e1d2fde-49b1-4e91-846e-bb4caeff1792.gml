keyAttack = keyboard_check(vk_space);
if (keyAttack) {
	instance_create_layer(other.x, other.y, layer, oFly2Dead);
	instance_destroy(other);
	global._score += 12;
}
else
	room_goto(3);