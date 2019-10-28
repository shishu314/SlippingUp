/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(room == startScreen) {
	draw_set_color(c_navy);
	draw_text_transformed(room_width / 2, 1*room_height / 5, "Slipping Up", 2, 2, 0);
	draw_text_transformed(room_width / 2, 4*room_height / 5, "Press Space to Start", 2, 2, 0);
}

if(room == endScreen) {
	draw_set_color(c_navy);
	if(global.player1Lives == 0) {
		draw_text_transformed(room_width / 2, 1*room_height / 5, "Player 2 Wins!", 2, 2, 0);
	} else {
		draw_text_transformed(room_width / 2, 1*room_height / 5, "Player 1 Wins!", 2, 2, 0);
	}
	draw_text_transformed(room_width / 2, 4*room_height / 5, "Press Space to Restart", 2, 2, 0);
}