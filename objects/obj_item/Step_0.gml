/// @description Insert description here
// You can write your code in this editor
#region platform collision
checkPlat = instance_place(x, y, obj_platform);
if(checkPlat != noone) {
	if (stuck == false){
		audio_play_sound(sfx_spear_fall, 1, false);
	}
	stuck = true;
	yVelocity = 0;
	if(checkPlat.y > y){
		y = checkPlat.y - abs(checkPlat.sprite_height/2) - abs(sprite_height/4);
	}
}
#endregion

#region Dropping
y += yVelocity;
yVelocity += global.gravAmt/4;
#endregion