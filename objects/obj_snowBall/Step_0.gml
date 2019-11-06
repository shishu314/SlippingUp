/// @description Insert description here
// You can write your code in this editor
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
	currVelocity = sqrt(xVelocity * xVelocity + yVelocity * yVelocity);
	velocityRatio = currVelocity/maxVelocity;
	xKnockback = (xVelocity/currVelocity)*velocityRatio * global.snowKnockbackVelocity;
	checkPlayer.mspd += xKnockback;
	if(yVelocity < 0) {
		if(!checkPlayer.grounded) {
			yKnockback = (yVelocity/currVelocity)*velocityRatio * global.snowKnockbackVelocity;
			checkPlayer.jumpAmt -= yKnockback;
		}
	}
}