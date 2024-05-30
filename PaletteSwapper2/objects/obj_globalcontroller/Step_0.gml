/// @description Insert description here
// You can write your code in this editor
global.gp_device = gamepad_detect_device();
// show_debug_message(gamepad_get_description(global.gp_device))
global.gp_desc = gamepad_get_description(global.gp_device);

#region DEBUG
var keyReset = keyboard_check_pressed(ord("R"));
if (keyReset)
{
	room_restart();
}

var keySuperReset = keyboard_check_pressed(ord("R")) && keyboard_check(vk_control);
if (keySuperReset)
{
	audio_stop_all();
	game_restart();
}

var keyScreencap = keyboard_check_pressed(vk_f12);
if (keyScreencap)
{
	screen_save("Super_Palette_Swapper_"+string(ind)+".png");
	ind++;
}


if (keyboard_check_pressed(192))	// 192 = Tilde "~" key
{
	DEBUG ^= 1;
	
	with (obj_camerabounds) {visible = DEBUG > 0;}
	with (obj_trigger) {visible = DEBUG > 0;}
	with (obj_scenetrigger) {visible = DEBUG > 0;}
}
#endregion

/*
TODO: Fix fucking pausing, holy shit, I cannot deal with this and final exams at the same time
Pausing will have to wait for Demo D at least

#region PAUSING
if (keyboard_check_pressed(global.key_pause) ||
	gamepad_button_check_pressed(global.gp_device, global.gp_pause))
{
	if (global.can_pause && !instance_exists(obj_pausemenu))
	{
		audio_play_sound(snd_pause, 0, false, global.gain_sfx);
		instance_create_depth(global.h_res / 2 - 64, global.v_res / 2 - 64, -20, obj_pausemenu);
	}
}
#endregion