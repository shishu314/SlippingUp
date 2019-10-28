/// @description Insert description here
// You can write your code in this editor
event_inherited();
checkPlayer2 = collision_circle(x, y, sprite_width/2, obj_player2, false, false);
if(checkPlayer2 != noone) {
	instance_destroy();
	currVelocity = sqrt(xVelocity * xVelocity + yVelocity * yVelocity);
	velocityRatio = currVelocity/maxVelocity;
	xKnockback = (xVelocity/currVelocity)*velocityRatio * global.snowKnockbackVelocity;
	checkPlayer2.mspd += xKnockback;
	if(yVelocity < 0) {
		if(!checkPlayer2.grounded) {
			yKnockback = (yVelocity/currVelocity)*velocityRatio * global.snowKnockbackVelocity;
			checkPlayer2.jumpAmt -= yKnockback;
		}
	}
}