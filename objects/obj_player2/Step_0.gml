/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("H"))) {
	if(obj_player2Aim.angle < 90) {
		obj_player2Aim.angle = (540 - obj_player2Aim.angle) % 360;
	}
	mspd -= acceleration;
	if (hasSpear) {
		sprite_index = spr_player2_run_spear;
	} else{
		sprite_index = spr_player2_run;
	}
	image_xscale = -1;
} else if(keyboard_check(ord("K"))) {
	if(obj_player2Aim.angle > 90) {
		obj_player2Aim.angle = (540 - obj_player2Aim.angle) % 360;
	}
	mspd += acceleration;
	if (hasSpear) {
		sprite_index = spr_player2_run_spear;
	} else{
		sprite_index = spr_player2_run;
	}
	image_xscale = 1;
}

else if(grounded) {
	if(mspd > 0) {
		mspd += global.iceSlip;
		if(mspd - fric < 0){
			mspd = 0;
		} else{
			mspd -= fric;
		}
	} else if (mspd < 0) {
		mspd -= global.iceSlip;
		if(mspd - fric > 0){
			mspd = 0;
		} else{
			mspd += fric;
		}
	}
	if (hasSpear) {
		sprite_index = spr_player2_idle_spear;
	} else{
		sprite_index = spr_player2_idle;
	}
}

x += mspd;
#endregion

#region Jumping
if not keyboard_check(ord("U")) {
	isJumping = false;
	jumpTimer = jumpTime;
}
if grounded {											
	jumpTimer = 0;
	jumpAmt = 0	;									
	
	if keyboard_check_pressed(ord("U")){	
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
		if (hasSpear) {
			sprite_index = spr_player2_jump_spear;
		} else{
			sprite_index = spr_player2_jump;
		}
	} else {
		if (hasSpear) {
			sprite_index = spr_player2_fall_spear;
		} else{
			sprite_index = spr_player2_fall;
		}
	}	
}
#endregion

event_inherited();
/*
#region Aim
if(keyboard_check(ord("O"))) {
	obj_player2Aim.angle = (obj_player2Aim.angle + angleDelta)%360;
}

if(keyboard_check(ord("P"))) {
	obj_player2Aim.angle = (obj_player2Aim.angle - angleDelta)%360;
}
#endregion
*/
#region Power
if(keyboard_check(ord("L")) && !hasThrown) {
	currPower = clamp(currPower +1, 0, maxPower);
} else {
	currPower = clamp(currPower - 5, 0, maxPower);
}
if(currPower == 0) {
	hasThrown = false;
}
#endregion

#region Throw
if keyboard_check_released(ord("L")) && !hasThrown && currPower >= 10 {
	if(hasSpear){
		Player2ThrowSpear(x,y);
	} else {
		Player2ThrowSnowBall(x, y);
	}
	hasThrown = true;
}
#endregion

#region Out of bounds
if(!fallen && y - abs(sprite_height/2) > room_height){
	global.player2Lives -= 1;
	if(hasSpear) {
		--global.spearCount;
	}
	fallen = true;
	alarm[0] = room_speed*1;
}
#endregion