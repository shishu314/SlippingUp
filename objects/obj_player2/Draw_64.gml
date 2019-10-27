/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_rectangle(x-sprite_width/4, y-sprite_height/2 + 8, x + sprite_width/4, y-sprite_height/2, true);
draw_set_color(c_red);
var powerbarLeft = x-abs(sprite_width/4) + 1;
var powerbarMax = x + abs(sprite_width/4) - 1 - powerbarLeft;
draw_rectangle(powerbarLeft, y-abs(sprite_height/2) + 7, powerbarLeft + (currPower/maxPower) * powerbarMax, y-abs(sprite_height/2) + 1, false);