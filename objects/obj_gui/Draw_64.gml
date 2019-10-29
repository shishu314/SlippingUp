/// @description Insert description here
// You can write your code in this editor
var offset = 30

if (room == gameScreen){
	for (i=0; i<global.player1Lives; i++) {
		draw_sprite_ext(spr_heart, 0, 50+(offset*i), 50,.5,.5,0,c_white,1)
	}	

	for (i=0; i<global.player2Lives; i++) {
		draw_sprite_ext(spr_heart, 0, room_width-50-(offset*i), 50,.5,.5,0,c_white,1)
	}
}