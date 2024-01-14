/// @description Insert description here
// You can write your code in this editor

// Set Controls
var gp = global.gp_device;

if gp == -1
{
	keyUp = keyboard_check_pressed(global.key_up);
	keyDown = keyboard_check_pressed(global.key_down);
	keyConfirm = keyboard_check_pressed(global.key_confirm);
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
	keyConfirm = keyboard_check_pressed(global.key_confirm) ||
		gamepad_button_check_pressed(gp, global.gp_confirm);
	keyCancel = keyboard_check_pressed(global.key_cancel) ||
		gamepad_button_check_pressed(gp, global.gp_cancel);
}

// Set up navigation
if canInteract
{
	if keyCancel
	{
		canInteract = false;
		obj_camera.FollowTarget(inst_titlemenu_focus1)
		obj_mainmenu.canInteract = true;
		audio_sound_gain(mus_mainmenu, global.gain_bgm, 0.5);
		audio_sound_gain(mus_options, 0, 0.5);
	}
	
	if keyDown
	{
		audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
		if pos == maxpos
		{
			pos = 0;
		}
		else pos++;
	}
	
	if keyUp
	{
		audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
		if pos == 0
		{
			pos = maxpos;
		}
		else pos--;
	}
	
	// Define what each menu choice does on keyConfirm
	if keyConfirm
	{
		audio_play_sound(snd_menuselection, 0, false, global.gain_sfx);
		switch pos
		{
			case optionsmenu.audio:
				instance_create_depth(x, y, -20, obj_audiomenu)		// Create audio menu instance
				instance_destroy();									// Destroy self
				break;
			case optionsmenu.video:
				instance_create_depth(x, y, -20, obj_videomenu)		// Create audio menu instance
				instance_destroy();									// Destroy self
				break;
		}
	}
}