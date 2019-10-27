/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("H"))) {
	mspd -= acceleration;
	sprite_index = spr_player2_run
	image_xscale = -1
} else if(keyboard_check(ord("K"))) {
	mspd += acceleration;
	sprite_index = spr_player2_run
	image_xscale = 1
}

else if(grounded) {
	if(mspd > 0) {
		mspd += global.iceSlip;
	} else if (mspd < 0) {
		mspd -= global.iceSlip;
	}
	sprite_index = spr_player2_idle
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
		sprite_index = spr_player2_jump
	} else {
		sprite_index = spr_player2_fall
	}	
}
#endregion

#region Ground Check
if(jumpAmt<=0){
	hitPlat = instance_position(x, y+sprite_height/2, obj_platform)
	if(hitPlat != noone) {
		y = hitPlat.y - hitPlat.sprite_height/2 - sprite_height/2;
		grounded = true;
	} else {
		grounded = false;
	}
}
#endregion

#region Aim
if(keyboard_check(ord("O"))) {
	obj_player2Aim.angle = (obj_player2Aim.angle + 1)%360;
}

if(keyboard_check(ord("P"))) {
	obj_player2Aim.angle = (obj_player2Aim.angle - 1)%360;
}
#endregion

#region Power
if(keyboard_check(ord("L"))) {
	currPower = clamp(currPower +1, 0, maxPower);
} else {
	currPower = clamp(currPower - 5, 0, maxPower);
}
#endregion