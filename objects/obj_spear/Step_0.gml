/// @description Insert description here
// You can write your code in this editor
if(xVelocity > 0) {
	image_angle = 90;
} else {
	image_angle = 270;
}
event_inherited();
var checkPlayer;
if(fromPlayer1) {
	checkPlayer = collision_circle(x, y, sprite_width/2, obj_player2, false, false);
} else {
	checkPlayer = collision_circle(x, y, sprite_width/2, obj_player1, false, false);	
}
if(checkPlayer != noone) {
	instance_destroy();
	audio_play_sound(sfx_hit, 1, false);
	velocityRatio = xVelocity/maxVelocity;
	knockback = velocityRatio * global.snowKnockbackVelocity;
	checkPlayer.mspd += knockback;
}
