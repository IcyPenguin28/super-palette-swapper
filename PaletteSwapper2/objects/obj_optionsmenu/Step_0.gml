/// @description Insert description here
// You can write your code in this editor

// Set Controls
keyUp = input_check_pressed("up");
keyDown = input_check_pressed("down");
keyConfirm = input_check_pressed("confirm");
keyCancel = input_check_pressed("cancel");

// Set up navigation
if canInteract
{
	if keyCancel
	{
		if (global.paused)
		{
			// Pause menu version
			instance_create_depth(x, y, -20, obj_pausemenu)		// Create pause menu instance
			instance_destroy();									// Destroy self
		}
		else
		{
			// Title screen version
			canInteract = false;
			obj_camera.FollowTarget(inst_titlemenu_focus1)
			obj_mainmenu.canInteract = true;
			audio_sound_gain(mus_mainmenu, global.gain_bgm, 0.5);
			audio_sound_gain(mus_options, 0, 0.5);
		}
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