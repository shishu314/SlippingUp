/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(room == startScreen) {
	//draw_set_color(c_navy);
	draw_text_transformed(room_width / 2, 1*room_height / 3, "Slipping Up", 1, 1, 0);
	draw_text_transformed(room_width / 2, 4*room_height / 5, "Press Space to Start", .5, .5, 0);
}

if(room == instructionScreen) {
	draw_text_transformed(room_width / 2, 1*room_height / 5, "Player 1 Controls", .5, .5, 0);
	draw_text_transformed(room_width / 2, 2*room_height / 5-25, "WAD to move, F to throw snowball", .5, .5, 0);
	draw_text_transformed(room_width / 2, 3*room_height / 5+25, "Player 2 Controls", .5, .5, 0);
	draw_text_transformed(room_width / 2, 4*room_height / 5, "UHK to move, L to throw snowball", .5, .5, 0);
}

if(room == endScreen) {
	//draw_set_color(c_navy);
	if(global.player1Lives == 0) {
		draw_text_transformed(room_width / 2, 1*room_height / 3, "Player 2 Wins!", 1, 1, 0);
	} else {
		draw_text_transformed(room_width / 2, 1*room_height / 3, "Player 1 Wins!", 1, 1, 0);
	}
	draw_text_transformed(room_width / 2, 4*room_height / 5, "Press Space to Restart", .5, .5, 0);
}