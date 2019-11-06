/// @description Insert description here
// You can write your code in this editor
if(room == startScreen) {
	if(keyboard_check_pressed(vk_space)) {
		room_goto_next();
	}
}

if(room == instructionScreen) {
	if(keyboard_check_pressed(vk_space)) {
		room_goto_next();
		audio_play_sound(sfx_background, 1, true);
		global.spearCount = 0;
	}
}

if(room == gameScreen) {
	SpawnParticles(random_range(0, room_width), -10, 2,  obj_snow)

	if(global.player1Lives == 0 || global.player2Lives == 0) {
		room_goto_next();
		audio_stop_sound(sfx_background);
	}
	#region Spear spawning
	var randomNum = random_range(0, 1000);
	if(randomNum < 2 && global.spearCount < 2){
		SpawnSpear();
	}
	#endregion
}

if(room == endScreen) {
	if(keyboard_check_pressed(vk_space)) {
		room_goto(startScreen);
		global.player1Lives = 3;
		global.player2Lives = 3;
	}
}