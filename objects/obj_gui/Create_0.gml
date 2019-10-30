/// @description Insert description here
// You can write your code in this editor

map_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,;:$ '!/?()";
bitmap_font = font_add_sprite_ext(spr_font, map_string, false, 0);

draw_set_font(bitmap_font);