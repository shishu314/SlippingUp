/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("H"))) {
	if(obj_player2Aim.angle < 90) {
		obj_player2Aim.angle = (540 - obj_player2Aim.angle) % 360;
	}
	mspd -= acceleration;
	sprite_index = spr_player2_run;
	image_xscale = -1;
} else if(keyboard_check(ord("K"))) {
	if(obj_player2Aim.angle > 90) {
		obj_player2Aim.angle = (540 - obj_player2Aim.angle) % 360;
	}
	mspd += acceleration;
	sprite_index = spr_player2_run;
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
	sprite_index = spr_player2_idle;
}

if((image_xscale == 1 && collision_rectangle(x, y-15, x+15, y+sprite_height/2, obj_player1, false, false)) ||
   (image_xscale == -1 && collision_rectangle(x-15, y-15, x, y+sprite_height/2, obj_player1, false, false))) {
	if(mspd > 0){
		mspd = max(mspd - fric * 5, 0);
		obj_player1.mspd = max(mspd - fric * 5, 0);
	} else if(mspd < 0){
		mspd = min(mspd + fric * 5, 0);
		obj_player1.mspd = min(mspd + fric * 5, 0);
	}
}
if(collision_point(x, y+sprite_height, obj_player1, false, false)){
	y = obj_player1.y - obj_player1.sprite_height + 3;
	grounded = true;
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
		sprite_index = spr_player2_jump;
	} else {
		sprite_index = spr_player2_fall;
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

#region Throw snowball
if keyboard_check_released(ord("L")) && !hasThrown && currPower >= 10 {
	Player2ThrowSnowBall(x, y);
	hasThrown = true;
}
#endregion

#region Out of bounds
if(!fallen && y - abs(sprite_height/2) > room_height){
	global.player2Lives -= 1;
	fallen = true;
	alarm[0] = room_speed*1;
}
#endregion