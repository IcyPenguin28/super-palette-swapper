/// @description Insert description here
// You can write your code in this editor

// Set Controls
keyUp = input_check_pressed("up");
keyDown = input_check_pressed("down");
keyConfirm = input_check_pressed("confirm");
keyCancel = input_check_pressed("cancel");

// Set up navigation
if keyCancel
{
	global.paused = false;
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
	
// Define what each menu choice does on keyConfirm
if keyConfirm
{
	audio_play_sound(snd_menuselection, 0, false, global.gain_sfx);
	switch pos
	{
		case pausemenu.resume:
			global.paused = false;								// Unpause game
			instance_destroy();									// Destroy self
			break;
		case pausemenu.options:
			instance_create_depth(x, y, -20, obj_optionsmenu)	// Create options menu instance
			instance_destroy();									// Destroy self
			break;
		case pausemenu.title:
			with instance_create_layer(0, 0, "Instances", obj_transition)
			{
				if (room == rm_worldmap)
				{
					target_room = rm_titlemenu;
				}
				else
				{
					target_room = rm_worldmap;
				}
			}
			break;
	}
}