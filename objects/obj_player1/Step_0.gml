/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("A"))) {
	if(obj_player1Aim.angle < 90) {
		obj_player1Aim.angle = (540 - obj_player1Aim.angle) % 360;
	}
	mspd -= acceleration;
	if (hasSpear) {
		sprite_index = spr_player1_run_spear;
	} else{
		sprite_index = spr_player1_run;
	}
	image_xscale = -1;
} else if(keyboard_check(ord("D"))) {
	if(obj_player1Aim.angle > 90) {
		obj_player1Aim.angle = (540 - obj_player1Aim.angle) % 360;
	}
	mspd += acceleration;
	if (hasSpear) {
		sprite_index = spr_player1_run_spear;
	} else{
		sprite_index = spr_player1_run;
	}
	image_xscale = 1;
}

else if(grounded) {
	if(mspd > 0) {
		mspd += global.iceSlip;
		mspd -= fric;
	} else if (mspd < 0) {
		mspd -= global.iceSlip;
		mspd += fric;
	}
	if (hasSpear) {
		sprite_index = spr_player1_idle_spear;
	} else{
		sprite_index = spr_player1_idle;
	}
}

var player2 = instance_place(x, y, obj_player2);

if(player2 != noone){
	distance = player2.x - x;
	x -= distance/2;
	player2.x += distance/2;
	var p2Speed = player2.mspd;
	player2.mspd = mspd;
	mspd = p2Speed;
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
		if (hasSpear) {
			sprite_index = spr_player1_jump_spear;
		} else{
			sprite_index = spr_player1_jump;
		}
	} else {
		if (hasSpear) {
			sprite_index = spr_player1_fall_spear;
		} else{
			sprite_index = spr_player1_fall;
		}
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
if(keyboard_check(ord("F")) && !hasThrown) {
	currPower = clamp(currPower +1, 0, maxPower);
} else {
	currPower = clamp(currPower - 5, 0, maxPower);
}
if(currPower == 0) {
	hasThrown = false;
}
#endregion

#region Throw
if keyboard_check_released(ord("F")) && !hasThrown && currPower >= 10 {
	if(hasSpear){
		Player1ThrowSpear(x, y);
	} else {
		Player1ThrowSnowBall(x, y);
	}
	hasThrown = true;
}
#endregion

#region Out of bounds

if(!fallen && y - abs(sprite_height/2) > room_height){
	global.player1Lives -= 1;
	if(hasSpear) {
		--global.spearCount;
	}
	fallen = true;
	alarm[0] = room_speed*1;

}
#endregion