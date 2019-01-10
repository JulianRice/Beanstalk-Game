if (x + 2*hsp > room_width-32 || x + 2*hsp < 32) {
	hsp *= -1;
	image_xscale *= -1;
}
	
x += hsp;