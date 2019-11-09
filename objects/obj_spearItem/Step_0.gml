/// @description Insert description here
// You can write your code in this editor
event_inherited();
var player1 = instance_place(x, y, obj_player1);
if(player1 != noone) {
	if(!player1.hasSpear){
		player1.hasSpear = true;
		audio_play_sound(sfx_get_spear, 1, false);
		instance_destroy();
	}
}
var player2 = instance_place(x, y, obj_player2);
if(player2 != noone) {
	if(!player2.hasSpear){
		player2.hasSpear = true;
		audio_play_sound(sfx_get_spear, 1, false);
		instance_destroy();
	}
}