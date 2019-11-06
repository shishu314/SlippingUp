/// @description Insert description here
// You can write your code in this editor

x += xspd
y += yspd/4

yspd += grav
image_angle += rot_spd

image_xscale -= size_decay/30
image_yscale -= size_decay/30

if (image_xscale < 0 or image_yscale < 0) {
	instance_destroy()
}