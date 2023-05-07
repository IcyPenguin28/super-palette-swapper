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


if (keyboard_check_pressed(192))	// 192 = Tilde "~" key
{
	DEBUG ^= 1;
	
	obj_camerabounds.visible = DEBUG > 0;
	obj_trigger.visible = DEBUG > 0;
	obj_scenetrigger.visible = DEBUG > 0;
}

#endregion

