/// @description Insert description here
// You can write your code in this editor
event_inherited();
var player1 = instance_place(x, y, obj_player1);
if(player1 != noone) {
	player1.hasSpear = true;
	instance_destroy();
}
var player2 = instance_place(x, y, obj_player2);
if(player2 != noone) {
	player1.hasSpear = true;
	instance_destroy();
}