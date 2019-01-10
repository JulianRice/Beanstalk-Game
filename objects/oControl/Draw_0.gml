draw_set_font(fGame);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(camera_get_view_x(global.cam)+10, camera_get_view_y(global.cam) +10, "SCORE: " + string(global._score));