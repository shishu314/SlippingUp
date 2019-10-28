/// @description Insert description here
// You can write your code in this editor
if(room == startScreen) {
	if(keyboard_check_pressed(vk_space)) {
		room_goto_next();
		audio_play_sound(sfx_background, 1, true);
	}
}
