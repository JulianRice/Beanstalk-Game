draw_set_font(fGame);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width/2, room_height/2-50, "Final Score: " + string(global._score));
text = ""
difference = 0;
if (global._score >= 2000) {
	text = "SS";
}
else if (global._score >= 1500) {
	text = "S";
	//I know I can use constants, but I am tired and drained... rip
	difference = 2000 - global._score;
}
else if (global._score >= 1200) {
	text = "A";
	difference = 1500 - global._score;
}
else if (global._score >= 800) {
	text = "B";
	difference = 1200 - global._score;
}
else if (global._score >= 500) {
	text = "C";
	difference = 800 - global._score;
}
else if (global._score >= 300) {
	text = "D";	
	difference = 500 - global._score;
}
else if (global._score >= 100) {
	text = "F";
	difference = 300 - global._score;
}
else {
	text = "F-";
	difference = 100 - global._score;
}

draw_text(room_width/2, room_height/2, "Grade: " + text);
draw_text(room_width/2, room_height/2+50, "Points until next rank: " + string(difference));