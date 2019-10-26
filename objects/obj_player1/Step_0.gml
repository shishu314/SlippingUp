/// @description Insert description here
// You can write your code in this editor

#region Movement
if(keyboard_check(ord("A"))) {
	mspd -= acceleration;
} else if(keyboard_check(ord("D"))) {
	mspd += acceleration;	
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
		jumpAmt -= gravAmt;
	} else {
		jumpAmt += gravAmt;							
	}
	jumpTimer += 1/room_speed;
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
if(keyboard_check(ord("R"))) {
	obj_player1Aim.angle = (obj_player1Aim.angle + 1)%360;
}

if(keyboard_check(ord("T"))) {
	obj_player1Aim.angle = (obj_player1Aim.angle - 1)%360;
}
#endregion