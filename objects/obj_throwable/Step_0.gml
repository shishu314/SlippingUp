/// @description Insert description here
// You can write your code in this editor
#region movement
x += xVelocity;
#endregion

#region offScreen
if(x < sprite_width/2 || x - sprite_width/2 > room_width || y - sprite_height/2 > room_height) {
	instance_destroy();
}
#endregion

#region platform collision
checkPlat = collision_circle(x, y, sprite_width/2, obj_platform, false, false);
if(checkPlat != noone) {
	instance_destroy();
}
#endregion