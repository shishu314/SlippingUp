/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("A"))) {
	if(obj_player1Aim.angle < 90) {
		obj_player1Aim.angle = (540 - obj_player1Aim.angle) % 360;
	}
	mspd -= acceleration;
	sprite_index = spr_player1_run
	image_xscale = -1
} else if(keyboard_check(ord("D"))) {
	if(obj_player1Aim.angle > 90) {
		obj_player1Aim.angle = (540 - obj_player1Aim.angle) % 360;
	}
	mspd += acceleration;	
	sprite_index = spr_player1_run
	image_xscale = 1
}

else if(grounded) {
	if(mspd > 0) {
		mspd += global.iceSlip;
	} else if (mspd < 0) {
		mspd -= global.iceSlip;
	}
	sprite_index = spr_player1_idle
}

x += mspd;
#endregion

#region Jumping
if not keyboard_check(ord("W")) {
	isJumping = false;
	jumpTimer = jumpTime;
}
if grounded {											
	jumpTimer = 0;
	jumpAmt = 0	;									
	
	if keyboard_check_pressed(ord("W")){	
		audio_play_sound(sfx_jump, 1, false)
	    jumpAmt = jumpMax;
		y -= jumpAmt;
		isJumping=true;
		grounded=false;	
	}
}else{													
	y -= jumpAmt;								
	if(jumpTimer >= jumpTime) {
		jumpAmt -= global.gravAmt;
	} else {
		jumpAmt += global.gravAmt;	
	}
	jumpTimer += 1/room_speed;
	
	if (jumpAmt > 0) {
		sprite_index = spr_player1_jump
	} else {
		sprite_index = spr_player1_fall
	}	
}
#endregion

event_inherited();
/*
#region Aim
if(keyboard_check(ord("R"))) {
	obj_player1Aim.angle = (obj_player1Aim.angle + angleDelta)%360;
}

if(keyboard_check(ord("T"))) {
	obj_player1Aim.angle = (obj_player1Aim.angle - angleDelta)%360;
}
#endregion
*/
#region Power
if(keyboard_check(ord("F"))) {
	currPower = clamp(currPower +1, 0, maxPower);
} else {
	currPower = clamp(currPower - 5, 0, maxPower);
}
#endregion

#region Throw snowball
if keyboard_check_released(ord("F")) {
	Player1ThrowSnowBall(x, y);
}
#endregion

#region Out of bounds
if(x+abs(sprite_width/2) < 0 || x - abs(sprite_width/2) > room_width || y+abs(sprite_height/2) < 0 || y - abs(sprite_height/2) > room_height){
	global.player1Lives -= 1;
}
#endregion