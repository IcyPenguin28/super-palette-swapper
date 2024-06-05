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
	ini_write_real("Audio", "BGM Volume", bgm_vol);
	ini_write_real("Audio", "SFX Volume", sfx_vol);
	
	global.gain_sfx = sfx_vol;
	ini_close();
	// Return to main options menu (create main options menu, destroy self)
	with instance_create_depth(x, y, -20, obj_optionsmenu)
	{
		canInteract = true;
	}
	instance_destroy();
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

if keyRight || keyLeft
{
	// Will be -1 when left, +1 when right, 0 when both or neither.
	var dir = keyRight - keyLeft;
	
	// Wherever the cursor is, change its value by 10%
	switch pos
	{
		case audiomenu.bgm:
			if (bgm_vol == 0 && sign(dir) == -1) || (bgm_vol == 1 && sign(dir) == 1)
			{
				// do nothing
			}
			else bgm_vol += 0.1 * sign(dir);
			
			// Set the in-game value
			global.gain_bgm = bgm_vol;
			
			// Immediately apply to the currently playing music.
			audio_sound_gain(mus_options, global.gain_bgm, 0);
			break;
		case audiomenu.sfx:
			if (sfx_vol == 0 && sign(dir) == -1) || (sfx_vol == 1 && sign(dir) == 1)
			{
				// do nothing
			}
			else sfx_vol += 0.1 * sign(dir);
			
			// Set the in-game value
			global.gain_sfx = sfx_vol;
			break;
	}
	
	// Play sound after changing the SFX volume so the user can hear the difference
	audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
}