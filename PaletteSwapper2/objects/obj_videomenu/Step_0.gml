/// @description Insert description here
// You can write your code in this editor

// Set Controls
keyUp = input_check_pressed("up");
keyDown = input_check_pressed("down");
keyLeft = input_check_pressed("left");
keyRight = input_check_pressed("right");
keyConfirm = input_check_pressed("confirm");
keyCancel = input_check_pressed("cancel");

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
		global.video_scale = scale;
		with (obj_camera)
		{
			resScale = global.video_scale;
			window_set_size(wRes*resScale,hRes*resScale);
			surface_resize(application_surface,wRes*resScale,hRes*resScale);
			display_set_gui_size(wRes,hRes);
		}
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