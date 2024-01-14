/// @description Insert description here
// You can write your code in this editor

// Set Controls
var gp = global.gp_device;

if gp == -1
{
	keyUp = keyboard_check_pressed(global.key_up);
	keyDown = keyboard_check_pressed(global.key_down);
	keyLeft = keyboard_check_pressed(global.key_left);
	keyRight = keyboard_check_pressed(global.key_right);
	keyCancel = keyboard_check_pressed(global.key_cancel);
}
else
{
	keyUp = keyboard_check_pressed(global.key_up) ||
		//abs(min(0,gamepad_axis_value(gp, gp_axislv))) ||
		gamepad_button_check_pressed(gp, global.gp_up);
	keyDown = keyboard_check_pressed(global.key_down) ||
		//max(0,gamepad_axis_value(gp, gp_axislv)) ||
		gamepad_button_check_pressed(gp, global.gp_down);
	keyLeft = keyboard_check_pressed(global.key_left) ||
		//max(0,gamepad_axis_value(gp, gp_axisl)) ||
		gamepad_button_check_pressed(gp, global.gp_left);
	keyRight = keyboard_check_pressed(global.key_right) ||
		//max(0,gamepad_axis_value(gp, gp_axisl)) ||
		gamepad_button_check_pressed(gp, global.gp_right);
	keyCancel = keyboard_check_pressed(global.key_cancel) ||
		gamepad_button_check_pressed(gp, global.gp_cancel);
}

// Set up navigation
if keyCancel
{
	// Save selections (write ini)
	ini_open(global.options_file);
	ini_write_real("Video", "Scale", scale);
	ini_write_real("Video", "Fullscreen", window_get_fullscreen());
	global.video_scale = scale;
	ini_close();
	// Return to main options menu (create main options menu, destroy self)
	with instance_create_depth(x, y, -20, obj_optionsmenu)
	{
		canInteract = true;
	}
	instance_destroy();
}
	
// No key up or down because there are no other options

if keyRight || keyLeft
{
	// Will be -1 when left, +1 when right, 0 when both or neither.
	var dir = keyRight - keyLeft;
	
	if (scale == 1 && dir == -1)
	{
		// do nothing; cannot go past 1x scale
	}
	else if (scale == 4 && dir == 1)
	{
		// Set fullscreen
		window_set_fullscreen(true);
	}
	else if (window_get_fullscreen() && dir == 1)
	{
		// do nothing; you cannot go past fullscreen
	}
	else if (window_get_fullscreen() && dir == -1)
	{
		window_set_fullscreen(false);
		scale = 4;
	}
	else
	{
		// Wherever the cursor is, change its value by +/- 1x
		scale += sign(dir)
		
		// Apply scale to camera
		global.video_scale = scale;
		with (obj_camera)
		{
			resScale = global.video_scale;
			window_set_size(wRes*resScale,hRes*resScale);
			surface_resize(application_surface,wRes*resScale,hRes*resScale);
			display_set_gui_size(wRes,hRes);
		}
	}
	
	
	// Play sound after changing the SFX volume so the user can hear the difference
	audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
}