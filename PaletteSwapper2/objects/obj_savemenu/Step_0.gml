/// @description Insert description here
// You can write your code in this editor

keyConfirm = keyboard_check_pressed(ord("Z"));
keyCancel = keyboard_check_pressed(ord("X"));
keyLeft = keyboard_check_pressed(vk_left);
keyRight = keyboard_check_pressed(vk_right);

if canInteract
{
	if keyLeft
	{
		audio_play_sound(snd_cursormove, 0, false);
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
		audio_play_sound(snd_cursormove, 0, false);
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
		obj_camera_target.x -= room_width /  3;
		obj_mainmenu.canInteract = true;
	}
	
	if keyConfirm
	{
		if obj_mainmenu.menuPos = mainmenu.newgame
		{
			with collision_line(x, y, x, 1080, obj_savecanvas, false, true)
			{
				audio_play_sound(snd_menuselection, 0, false);
				chosen = true;
			}
		}
		else if obj_mainmenu.menuPos = mainmenu.loadgame
		{
			with collision_line(x, y, x, 1080, obj_savecanvas, false, true)
			{
				if file_exists(myFile)
				{
					audio_play_sound(snd_menuselection, 0, false);
					chosen = true;
				}
			}
		}
	}
}

show_debug_message(pos == 0 ? "pos is zero" : "pos is NOT zero");
show_debug_message(keyLeft ? "keyLeft" : "not keyLeft");
show_debug_message(canInteract ? "can interact" : "cannot interact");

if canInteract && keyLeft && pos == 0
{
	show_debug_message("wtf");
}


x = xPoses[pos];
y = yPoses[pos];