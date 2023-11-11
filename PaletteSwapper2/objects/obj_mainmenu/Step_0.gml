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
	if (global.gp_desc == "Nintendo Switch Pro Controller")
	{
		confirmButton = keyboard_check_pressed(ord("Z")) ||
		gamepad_button_check_pressed(gp, gp_start) ||
		gamepad_button_check_pressed(gp, gp_face2);
	}
	else
	{
		confirmButton = keyboard_check_pressed(ord("Z")) ||
		gamepad_button_check_pressed(gp, gp_start) ||
		gamepad_button_check_pressed(gp, gp_face1);
	}
}

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
				self.canInteract = false;
				audio_sound_gain(mus_mainmenu, 0, 0.5);
				audio_sound_gain(mus_options, 0.5, 0.5);
				
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