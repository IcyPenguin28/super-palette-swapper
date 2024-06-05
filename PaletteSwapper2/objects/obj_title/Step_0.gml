/// @description Insert description here
// You can write your code in this editor
confirmButton = input_check_pressed("confirm");

switch(state)
{
	// Wait for confirm
	case(0):
		if (confirmButton)
		{
			audio_play_sound(snd_menuselection_final, 0, false, global.gain_sfx);
			audio_stop_sound(snd_wind);
			soundplayed = true;
			image_speed = 0.4;
			
			waitstep = 60;
			state = 1;
		}
		break;
	
	// Let sound play for a moment
	case(1):
		if (waitstep > 0)
		{
			waitstep -= 1;
		}
		else
		{
			obj_camera.FollowTarget(inst_titlemenu_focus1);
			waitstep = 40;
			state = 2;
		}
		break;
	
	// Move to menu
	case(2):
		if (waitstep > 0)
		{
			waitstep -= 1;
		}
		else
		{
			// Handle music synchronizaiton for options menu
			menuMusic = audio_create_sync_group(true);
			audio_play_in_sync_group(menuMusic, mus_mainmenu);
			audio_sound_gain(mus_mainmenu, global.gain_bgm, 0);
			audio_play_in_sync_group(menuMusic, mus_options);
			audio_sound_gain(mus_options, 0, 0);
			audio_start_sync_group(menuMusic);
			menuMusicTriggered = true;
			
			inMenu = true;
			obj_mainmenu.canInteract = true;
			state = 3;
		}
		break;
	
	// In Menu
	case(3):
		
		
		
		break;
}

#region DYNAMIC UI
var gpd = global.gp_desc;

switch (gpd)
{
	case "Nintendo Switch Pro Controller":
		sprite_index = spr_title_switch;
		break;
	case "XInput STANDARD GAMEPAD":
		sprite_index = spr_title_xbox;
		break;
	case "PLAYSTATION(R)3 Controller":
	case "Sony DualShock 4":
		sprite_index = spr_title_playstation;
		break;
	case "":
		sprite_index = spr_title_keyboard;
		break;
}

#endregion

