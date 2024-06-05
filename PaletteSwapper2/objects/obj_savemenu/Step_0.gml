/// @description Insert description here
// You can write your code in this editor

if global.gp_device == -1
{
	keyLeft = input_check_pressed(global.key_left);
	keyRight = input_check_pressed(global.key_right);
	keyConfirm = input_check_pressed(global.key_confirm);
	keyCancel = input_check_pressed(global.key_cancel);
}
else
{
	if global.gp_desc == "Nintendo Switch Pro Controller"
	{
		keyConfirm = input_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gp_device, gp_face2);
		keyCancel = input_check_pressed(ord("X"))  || gamepad_button_check_pressed(global.gp_device, gp_face1);
	}
	else
	{
		keyConfirm = input_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gp_device, gp_face1);
		keyCancel = input_check_pressed(ord("X"))  || gamepad_button_check_pressed(global.gp_device, gp_face2);
	}
	keyLeft = input_check_pressed(vk_left)  || gamepad_button_check_pressed(global.gp_device, gp_padl);
	keyRight = input_check_pressed(vk_right) || gamepad_button_check_pressed(global.gp_device, gp_padr);
}


if canInteract
{
	if keyLeft
	{
		audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
		if pos == 0
		{
			pos = maxpos;
		}
		else
		{
			pos --;
		}
	}
	
	if keyRight
	{
		audio_play_sound(snd_cursormove, 0, false, global.gain_sfx);
		if pos == maxpos
		{
			pos = 0;
		}
		else
		{
			pos ++;
		}
	}
	
	if keyCancel
	{
		canInteract = false;
		obj_camera.FollowTarget(inst_titlemenu_focus1)
		//obj_camera_target.x -= room_width /  3;
		obj_mainmenu.canInteract = true;
	}
	
	if keyConfirm
	{
		if obj_mainmenu.menuPos = mainmenu.newgame
		{
			with ( canvasinst[pos] )
			{
				audio_play_sound(snd_menuselection, 0, false, global.gain_sfx);
				chosen = true;
			}
		}
		else if obj_mainmenu.menuPos = mainmenu.loadgame
		{
			with ( canvasinst[pos] )
			{
				if file_exists(myFile)
				{
					audio_play_sound(snd_menuselection, 0, false, global.gain_sfx);
					chosen = true;
				}
			}
		}
	}
}

//show_debug_message(pos == 0 ? "pos is zero" : "pos is NOT zero");
//show_debug_message(keyLeft ? "keyLeft" : "not keyLeft");
//show_debug_message(canInteract ? "can interact" : "cannot interact");

x = xPoses[pos];
y = yPoses[pos];