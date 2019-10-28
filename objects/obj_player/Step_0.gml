/// @description Insert description here
// You can write your code in this editor
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
