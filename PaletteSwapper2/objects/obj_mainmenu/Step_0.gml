/// @description Insert description here
// You can write your code in this editor

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
	if keyboard_check_pressed(vk_left)
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

	if keyboard_check_pressed(vk_right)
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

	if keyboard_check_pressed(ord("Z"))
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