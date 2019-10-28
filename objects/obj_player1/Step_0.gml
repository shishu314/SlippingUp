/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("A"))) {
	mspd -= acceleration;
	sprite_index = spr_player1_run
	image_xscale = -1
} else if(keyboard_check(ord("D"))) {
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

#region Ground Check
if(jumpAmt<=0){
	hitPlat = instance_position(x, y+sprite_height/2, obj_platform);
	if (hitPlat == noone) {
		hitPlat = instance_position(x, y+sprite_height/2, obj_platform_melt);
	}
	if(hitPlat != noone) {
		y = hitPlat.y - hitPlat.sprite_height/2 - sprite_height/2;
		grounded = true;
	} else {
		grounded = false;
	}
}
#endregion

#region Aim
if(keyboard_check(ord("R"))) {
	obj_player1Aim.angle = (obj_player1Aim.angle + angleDelta)%360;
}

if(keyboard_check(ord("T"))) {
	obj_player1Aim.angle = (obj_player1Aim.angle - angleDelta)%360;
}
#endregion

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