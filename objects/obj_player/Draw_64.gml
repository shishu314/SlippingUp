/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_gray);
draw_rectangle(x - 3*sprite_width/8, y + abs(sprite_height/4), x - sprite_width/2, y - abs(sprite_height/4), true);
draw_set_color(c_red);
var powerbarBottom = y + abs(sprite_height/4) - 1;
var powerbarMax = powerbarBottom - (y - abs(sprite_height/4) + 1);
draw_rectangle(x - 3*sprite_width/8, powerbarBottom, x - sprite_width/2, powerbarBottom - (currPower/maxPower) * powerbarMax, false);