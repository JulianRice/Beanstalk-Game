if (global._score != 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2 + 100, "This Session's Top Score: " + string(global._score));
}