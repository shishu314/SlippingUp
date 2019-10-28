/// @description Insert description here
// You can write your code in this editor
event_inherited();
checkPlayer1 = collision_circle(x, y, sprite_width/2, obj_player1, false, false);
if(checkPlayer1 != noone) {
	instance_destroy();
	audio_play_sound(sfx_hit, 1, false);
	currVelocity = sqrt(xVelocity * xVelocity + yVelocity * yVelocity);
	velocityRatio = currVelocity/maxVelocity;
	xKnockback = (xVelocity/currVelocity)*velocityRatio * global.snowKnockbackVelocity;
	checkPlayer1.mspd += xKnockback;
	if(yVelocity < 0) {
		if(!checkPlayer1.grounded) {
			yKnockback = (yVelocity/currVelocity)*velocityRatio * global.snowKnockbackVelocity;
			checkPlayer1.jumpAmt -= yKnockback;
		}
	}
}