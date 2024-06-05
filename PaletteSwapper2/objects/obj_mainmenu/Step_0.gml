/// @description Insert description here
// You can write your code in this editor

keyLeft = input_check_pressed("left");
keyRight = input_check_pressed("right");
confirmButton = input_check_pressed("confirm");

var _ytarget = 900;	// Final position of obj_mainmenu
var _interacttarget = _ytarget + 100;	// Position where player can interact, just before stopping.

if (audio_sync_group_is_playing(obj_title.menuMusic))
{
	y = lerp(y, _ytarget, 0.1);
}

// Interact when told to by obj_title

image_index = menuPos;

if canInteract
{
	if keyLeft
	{
		audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
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
		audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
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
		audio_play_sound(snd_menuselection, 0, false, global.gain_sfx);
		
		switch (menuPos)
		{
			case mainmenu.newgame:
				obj_savemenu.canInteract = true;
				//obj_camera_target.x += room_width /  3;
				self.canInteract = false;
				
				obj_camera.FollowTarget(inst_titlemenu_focus2);
				break;
			case mainmenu.loadgame:
				obj_savemenu.canInteract = true;
				//obj_camera_target.x += room_width /  3;
				self.canInteract = false;
				
				obj_camera.FollowTarget(inst_titlemenu_focus2);
				break;
			case mainmenu.options:
				obj_optionsmenu.canInteract = true;
				self.canInteract = false;
				audio_sound_gain(mus_mainmenu, 0, 0.5);
				audio_sound_gain(mus_options, global.gain_bgm, 0.5);
				
				obj_camera.FollowTarget(inst_titlemenu_focus3);
				break;
			case mainmenu.credits:
				break;
			case mainmenu.quitgame:
				game_end();
				break;
		}
	}	
}