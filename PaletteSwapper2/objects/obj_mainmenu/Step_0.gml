/// @description Insert description here
// You can write your code in this editor

var gp = global.gp_device;

if gp == -1
{
	keyLeft = keyboard_check_pressed(vk_left);
	keyRight = keyboard_check_pressed(vk_right);
	confirmButton = keyboard_check_pressed(ord("Z"));
}
else
{
	keyLeft = keyboard_check_pressed(vk_left) ||
		//abs(min(0,gamepad_axis_value(gp, gp_axislh))) ||
		gamepad_button_check_pressed(gp, gp_padl);
	keyRight = keyboard_check_pressed(vk_right) ||
		//max(0,gamepad_axis_value(gp, gp_axislh)) ||
		gamepad_button_check_pressed(gp, gp_padr);
	confirmButton = keyboard_check_pressed(ord("Z")) ||
		gamepad_button_check_pressed(gp, gp_start) ||
		gamepad_button_check_pressed(gp, gp_face1);
}

if (audio_is_playing(mus_mainmenu))
{
	y = lerp(y, 900, 0.1);
}

if round(y) == 900
{
	canInteract = true;
}

image_index = menuPos;

if canInteract
{
	if keyLeft
	{
		audio_play_sound(snd_cursormove, 0, false);
		if menuPos == 0
		{
			menuPos = maxMenuPos - 1;
		}
		else
		{
			menuPos --;
		}
	}

	if keyRight
	{
		audio_play_sound(snd_cursormove, 0, false);
		if menuPos == maxMenuPos - 1
		{
			menuPos = 0;
		}
		else
		{
			menuPos ++;
		}
	}

	if confirmButton
	{
		audio_play_sound(snd_menuselection, 0, false);
		switch (menuPos)
		{
			case mainmenu.newgame:
				room_goto(rm_introstage);
				break;
			case mainmenu.loadgame:
				break;
			case mainmenu.options:
				break;
			case mainmenu.credits:
				break;
			case mainmenu.quitgame:
				game_end();
				break;
		}
	}	
}